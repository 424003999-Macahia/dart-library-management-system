
import 'dart:async';

// Abstract class
abstract class Person {
  String name;

  Person(this.name);

  void displayInfo();
}

// Mixin for reusable code
mixin LibraryMessage {
  void showMessage(String message) {
    print(message);
  }
}

// Parent class
class User extends Person {
  User(String name) : super(name);

  @override
  void displayInfo() {
    print("Library User: $name");
  }
}

// Child class with inheritance and mixin
class Student extends User with LibraryMessage {
  Student(String name) : super(name);

  void borrowBook(String book) {
    showMessage("$name borrowed $book.");
  }

  void returnBook(String book) {
    showMessage("$name returned $book.");
  }
}

// Book class
class Book {
  String title;
  bool isAvailable;

  Book(this.title, {this.isAvailable = true});

  void displayBook() {
    print("$title - ${isAvailable ? "Available" : "Borrowed"}");
  }
}

// Async function
Future<void> loadLibrary() async {
  print("\nLoading library data...");
  await Future.delayed(Duration(seconds: 2));
  print("Library data loaded successfully!");
}

// Main function
Future<void> main() async {
  try {
    print("===== LIBRARY MANAGEMENT SYSTEM =====");

    // Create objects
    Student student = Student("Ralph");

    Book book1 = Book("Dart Programming");
    Book book2 = Book("Introduction to IT");

    // Display student information
    print("\nSTUDENT INFORMATION");
    student.displayInfo();

    // Display books
    print("\nAVAILABLE BOOKS");
    book1.displayBook();
    book2.displayBook();

    // Simulate loading
    await loadLibrary();

    // Borrow a book
    print("\nBORROW BOOK");

    if (book1.isAvailable) {
      book1.isAvailable = false;
      student.borrowBook(book1.title);
    } else {
      print("Sorry, this book is not available.");
    }

    // Show updated book status
    print("\nUPDATED BOOK LIST");
    book1.displayBook();
    book2.displayBook();

    // Return a book
    print("\nRETURN BOOK");

    if (!book1.isAvailable) {
      book1.isAvailable = true;
      student.returnBook(book1.title);
    }

    // Final book status
    print("\nFINAL BOOK LIST");
    book1.displayBook();
    book2.displayBook();

    print("\nThank you for using the Library System!");

  } catch (error) {
    print("An error occurred: $error");
  }
}
