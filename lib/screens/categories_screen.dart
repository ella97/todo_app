import 'package:flutter/material.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/services/category_service.dart';
import 'home_screen.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _categoryName = TextEditingController();
  var _categoryDescription = TextEditingController();

  var _category = Category();
  var _categoryService = CategoryService();
  _showFormInDialog(BuildContext context){
    return showDialog(context: context, barrierDismissible: true, builder: (param){
      return AlertDialog(
        actions: <Widget>[
          FlatButton(
            onPressed: (){

            },
            child: Text('Cancel'),
          ),
          FlatButton(
            onPressed: () async{
             _category.name = _categoryName.text;
             _category.description = _categoryDescription.text;
             var result = await _categoryService.saveCategory(_category);
             print(result);
            },
            child: Text('Save'),
          ),
        ],
        title: Text('Category form'),content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _categoryName,
              decoration: InputDecoration(
                labelText: 'Category name',
                hintText: 'Write category name'
              ),
            ),
            TextField(
              controller: _categoryDescription,
              decoration: InputDecoration(
                  labelText: 'Category description',
                  hintText: 'Write category description'
              ),
            ),
          ],
        ),
      ),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RaisedButton(
          elevation: 0.0,
          color: Colors.red,
          child: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        title: Text("Todo App"),
      ),
      body: Center(child: Text("Welcome to categories screen"),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        _showFormInDialog(context);
      }, child: Icon(Icons.add),),
    );
  }
}
