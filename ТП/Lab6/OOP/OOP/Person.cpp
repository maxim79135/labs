#include "Person.h"



Person::Person() : name(""), surname(""), age(15)
{
}

Person::~Person()
{
}

Student::Student()
{
	Person::Person();
}
