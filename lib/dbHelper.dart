import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:pas_mobile_11pplg2_17/bookmodel.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  // ========================
  // INIT DATABASE (FINAL)
  // ========================
  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'contacts.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        // TABLE BARU: BOOKMARKS
        await db.execute(
          'CREATE TABLE bookmarks(id INTEGER PRIMARY KEY AUTOINCREMENT, tvname TEXT, image TEXT, rating TEXT)'
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute(
            'CREATE TABLE bookmarks(id INTEGER PRIMARY KEY AUTOINCREMENT, tvname TEXT, image TEXT, rating TEXT)'
          );
        }
      },
    );
  }

  // ========================
  // CRUD untuk BOOKMARKS
  // ========================

  Future<int> addBookmark(Welcome show) async {
    final client = await db;
    return client.insert('bookmarks', {
      'tvname': show.name,
      'image': show.image,
      'rating': show.rating,
    });
  }

  Future<List<Map<String, dynamic>>> getBookmarks() async {
    final client = await db;
    return client.query('bookmarks', orderBy: 'id DESC');
  }

  Future<int> deleteBookmark(int id) async {
    final client = await db;
    return client.delete(
      'bookmarks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
