#include "Students.h"
#include <iostream>

using std::cout;
using std::endl;
using std::cin;

void Students::countHours()
{
	cout << "���������� ��� � ����: ";
	cin >> countClasses;
	cout << "���������� ������� ����: ";
	cin >> countDays;
	hours = 24 * 31 - 1.5 * countClasses * countDays;
}

void Students::calculatePay()
{
	cout << "������ �� ���: ";
	cin >> payInHour;
	pay = payInHour * hours;
}

void Students::getCountHours()
{
	cout << "���������� ����� � ���������: " << hours << endl;
}

void Students::getPay()
{
	cout << "����� �� ���������: " << pay << endl;
}
