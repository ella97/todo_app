import 'package:todo_app/models/category.dart';
import 'package:todo_app/repositories/repository.dart';

class CategoryService {

  Repository _repository;
  CategoryService(){
    _repository = Repository();
  }
  saveCategory(Category category) async{
    return await _repository.save('categories', category.categoryMap());

  }

  getCategories()async{
    _repository.getAll('categories');
  }
}