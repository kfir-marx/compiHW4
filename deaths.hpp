#ifndef DEATHS_FILE
#define DEATHS_FILE

#include <vector>
#include <string>
#include "output.hpp"

using namespace std;
using namespace output;

typedef struct {
    int x;
} STYPE;
#define YYSTYPE STYPE

struct Table;
struct Record;
extern vector<Table> TableStack;
 
 
struct Record{
    string name;
    string type;
    int offset;
    
    Record(int ofs){
        name = "dmy";
        type = "dmy";
        offset = ofs;
    }
    
    Record(const string name, const string type):name(name),type(type),offset(0){
    }    
};

struct Table{
    vector<Record> records;
    int offset;
    Table(){
        offset = TableStack.empty() ? 0 : TableStack.back().offset;
    }
    
    void insertRecord(string name, string type){
        records.push_back(Record(name,type));
        records.back().offset = offset;
        offset++;
    }  
};

void popTable(){
    endScope();
    Table& t = TableStack.back();
    for(int i = 0; i < t.records.size(); ++i){
        printVar(t.records[i].name.c_str(), t.records[i].offset, t.records[i].type.c_str());
    }
    TableStack.pop_back();
}

Record searchVar(string name){
    for (int i = 0; i < TableStack.size(); ++i){
        for (int j = 0; j < TableStack[i].records.size(); ++j){
            if(TableStack[i].records[j].name.compare(name) == 0){
                return TableStack[i].records[j];
            }
        }
    }  
    return Record(-1);
}

#endif