#include "deaths.hpp"
vector<Table> TableStack;

int main(){
    Table t = Table();
    TableStack.push_back(t);
    TableStack.back().insertRecord("x","int");
    TableStack.back().insertRecord("y","int");
    TableStack.back().insertRecord("z","int");
     
    Table t1 = Table();
    
    t1.insertRecord("x","int");
    t1.insertRecord("y","int");
    t1.insertRecord("z","int");
    
    TableStack.push_back(t1);
    
    popTable();
    popTable();
    
}