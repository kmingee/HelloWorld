#include <iostream>
using namespace std;
//�ж�һ�����Ƿ�Ϊ����,��Ϊ�������򷵻�1�����򷵻�0
int judgePrime(int num)
{
	int i, m=1;
	
	if (num % 2 == 0 || num % 3 == 0 || num % 5 == 0)
	{
		if (num == 2 || num == 3 || num == 5)
			return 1;
		else
			return 0;
	}
	else 
	{
		for (i = 2; i <= (num / 5); i++)
		{

			if (num % i == 0)
			{
				m = 0;
				break;
			}
		}
	}
	return m;
}

int main()
{
	int M = 0,N = 0;
	int i, q = 0, t = 0; int y;
	cin >>M >> N;
	for (i = 2; q < N; i++)
	{
		if (judgePrime(i) == 1)  //���i������������q>=M ��i�ǡ�Pm,Pn��֮�������
		{
			q++;
			if (q >= M&&q <= N)
			{
				cout << i;
				t++;
				y = N - M;
				y = y + 1;
				if (t % 10 == 0)
				{
					cout << endl;
				}
				else
				{
					if (t == y)
					{
						break;
					}
					cout << " ";
				}
			}
		}
	}
	return 0;
}  