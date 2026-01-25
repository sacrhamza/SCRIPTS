#include <stdio.h>
#include <string.h>
#include <math.h>
#include <limits.h>
#include <float.h>
// #include <mystdlib.h>

#define func(var) for (int i = 0; i < sizeof(var); i++){\
    print_bit(*((unsigned char*)&var + (sizeof(var) - i - 1)));\
}

void print_bit(unsigned char bit)
{
  for (int i = 0; i < 8; i++)
  {
    printf("%u", (bit >> 7));
    bit = bit << 1;
  }
}



void print_float(float var)
{
  unsigned int exp = 0;
  for (int j = 0; j < 4; j++)
  {
    unsigned char bit = *((unsigned char *)&var + (4 - j - 1));
    for (int i = 0; i < 8; i++)
    {
      if ((i >= 1 && j == 0) || (i == 0 && j == 1))
        exp = exp << 1 | (bit >> 7);
      printf("%u", bit >> 7);
      if (i == j && i == 0)
        printf (" ");
      if (i == 0 && j == 1)
        printf (" ");
      bit = bit << 1;
    }
  }
  printf("\nexponent: [%d]\n", exp - 127);
  printf("number = %f", pow(2, exp - 127));
}

void print_float_bits(float var)
{
  unsigned char *num = (unsigned char *)&var;
  char sign = (num[3] >> 7);
  sign = 1 - (sign == 1) * 2;
  unsigned char exponent = (num[3] << 1) | (num[2] >> 7);
  unsigned char bit; 
  float mantissa = 0;
  printf("\n");
  num[2] = num[2] | (1 << 7);
  for (int i = 2; i >= 0; i--)
  {
    for (int j = 0; j < 8; j++)
    {
      bit = num[i] >> 7;
      printf("%u", bit);
      num[i] = num[i] << 1;
      mantissa += 1.0f / (pow(2, j + ((2 - i) * 8))) * bit;
    }
  }
  printf("\nmantissa: %f\nexponent: %d\nnumber = (pow(2, %d) * %f) = %.8f\n", mantissa,  exponent - 127, exponent - 127, mantissa, sign * mantissa * pow(2, exponent - 127));
}

void print_int_bits(int var)
{
  for (size_t i = 0; i < sizeof(var); i++)
  {
    print_bit(*((unsigned char*)&var + (sizeof(var) - i - 1)));
  }
}

int main(void)
{
  print_bit(255);
  return (0);
}
