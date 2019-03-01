#include "Tree.h"
#include <iostream>
#include <queue>

using std::cout;
using std::queue;

Tree::Tree()
{
	root = nullptr;
}

Tree::~Tree()
{
	delete_tree();
}

void Tree::insert(int key, double *&arr, int size)
{
	if (root != nullptr) insert(key, arr, size, root);
	else {
		root = new TreeNode;
		root->value = key;
		root->array_d = arr;
		root->size = size;
		root->left = nullptr;
		root->right = nullptr;
	}
}

TreeNode * Tree::search(int key)
{
	return search(key, root);
}

void Tree::delete_tree()
{
	delete_tree(root);
}

void Tree::print()
{
	print(root);
}

void Tree::insert(int key, double *arr, int size, TreeNode *&leaf)
{
	if (key < leaf->value) {
		if (leaf->left != nullptr) insert(key, arr, size, leaf->left);
		else {
			leaf->left = new TreeNode;
			leaf->left->value = key;
			leaf->left->array_d = arr;
			leaf->left->size = size;
			leaf->left->left = nullptr;
			leaf->left->right = nullptr;
		}
	}
	else if (key >= leaf->value) {
		if (leaf->right != nullptr) insert(key, arr, size, leaf->right);
		else {
			leaf->right = new TreeNode;
			leaf->right->value = key;
			leaf->right->array_d = arr;
			leaf->right->size = size;
			leaf->right->left = nullptr;
			leaf->right->right = nullptr;
		}
	}
}

TreeNode * Tree::search(int key, TreeNode *leaf)
{
	if (leaf != nullptr) {
		if (key == leaf->value) return leaf;
		if (key < leaf->value)
			return search(key, leaf->left);
		else
			return search(key, leaf->right);
	}
	return nullptr;
}

void Tree::delete_tree(TreeNode *&leaf)
{
	if (leaf != nullptr) {
		delete_tree(leaf->left);
		delete_tree(leaf->right);
		delete leaf;
		leaf = nullptr;
	}
}

void Tree::print(TreeNode * leaf)
{
	if (leaf == nullptr) return;

	print(leaf->left);
	cout << leaf->value << " ";
	print(leaf->right);
}
