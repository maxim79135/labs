#include "Employee.h"
#include <iostream>

using std::cout;
using std::endl;
using std::cin;

void Employee::countHours()
{
	cout << "���������� ������� �����: ";
	cin >> countHoursInDay;
	cout << "���������� ���� � �����: ";
	cin >> countChange;
	hours = countHoursInDay * countChange;
}

void Employee::calculatePay()
{
	cout << "������ �� ���: ";
	cin >> payInHour;
	pay = payInHour * hours;
}

void Employee::getCountHours()
{
	cout << "���������� ����� � ���������: " << hours << endl;
}

void Employee::getPay()
{
	cout << "���������� �����: " << pay << endl;
}