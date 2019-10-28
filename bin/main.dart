import 'dart:io';
import 'dart:math';


class Animal{
  String questionText;
  Animal yesNode;
  Animal noNode;
  String name;
  Animal(this.questionText,this.name);


}
bool nodePointer=false;
createNewNode(Animal animal, Animal previousNode, bool nodePointer){
  print("What is the animal?");
  String newAnimal=stdin.readLineSync();
  Animal newAnswerNode=Animal("","Is it a ${newAnimal}?");//New Node Created
  print("What question would distinguish between an ${animal.name} and a ${newAnimal}?");
  String newQuestion=stdin.readLineSync();
  Animal newQuestionNode=Animal("${newQuestion}","");
  if(nodePointer) // add new node to yes node of previous node
      {

    previousNode.yesNode=newQuestionNode;
    newQuestionNode.noNode=newAnswerNode;
    newQuestionNode.yesNode=animal;


  }
  else{
    previousNode.noNode=newQuestionNode;
    newQuestionNode.yesNode=newAnswerNode;
    newQuestionNode.noNode=animal;

  }


}
void traverseTree(Animal animal, Animal previousNode){
while(animal.yesNode!=null || animal.noNode!=null)
  {
    print("${animal.questionText}");
    String response=stdin.readLineSync();
    if(response=="yes"){
      previousNode=animal;
      nodePointer=true;// save previous node
      animal=animal.yesNode;
    }else if(response=="no"){
      nodePointer=false;
      previousNode=animal;// save previous node
      animal=animal.noNode;
    }
  }
  print("${animal.name}"); //depending upon users response we will create a new node or end the game
String response=stdin.readLineSync();
if(response=="yes"){
  print("End of Game!");
}
else if(response=="no"){
  // Create a new Node
  print("Oops looks like I need to improve!");
  createNewNode(animal,previousNode,nodePointer);
}


  return;
}

main() {
Animal first=Animal("Can it Fly?","");
Animal second=Animal("Can it Swim","");
Animal third=Animal("Can it climb trees?","");

Animal fourth=Animal("","Is it a Duck?");
Animal fifth=Animal("","Is it a Parrot?");
Animal sixth=Animal("","Is it a Monkey?");
Animal seventh=Animal("Is it a Pet?","");
Animal eighth=Animal("","Is it a Dog?");
Animal ninth=Animal("Is it taller than 2 meters?","");
Animal tenth=Animal("","Is it a Giraffe?");
Animal eleventh= Animal("","Is it a Fox?");
first.yesNode=second;
first.noNode=third;

second.yesNode=fourth;
second.noNode=fifth;
third.yesNode=sixth;
third.noNode=seventh;
seventh.yesNode=eighth;
seventh.noNode=ninth;
ninth.yesNode=tenth;
ninth.noNode=eleventh;
fourth.yesNode=null;
fourth.noNode=null;
fifth.yesNode=null;
fifth.noNode=null;
sixth.yesNode=null;
sixth.noNode=null;
eighth.yesNode=null;
eighth.noNode=null;
tenth.noNode=null;
tenth.noNode=null;
eleventh.yesNode=null;
eleventh.noNode=null;

Animal previousNode;
while(true){
traverseTree(first,previousNode);
}






}

/// Sample Output
// Think of an animal
// Is it a duck?
// No
// Oops - looks like I need to improve.
// What is the animal?
// A monkey
// What question would distinguish between a duck and A monkey?
// Can it fly?
// For A monkey, is the answer yes or no?
// No
// Thanks for helping me to improve!
//
// Want to play again?
// Yes
// Think of an animal
// Can it fly?
// Yes
// Is it a duck?
// No
// Oops - looks like I need to improve.
// What is the animal?
// Parrot
// What question would distinguish between a duck and Parrot?
// Can it swim?
// For Parrot, is the answer yes or no?
// No
// Thanks for helping me to improve!
//
// Want to play again?
// Yes
// Think of an animal
// Can it fly?
// No
// Is it A monkey?
// Yes
// Yay!  I got it!
//
// Want to play again?
// Yes
// Think of an animal
// Can it fly?
// No
// Is it A monkey?
// No
// Oops - looks like I need to improve.
// What is the animal?
// Dog
// What question would distinguish between A monkey and Dog?
// Can it climb trees?
// For Dog, is the answer yes or no?
// no
// Thanks for helping me to improve!
//
// Want to play again?
// yes
// Think of an animal
// Can it fly?
// No
// Can it climb trees?
// No
// Is it Dog?
// No
// Oops - looks like I need to improve.
// What is the animal?
// a cow
// What question would distinguish between Dog and a cow?
// Is it taller than 1 meter?
// For a cow, is the answer yes or no?
// yes
// Thanks for helping me to improve!
//
// Want to play again?
// yes
// Think of an animal
// Can it fly?
// No
// Can it climb trees?
// Yes
// Is it A monkey?
// No
// Oops - looks like I need to improve.
// What is the animal?
// a cat
// What question would distinguish between A monkey and a cat?
// Is it a pet?
// For a cat, is the answer yes or no?
// yes
// Thanks for helping me to improve!
//
// Want to play again?
// no


//In Class Run Through
// Think of animal
// Is it a duck?
/// no
// improve me
// What is the animal
/// Tiger
// Distinguishing question b/w tiger and duck
/// Can it Fly?
// For Tiger is the answer yes/no?
/// No

// Think of an Animal
// Can it fly?
/// yes
// Is it a duck?
/// no
// improve me
// What is the animal
/// Eagle
// improving question
/// Is it a predatory animal
// for eagle is it yes or no
/// yes
//
// Think of an Animal
// Can it fly?
/// no
// Is it a tiger?
/// no
// Which animal?
/// Elephant
// distinguish b/w elep and tiger
/// Is it herbivorous?
// is the answer for elephant yes/no
/// yes

// Think of an Animal
// Can it fly?
/// no
// Is it herbivorous?
/// yes
// Elephant is it?
/// no
// which one it is imrpve me
/// Cow
// distinguish b/w elephant and cow
/// does it have trunk
// for cow is it yes or no
/// no

// Think of animal
//  Can it fly?
/// yes
// Is it a predator?
/// yes
// is it a eagle?
/// no
// improve me
/// bat
// distinguish question bat and eagle
/// Is it nocturnal
// yes or no for bat
/// yes

// Think of animal
//  Can it fly?
/// yes
// Is it a predator?
/// yes
// is it nocturnal?
/// no
// is it eagle
/// yes
// YAYYY
