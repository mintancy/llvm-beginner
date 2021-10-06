int add(int A, int B) { return A + B; }

int inc(int A) { return ++A; }

int (*Fptr)(int) = &inc; // NOLINT

int testcall(int A) {A = Fptr(A); return A;}

int testloop(int count)
{
  int sum;
  for (int i = 0; i < count; i++)
  {
    for (int j = 0; j < count; j++)
    {
      sum++;
    }
  }
  return sum;
}

int testconditionbr()
{
  int sum = 0;
  for (int i = 0; i < 10; i++)
  {
    switch (i%2)
    {
    case 0:
      sum += i;
      break;
    case 1:
      sum += 1;
      break;
    
    default:
      break;
    }
  } 
  return sum;
}

int main() {
  int I = 42;
  int J = 13;
  int K = add(I, J);
  int TMP = K;
  int TMP2;
  K = inc(K);
  for (int Idx = 0; Idx < 100; ++Idx) {
    ++K;
  }
  K = Fptr(K);
  TMP = testcall(TMP);
  TMP2 = testloop(K);
  testconditionbr();
  return K;
}
