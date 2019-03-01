#pragma once

struct TreeNode {
	int value;
	double *array_d;
	int size;
	TreeNode *left;
	TreeNode *right;
};

class Tree
{
public:
	Tree();
	~Tree();
	void insert(int key, double *&arr, int size);
	TreeNode *search(int key);
	void delete_tree();
	void print();
	TreeNode *get_root() { return root; }

private:
	void insert(int key, double *arr, int size, TreeNode *&leaf);
	TreeNode *search(int key, TreeNode *leaf);
	void delete_tree(TreeNode *&leaf);
	TreeNode *root;
	void print(TreeNode *leaf);
};

