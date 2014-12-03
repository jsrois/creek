#include <vector>
using namespace std;
namespace sample {
 
 typedef vector<string> stringVector;
 
 class Feature
 {
   float s_;
   int a_;
  
  public: 
   void init(string name);
   int check(float, int);
   
 };
 
 struct Box
 {
  void check(void*func,float alpha,float beta){ cout << checking << endl;}
 };
 
 
 
}