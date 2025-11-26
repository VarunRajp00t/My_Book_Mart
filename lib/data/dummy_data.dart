import '../models/book.dart';
import '../models/category.dart';

// --- Categories ---
const DUMMY_CATEGORIES = [
  Category(id: 'c1', title: 'Fiction'),
  Category(id: 'c2', title: 'Science'),
  Category(id: 'c3', title: 'Fantasy'),
  Category(id: 'c4', title: 'Biography'),
];

// --- Books ---
final DUMMY_BOOKS = [
  Book(
    id: 'b1',
    title: 'The Hidden Library',
    author: 'A. B. Writer',
    description: 'A thrilling mystery set in a forgotten library.',
    price: 15.99,
    imageUrl: 'https://via.placeholder.com/150/0000FF/FFFFFF?text=Book+1',
    categoryId: 'c1',
  ),
  Book(
    id: 'b2',
    title: 'Quantum Leaps',
    author: 'Dr. E. Science',
    description: 'An in-depth look at modern physics.',
    price: 25.50,
    imageUrl: 'https://via.placeholder.com/150/FF0000/FFFFFF?text=Book+2',
    categoryId: 'c2',
  ),
  Book(
    id: 'b3',
    title: 'The Last Dragon',
    author: 'C. D. Legend',
    description: 'An epic tale of magic and adventure.',
    price: 18.75,
    imageUrl: 'https://via.placeholder.com/150/00FF00/FFFFFF?text=Book+3',
    categoryId: 'c3',
  ),
];