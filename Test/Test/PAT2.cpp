#include <iostream>
#include <iomanip>
using namespace std;

int main()
{
	int T;//输入数字的个数
	int A1 = 0, A2 = 0, A3 = 0, A5 = 0;
	int i;
	int f = 0;
	float a4 = 0, A4 = 0;

	int *ps;
	cin >> T;
	ps = new int[T];
	for (i = 0; i < T; i++)
	{
		cin>>ps[i];
	}
	for (i = 0; i < T; i++)
	{
		if ((ps[i] % 5 == 0) && (ps[i] % 2 == 0))
			A1 =A1+ ps[i];
		if (ps[i] % 5 == 1)
		{
			if ((f % 2) == 0)
				A2=A2+ps[i];
			else
				A2 =A2-ps[i];
			f++;
		}
		if (ps[i] % 5 == 2)
			A3++;
		if (ps[i] % 5 == 3)
		{
			A4=A4+ ps[i];
			a4++;
		}
		if (ps[i] % 5 == 4)
		{
			if (A5 < ps[i])
				A5 = ps[i];
		}
		}
	if (A4>0)
		a4 = A4 /a4;
	else
		a4 = 0;


	if (A1 > 0)
		cout << A1;
	else
		cout << "N";
	if (A2!=0)
		cout << " " << A2;
	else
		cout << " " << "N";
	if (A3 > 0)
		cout << " " << A3 << " ";
	else
		cout << " " << "N";
	if (a4> 0)
		cout << setiosflags(ios::fixed) << setprecision(1) << a4;
	else
		cout << "N";
	if (A5 > 0)
		cout << " " << A5 << endl;
	else
		cout << " "<<"N" << endl;
	return 0;
}