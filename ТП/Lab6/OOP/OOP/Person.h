#pragma once
#include <string>
#include <iostream>

using namespace std;

class Person
{
public:
	Person();
	~Person();
	virtual void getData();
	virtual bool isOutStanding();
	string getName() { return name;  }
	string getSurName() { return surname; }
	int getAge() { return age; }
	void setData(string _name, string _surname, int _age) { name = _name; surname = _surname; age = _age; }

protected:
	string name;
	string surname;
	int age;
};

class Student : public Person {
public:
	Student();

private:

};