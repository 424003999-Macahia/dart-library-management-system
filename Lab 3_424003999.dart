
import 'dart:async';

abstract class Person {
  String name;

  Person(this.name);

  void displayInfo();
}

mixin LibraryMessage {
  void showMessage(String message) {
    print(message);
  }
}

class User extends Person {
  User(String name) : super(name);

  void displayInfo() {
    print("Library User: $name");
  }
}

class Student extends User with LibraryMessage {
  Student(String name) : super(name);

  void borrowBook(String book) {
    showMessage("$name borrowed $book.");
  }

  void returnBook(String book) {
    showMessage("$name returned $book.");
  }
}

class Book {
  String title;
  bool isAvailable;

  Book(this.title, {this.isAvailable = true});

  void displayBook() {
    print("$title - ${isAvailable ? "Available" : "Borrowed"}");
  }
}

Future<void> loadLibrary() async {
  print("\nLoading library data...");
  await Future.delayed(Duration(seconds: 2));
  print("Library data loaded successfully!");
}

Future<void> main() async {
  try {
    print("===== LIBRARY MANAGEMENT SYSTEM =====");

    Student student = Student("Ralph Steven Macahia");

    Book book1 = Book("Dart Programming");
    Book book2 = Book("Introduction to IT");

    print("\nSTUDENT INFORMATION");
    student.displayInfo();

    print("\nAVAILABLE BOOKS");
    book1.displayBook();
    book2.displayBook();

    await loadLibrary();

    print("\nBORROW BOOK");

    if (book1.isAvailable) {
      book1.isAvailable = false;
      student.borrowBook(book1.title);
    } else {
      print("Sorry, this book is not available.");
    }

    print("\nUPDATED BOOK LIST");
    book1.displayBook();
    book2.displayBook();

    print("\nRETURN BOOK");

    if (!book1.isAvailable) {
      book1.isAvailable = true;
      student.returnBook(book1.title);
    }

    print("\nFINAL BOOK LIST");
    book1.displayBook();
    book2.displayBook();

    print("\nThank you for using the Library System!");

  } catch (error) {
    print("An error occurred: $error");
  }
}
