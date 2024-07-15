typedef BulkDictionary = List<Map<String, String>>;

class Dictionary {
  Map<String, String> myMap = {"hi": "안녕하세요~","cat":"고양이"};

  void add(String term, String definition) {
    print("## add : $term");
    myMap["${term}"] = "${definition}";
  }

  String get(String term) {
    return myMap['$term'] ?? '해당 단어는 사전에 존재하지 않습니다.';
  }

  void delete(String term) {
    if (myMap.containsKey(term)) {
      myMap.remove(term);
      print('## delete : $term ');
    } else {
      print('해당 단어는 사전에 존재하지 않습니다.');
    }
  }

  void update(String term,String newTerm) {
    if (myMap.containsKey(term)) {
      myMap[newTerm] = myMap[term]!;
      myMap.remove(term);
      print('## update : $term => $newTerm');
    } else {
      print('해당 단어는 사전에 존재하지 않습니다.');
    }
  }
  void showAll() {
    print("===Dictionary===");
    myMap.forEach((key, value) {
      print('$key : $value');
    });
    print("================");
    print("");
  }
  int count (){
    return myMap.length;
  }
  
  void upsert(String term, String newTerm){
    if (myMap.containsKey(term)) {
      myMap[newTerm] = myMap[term]!;
      myMap.remove(term);
      print('## update : $term => $newTerm');
    } else {
      myMap[newTerm] = '';
      print('사전에 없으므로 $newTerm 단어가 추가되었습니다');
    }  
  }
  
  void exists(String term){
    if (myMap.containsKey(term)){
      print("해당 단어는 사전에 존재합니다.");
    }else{
      print("해당 단어는 사전에 존재하지 않습니다.");
    }
  }

  
  void bulkAdd(BulkDictionary bulkDict){
    bulkDict.forEach((term){
      myMap[term['term']!]=term['definition']!;
      print('## bulkadd : ${term['term']} ');
    });
  }
  void bulkDelete(List bulkdel){
    bulkdel.forEach((term) {
      if (myMap.containsKey(term)) {
        myMap.remove(term);
        print('## bulkDelete : $term ');
      } else {
        print('## bulkDelete : $term 단어는 사전에 존재하지 않습니다.');
      }
    });
  }
}

void main() {
  var dict = Dictionary();
  
  dict.add('apple', '사과');//add
  dict.showAll();
  
  print( "## get 단어의 정의 : ${dict.get('apple')}"); //get
  dict.showAll();
  
  dict.delete('apple');//delete
  dict.showAll();
  
  dict.update('hi','hello');//update
  dict.showAll();
  
  print('##count 사전의 단어 수 : ${dict.count()}');//count
  
  dict.upsert('helo','hi');//upsert
  dict.showAll();
  
  dict.bulkAdd([{"term":"김치", "definition":"대박이네~"}, {"term":"아파트", "definition":"비싸네~"}]);//bulkAdd
  dict.showAll();
  
  dict.bulkDelete(["김치", "아파트"]);//bulkDelete
  dict.showAll();
 
}
