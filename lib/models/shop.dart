import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freshcart/models/address.dart';
import 'package:freshcart/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Shop extends ChangeNotifier {
  List<Product> _shop = [];
  List<Product> _cart = [];
  List<Address> _address = [];

  String get currentUserId => FirebaseAuth.instance.currentUser?.uid ?? '';

  List<Product> get shop => _shop;
  List<Product> get cart => _cart;
  List<Address> get address => _address;

  Shop() {
    _fetchProductsFromFirestore();
    _initializeAuthStateListener();
  }

  void _fetchProductsFromFirestore() {
    FirebaseFirestore.instance.collection('products').snapshots().listen(
      (querySnapshot) {
        _shop = querySnapshot.docs.map((doc) {
          return Product(
            name: doc['name'],
            price: doc['price'],
            quantity: doc['quantity'],
            imagePath: doc['image'],
          );
        }).toList();

        notifyListeners();
      },
      onError: (error) {
        print("Error fetching products from Firestore: $error");
      },
    );
  }

  void _initializeAuthStateListener() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        // User logged in
        fetchUserCart();
        fetchUserAddress();
      } else {
        // User logged out
        clearCart();
      }
    });
  }

  void fetchUserCart() {
    String userId = currentUserId;
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('cart')
        .snapshots()
        .listen(
      (querySnapshot) {
        _cart = querySnapshot.docs.map((doc) {
          return Product(
            name: doc['name'],
            price: doc['price'],
            quantity: doc['quantity'],
            imagePath: doc['image'],
          );
        }).toList();

        notifyListeners();
      },
      onError: (error) {
        print("Error fetching user's cart from Firestore: $error");
      },
    );
  }

  void clearCart() {
    _cart = [];
    notifyListeners();
  }

//fetch user address
  void fetchUserAddress() {
    String userId = currentUserId;
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('Addresses')
        .snapshots()
        .listen(
      (querySnapshot) {
        _address = querySnapshot.docs.map((doc) {
          return Address(
            name: doc['name'],
            mobile: doc['price'],
            address: doc['quantity'],
          );
        }).toList();

        notifyListeners();
      },
      onError: (error) {
        print("Error fetching user's cart from Firestore: $error");
      },
    );
  }

  void clearAddress() {
    _address = [];
    notifyListeners();
  }

  void addToCart(Product item) {
    String userId = currentUserId;
    _cart.add(item);
    _addToUserDatabase(item, userId);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    String userId = currentUserId;
    _cart.remove(item);
    _removeFromUserDatabase(item, userId);
    notifyListeners();
  }

  Future<void> _addToUserDatabase(Product item, String userId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('cart')
          .add({
        'name': item.name,
        'price': item.price,
        'quantity': item.quantity,
        'image': item.imagePath,
      });
    } catch (error) {
      print("Error adding item to user's database: $error");
    }
  }

  Future<void> _removeFromUserDatabase(Product item, String userId) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('cart')
          .where('name', isEqualTo: item.name)
          .get();

      for (var doc in querySnapshot.docs) {
        doc.reference.delete();
      }
    } catch (error) {
      print("Error removing item from user's database: $error");
    }
  }
}
