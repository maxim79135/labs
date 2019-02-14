#include <iostream>
#include <conio.h>
#include <stack>

using namespace std;

enum FirstNodeEnum{NoFirstNode, isFirstNode};

struct Node {
	int value;
	struct Node* next;
};

void Push(int*, FirstNodeEnum*, struct Node*&, struct Node*&);
void Pop(struct Node*);

int main() {
	struct Node* curr = NULL;
	struct Node* prevNode = NULL;
	int value;
	int num = 0;
	FirstNodeEnum FirstNode = NoFirstNode;
	prevNode = new Node;
	while (num < 10) {
		cout << "Enter"
	}

	_getch();
	return 0;
}

void Push(int* value, FirstNodeEnum* FirstNode, struct Node*& curr, struct Node*& prevNode) {
	if (*FirstNode == NoFirstNode) {
		(*curr).value = *value;
		(*curr).next = NULL;
		*FirstNode = isFirstNode;
	}
	else {
		(*curr).value = *value;
		(*curr).next = prevNode;
	}
	prevNode = curr;
}

void Pop(struct Node* curr) {
	struct Node* tmp;
	while ((*curr).next != NULL) {
		cout << "Current node is " << (*curr).value << endl;
		tmp = curr;
		curr = (*curr).next;
		delete tmp;
	}
	cout << "Current node is " << (*curr).value << endl;
	delete curr;
}
