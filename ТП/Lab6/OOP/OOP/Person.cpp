#include "Person.h"



Person::Person() : name(""), surname(""), age(15)
{
}

Person::~Person()
{
}

bool Person::isOutStanding() { 
    return true;
}


void Person::getData() {
    
}

void Person::setName() {
    cout << "Enter name: ";
    cin >> name;
}

Student::Student()
{
    Person();
}

void Student::getData() { 
    Person::setName();
}

bool Student::isOutStanding() {
    return true;
}

