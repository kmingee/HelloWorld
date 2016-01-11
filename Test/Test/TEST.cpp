#include <iostream>
using namespace std;

struct test
{
	long a;
	long b;
	long c;
};
int main()
{
	int T;  //²âÊÔÓÃÀý×éÊý
	int i;
	cin >> T;
	test *A;
	A = new test[T];
	test *B;
	B = A;
	for (i = 0; i<T; i++)
	{
		cin >> A->a >> A->b >> A->c;
		A++;
	}
	for (i = 1; i<=T; i++)
	{

		if (((B->a) + (B->b))>(B->c))
			cout << "Case #" << i << ": true" << endl;
		else
			cout << "Case #" << i << ": false" << endl;
		B++;
	}
	return 0;
}