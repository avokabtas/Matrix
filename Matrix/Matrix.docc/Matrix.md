# ``Matrix``

> Матрицы являются одной из базовых структур данных в программировании, например, они применяются для представления табличных значений, для вычислительных задач и нейронных сетей.

<details>
<summary>Реализация библиотеки Matrix. Русскоязычная версия.</summary>

1. [Историческая справка](#историческая-справка)
2. [Матрица](#матрица)
3. [Операции над матрицами](#операции-над-матрицами)
4. [Обзор](#обзор)

## Историческая справка

Первые упоминания о матрицах (или как их тогда называли - "волшебных квадратах") были обнаружены на территории древнего Китая. \
Свою известность они получили в середине XVIII века благодаря труду знаменитого математика Габриэля Крамера, опубликовавшего свой труд - "Введение в анализ алгебраических кривых", в котором описывался принципиально новый алгоритм решения систем линейных уравнений. \
Вскоре после него были опубликованы работы Карла Фридриха Гаусса о "классическом" методе решения линейных уравнений, теорема Гамильтона-Кели, работы Карла Вейерштрасса, Георга Фробениуса и других выдающихся ученых. \
И только в 1850 году Джеймс Джозеф Сильвестр в своей работе вводит термин "Матрица".

## Матрица

Матрица - это набор чисел, расположенных в фиксированном количестве строк и столбцов.

Матрица A - прямоугольная таблица чисел, расположенных в m строках и n столбцах

```
    1 2 3
A = 4 5 6
    7 8 9
```

```
     1  2  3  4
В =  5  6  7  8
     9 10 11 12
```

Получить нужный элемент можно при помощи индексов, так
A[1,1] = 1, где первый индекс - номер строки, второй - номер столбца.

Матрица А будет иметь элементы с следующими индексами:

```
    (1,1) (1,2) (1,3)
A = (2,1) (2,2) (2,3)
    (3,1) (3,2) (3,3)
```

Порядок матрицы — это число ее строк или столбцов. \
Главная диагональ квадратной матрицы — это диагональ, идущая из левого верхнего в правый нижний угол. \
Прямоугольная матрица (В) — это матрица, у которой число строк не равно числу столбцов. \
Квадратная матрица (А) — это матрица у которой число строк равно числу столбцов.

Матрица-столбец — это матрица, у которой всего один столбец:

```
    (1,1)
A = (2,1)
    (n,1)
```

Матрица-строка — это матрица, у которой всего одна строка:

```
A = (1,1) (1,2) (1,m)
```
Tip: матрицу-столбец и матрицу-строку ещё часто называют векторами.

Диагональная матрица — это квадратная матрица, у которой все элементы, кроме, быть может, стоящих на главной диагонали, равны нулю. \
Единичная матрица — это диагональная матрица, у которой все диагональные элементы равны единице:

```
    1 0 0
A = 0 1 0
    0 0 1
```

Треугольная матрица — это квадратная матрица, у которой все элементы, расположенные по одну сторону главной диагонали, равны нулю.

```
    1 2 3
A = 0 4 5
    0 0 6
```

## Операции над матрицами

### Создание матриц

```swift
Matrix()
Matrix(rows: Int, columns: Int)
```
По умолчанию создается матрица размером 3x3 и инициализируется значением 0.0

### Сравнение матриц (equalMatrix)

Две матрицы A, B совпадают |A = B|, если совпадают их размеры и соответствующие элементы равны, то есть при всех i, j A(i,j) = B(i,j).

Сравнение происходит вплоть до 7 знака после запятой включительно.

### Сложение (sumMatrix) и вычитание матриц (subMatrix)

Суммой двух матриц A = m × n и B = m × n одинаковых размеров называется матрица C = m × n = A + B тех же размеров, элементы которой определяются равенствами C(i,j) = A(i,j) + B(i,j).

Разностью двух матриц A = m × n и B = m × n одинаковых размеров называется матрица C = m × n = A - B тех же размеров, элементы которой определяются равенствами C(i,j) = A(i,j) - B(i,j).

```
            1 2 3   1 0 0   2 2 3
С = A + B = 0 4 5 + 2 0 0 = 2 4 5
            0 0 6   3 4 1   3 4 7
```

### Умножение матрицы на число (mulNumber). Умножение двух матриц (mulMatrix)

Произведением матрицы A = m × n на число λ называется матрица B = m × n = λ × A, элементы которой определяются равенствами B = λ × A(i,j).

```
                1 2 3   2 4 6   
B = 2 × A = 2 × 0 4 2 = 0 8 4 
                2 3 4   4 6 8   
```

Произведением матрицы A = m × k на матрицу B = k × n называется матрица C = m × n = A × B размера m × n, элементы которой определяются равенством C(i,j) = A(i,1) × B(1,j) + A(i,2) × B(2,j) + … + A(i,k) × B(k,j).

```
            1 4    1 -1  1    9 11 17   
C = A × B = 2 5  × 2  3  4 = 12 13 22 
            3 6              15 15 27
```

Компоненты матрицы С вычисляются следующим образом:

```
C(1,1) = A(1,1) × B(1,1) + A(1,2) × B(2,1) = 1 × 1 + 4 × 2 = 1 + 8 = 9
C(1,2) = A(1,1) × B(1,2) + A(1,2) × B(2,2) = 1 × (-1) + 4 × 3 = (-1) + 12 = 11
C(1,3) = A(1,1) × B(1,3) + A(1,2) × B(2,3) = 1 × 1 + 4 × 4 = 1 + 16 = 17
C(2,1) = A(2,1) × B(1,1) + A(2,2) × B(2,1) = 2 × 1 + 5 × 2 = 2 + 10 = 12
C(2,2) = A(2,1) × B(1,2) + A(2,2) × B(2,2) = 2 × (-1) + 5 × 3 = (-2) + 15 = 13
C(2,3) = A(2,1) × B(1,3) + A(2,2) × B(2,3) = 2 × 1 + 5 × 4 = 2 + 20 = 22
C(3,1) = A(3,1) × B(1,1) + A(3,2) × B(2,1) = 3 × 1 + 6 × 2 = 3 + 12 = 15
C(3,2) = A(3,1) × B(1,2) + A(3,2) × B(2,2) = 3 × (-1) + 6 × 3 = (-3) + 18 = 15
C(3,3) = A(3,1) × B(1,3) + A(3,2) × B(2,3) = 3 × 1 + 6 × 4 = 3 + 24 = 27      
```

### Транспонирование матрицы (transposeMatrix)

Транспонирование матрицы А заключается в замене строк этой матрицы ее столбцами с сохранением их номеров.

```
          1 4   1 2 3
A = A^T = 2 5 = 4 5 6
          3 6
```

### Минор матрицы и матрица алгебраических дополнений (calcComplementsMatrix)

Минором M(i,j) называется определитель (n-1)-го порядка, полученный вычёркиванием из матрицы A i-й стройки и j-го столбца.

Для матрицы:

```
    1 2 3
A = 0 4 2
    5 2 1
```

Минором первого элемента первой строки будет:

```
M(1,1) = 4 2
         2 1

|M| = 4 - 4 = 0
```

Матрица миноров будет иметь вид:

```
     0 -10 -20
M = -4 -14  -8
    -8   2   4
```

Алгебраическим дополнением элемента матрицы  является значение минора умноженное на -1^(i+j).

Матрица алгебраических дополнений будет иметь вид:

```
      0  10 -20
M. =  4 -14   8
     -8  -2   4
```

### Определитель матрицы (determinantMatrix)

Определитель (детерминант) - это число, которое ставят в соответствие каждой квадратной матрице и вычисляют из элементов по специальным формулам. \
Tip: определитель может быть вычислен только для квадратной матрицы.

Определитель матрицы равен сумме произведений элементов строки (столбца) на соответствующие алгебраические дополнения.

Поиск определителя для матрицы A по первой строке:

```
    1 2 3
A = 4 5 6
    7 8 9
  
|A| = 1 × 5 6 - 2 × 4 6 + 3 × 4 5 = 1 × (5 × 9 - 8 × 6) - 2 × (4 × 9 - 6 × 7) + 3 × (4 × 8 - 7 × 5)
          8 9       7 9       7 8
|A| = 1 × (45 - 48) - 2 × (36 - 42) + 3 × (32 - 35) = -3 + 12 + (-9) = 0
|A| = 0
```

Если невозможно вычислить определитель переданной матрицы, функция должна вернуть значение NAN.

### Обратная матрица (inverseMatrix)

Матрицу A в степени -1 называют обратной к квадратной матрице А, если произведение этих матриц равняется единичной матрице.

Обратной матрицы не существует, если определитель равен 0.

Обратная матрица находится по формуле $`A^{-1}=\frac{1} {|A|} × A_*^T`$

Дана матрица:

```
     2  5  7
A =  6  3  4
     5 -2 -3
```

Поиск определителя:

``` |A| = -1 ```

Определитель |A| != 0 -> обратная матрица существует.

Построение матрицы миноров:

```
    -1 -38 -27
М = -1 -41 -29
    -1 -34 -24
```

Матрица алгебраических дополнений будет равна:

```
     -1  38 -27
М. =  1 -41  29
     -1  34 -24
```

Транспонированная матрица алгебраических дополнений будет равна:

```
        -1   1  -1
М^T. =  38 -41  34
       -27  29 -24
```

## Обзор

| Операция    | Описание   | Исключительные ситуации |
| ----------- | ----------- | ----------- |
| `func equalMatrix(other: Matrix)` | Проверяет матрицы на равенство между собой |  |
| `func sumMatrix(other: Matrix)` | Прибавляет вторую матрицы к текущей | различная размерность матриц |
| `func subMatrix(other: Matrix)` | Вычитает из текущей матрицы другую | различная размерность матриц |
| `func mulNumber(number: Double)` | Умножает текущую матрицу на число |  |
| `func mulMatrix(other: Matrix)` | Умножает текущую матрицу на вторую | число столбцов первой матрицы не равно числу строк второй матрицы |
| `func transposeMatrix()` | Создает новую транспонированную матрицу из текущей и возвращает ее |  |
| `func determinantMatrix()` | Вычисляет и возвращает определитель текущей матрицы | матрица не является квадратной |
| `func calcComplementsMatrix()` | Вычисляет матрицу алгебраических дополнений текущей матрицы и возвращает ее | матрица не является квадратной |
| `func inverseMatrix()` | Вычисляет и возвращает обратную матрицу | определитель матрицы равен 0 |

Перегрузка следующих операторов, частично соответствующие операциям выше:

| Оператор    | Описание   | Исключительные ситуации |
| ----------- | ----------- | ----------- |
| `+`      | Сложение двух матриц  | различная размерность матриц |
| `-`   | Вычитание одной матрицы из другой | различная размерность матриц |
| `*`  | Умножение матриц и умножение матрицы на число | число столбцов первой матрицы не равно числу строк второй матрицы |
| `==`  | Проверка на равенство матриц (`equalMatrix`) | |
| `+=`  | Присвоение сложения (`sumMatrix`)   | различная размерность матриц |
| `-=`  | Присвоение разности (`subMatrix`) | различная размерность матриц |
| `*=`  | Присвоение умножения (`mulMatrix`/`mulNumber`) | число столбцов первой матрицы не равно числу строк второй матрицы |
| `subscript(rows: Int, columns: Int)`  | Индексация по элементам матрицы (строка, колонка) | индекс за пределами матрицы |

</details>

---

> Matrices are one of the basic data structures in programming, e.g. they are used to represent table values, for computational tasks and neural networks.

<details>
<summary>Implementation of the Matrix library. The English version 🇬🇧 </summary>

1. [Historical background](#historical-background)
2. [Matrix](#matrix)
3. [Matrix operations](#matrix-operations)
4. [Overview](#overview)

## Historical background

The first mentions of matrices (or as they were called then - "magic squares") were found in ancient China. \
They became famous in the middle of the 18th century thanks to the work of the famous mathematician Gabriel Cramer, who published his work "Introduction to the Analysis of Algebraic Curves", which described a fundamentally new algorithm for solving systems of linear equations. \
Soon after, the works of Carl Friedrich Gauss on the "classical" method of solving linear equations, the Cayley-Hamilton theorem, the works of Karl Weierstrass, Georg Frobenius, and other outstanding scientists were published. \
It was not until 1850 that James Joseph Sylvester introduced the term "Matrix" in his work.

## Matrix

A matrix is a collection of numbers arranged into a fixed number of rows and columns.

Matrix A is a rectangular table of numbers arranged in m rows and n columns

```
    1 2 3
A = 4 5 6
    7 8 9
```

```
     1  2  3  4
В =  5  6  7  8
     9 10 11 12
```

You can get the desired element with the help of indices, as follows
A[1,1] = 1, where the first index is the row number, the second is the column number.

Matrix A will have elements with the following indices:

```
    (1,1) (1,2) (1,3)
A = (2,1) (2,2) (2,3)
    (3,1) (3,2) (3,3)
```

The order of a matrix is the number of its rows or columns. \
The main diagonal of a square matrix is the diagonal from the upper left to the lower right corner. \
A rectangular matrix (B) is a matrix with the number of rows not equal to the number of columns. \
A square matrix (A) is a matrix with the number of rows equal to the number of columns.

A column matrix is a matrix with only one column:

```
    (1,1)
A = (2,1)
    (n,1)
```

A row matrix is a matrix that has only one row:

```
A = (1,1) (1,2) (1,m)
```

Tip: A column matrix and a row matrix are also often called vectors.

A diagonal matrix is a square matrix in which all elements outside the main diagonal are zero. \
An identity matrix is a diagonal matrix with all diagonal elements equal to one:

```
    1 0 0
A = 0 1 0
    0 0 1
```

A triangular matrix is a square matrix with all elements on one side of the main diagonal equal to zero.

```
    1 2 3
A = 0 4 5
    0 0 6
```

## Matrix operations

### Creating matrices

```swift
Matrix()
Matrix(rows: Int, columns: Int)
```
By default, a 3x3 matrix is created and initialized with the value 0.0

### Matrix comparison (equalMatrix)

The matrices A, B are equal |A = B| if they have the same dimensions and the corresponding elements are identical, thus for all i and j: A(i,j) = B(i,j)

The comparison must be up to and including 7 decimal places.

### Adding (sumMatrix) and subtracting matrices (subMatrix)

The sum of two matrices A = m × n and B = m × n of the same size is a matrix C = m × n = A + B of the same size whose elements are defined by the equations C(i,j) = A(i,j) + B(i,j).

The difference of two matrices A = m × n and B = m × n of the same size is a matrix C = m × n = A - B of the same size whose elements are defined by the equations C(i,j) = A(i,j) - B(i,j).


```
            1 2 3   1 0 0   2 2 3
С = A + B = 0 4 5 + 2 0 0 = 2 4 5
            0 0 6   3 4 1   3 4 7
```

### Matrix multiplication by scalar (mulNumber). Multiplication of two matrices (mulMatrix)

The product of the matrix A = m × n by the number λ is the matrix B = m × n = λ × A whose elements are defined by the equations B = λ × A(i,j).

```
                1 2 3   2 4 6   
B = 2 × A = 2 × 0 4 2 = 0 8 4 
                2 3 4   4 6 8   
```

The product of A = m × k by B = k × n is a matrix C = m × n = A × B of size m × n whose elements are defined by the equation C(i,j) = A(i,1) × B(1,j) + A(i,2) × B(2,j) + ... + A(i,k) × B(k,j).

```
            1 4    1 -1  1    9 11 17   
C = A × B = 2 5  × 2  3  4 = 12 13 22
            3 6              15 15 27
```
The components of matrix C are calculated as follows:

```
C(1,1) = A(1,1) × B(1,1) + A(1,2) × B(2,1) = 1 × 1 + 4 × 2 = 1 + 8 = 9
C(1,2) = A(1,1) × B(1,2) + A(1,2) × B(2,2) = 1 × (-1) + 4 × 3 = (-1) + 12 = 11
C(1,3) = A(1,1) × B(1,3) + A(1,2) × B(2,3) = 1 × 1 + 4 × 4 = 1 + 16 = 17
C(2,1) = A(2,1) × B(1,1) + A(2,2) × B(2,1) = 2 × 1 + 5 × 2 = 2 + 10 = 12
C(2,2) = A(2,1) × B(1,2) + A(2,2) × B(2,2) = 2 × (-1) + 5 × 3 = (-2) + 15 = 13
C(2,3) = A(2,1) × B(1,3) + A(2,2) × B(2,3) = 2 × 1 + 5 × 4 = 2 + 20 = 22
C(3,1) = A(3,1) × B(1,1) + A(3,2) × B(2,1) = 3 × 1 + 6 × 2 = 3 + 12 = 15
C(3,2) = A(3,1) × B(1,2) + A(3,2) × B(2,2) = 3 × (-1) + 6 × 3 = (-3) + 18 = 15
C(3,3) = A(3,1) × B(1,3) + A(3,2) × B(2,3) = 3 × 1 + 6 × 4 = 3 + 24 = 27      
```

### Matrix transpose (transposeMatrix)

The transpose of matrix A is in switching its rows with its columns with their numbers retained

```
          1 4   1 2 3
A = A^T = 2 5 = 4 5 6
          3 6
```
### Minor of matrix and matrix of algebraic complements (calcComplementsMatrix)

Minor M(i,j) is a (n-1)-order determinant obtained by deleting out the i-th row and the j-th column from the matrix A.

For the following matrix:

```
    1 2 3
A = 0 4 2
    5 2 1
```

The minor of the first element of the first row is:

```
M(1,1) = 4 2
         2 1

|M| = 4 - 4 = 0
```

The minors of matrix will look like this:

```
     0 -10 -20
M = -4 -14  -8
    -8   2   4
```

The algebraic complement of a matrix element is the value of the minor multiplied by -1^(i+j).

The matrix of algebraic complement will look like this:

```
      0  10 -20
M. =  4 -14   8
     -8  -2   4
```

### Matrix determinant (determinantMatrix)

The determinant is a number that is associated to each square matrix and calculated from the elements using special formulas. \
Tip: The determinant can only be calculated for a square matrix.

The determinant of a matrix equals the sum of the products of elements of the row (column) and the corresponding algebraic complements.

Finding the determinant of matrix A by the first row:

```
    1 2 3
A = 4 5 6
    7 8 9
  
|A| = 1 × 5 6 - 2 × 4 6 + 3 × 4 5 = 1 × (5 × 9 - 8 × 6) - 2 × (4 × 9 - 6 × 7) + 3 × (4 × 8 - 7 × 5)
          8 9       7 9       7 8
|A| = 1 × (45 - 48) - 2 × (36 - 42) + 3 × (32 - 35) = -3 + 12 + (-9) = 0
|A| = 0
```

If it is impossible to calculate the determinant of the given matrix, the function must return the value NAN.

### Inverse of the matrix (inverseMatrix)

A matrix A to the power of -1 is called the inverse of a square matrix A if the product of these matrices equals the identity matrix.

If the determinant of the matrix is zero, then it does not have an inverse.

The formula to calculate the inverse of matrix is $`A^{-1}=\frac{1} {|A|} × A_*^T`$

The following matrix is given:

```
     2  5  7
A =  6  3  4
     5 -2 -3
```

Finding the determinant:

``` |A| = -1 ```

Determinant |A| != 0 -> matrix has an inverse.

Construction of minor matrix:

```
    -1 -38 -27
М = -1 -41 -29
    -1 -34 -24
```


The matrix of algebraic complements:

```
     -1  38 -27
М. =  1 -41  29
     -1  34 -24
```

The transpose of matrix of algebraic complements:

```
        -1   1  -1
М^T. =  38 -41  34
       -27  29 -24
```
## Overview

| Operation | Description | Exceptional situations |
| ----------- | ----------- | ----------- |
| `func equalMatrix(other: Matrix) ` | Checks matrices for equality with each other |  |
| `func sumMatrix(other: Matrix)` | Adds the second matrix to the current one | different matrix dimensions |
| `func subMatrix(other: Matrix)` | Subtracts another matrix from the current one | different matrix dimensions |
| `func mulNumber(number: Double)` | Multiplies the current matrix by a number |  |
| `func mulMatrix(other: Matrix)` | Multiplies the current matrix by the second matrix | the number of columns of the first matrix is not equal to the number of rows of the second matrix |
| `func transposeMatrix()` | Creates a new transposed matrix from the current one and returns it |  |
| `func determinantMatrix()` | Calculates and returns the determinant of the current matrix | the matrix is not square |
| `func calcComplementsMatrix()` | Calculates the algebraic addition matrix of the current one and returns it | the matrix is not square |
| `func inverseMatrix()` | Calculates and returns the inverse matrix | matrix determinant is 0 |

Overloading of the following operators, partially corresponding to the operations above:

| Operator | Description | Exceptional situations |
| ----------- | ----------- | ----------- |
| `+`      | Addition of two matrices | different matrix dimensions |
| `-`   | Subtraction of one matrix from another | different matrix dimensions |
| `*`  | Matrix multiplication and matrix multiplication by a number | the number of columns of the first matrix does not equal the number of rows of the second matrix |
| `==`  | Checks for matrices equality (`equalMatrix`) | |
| `+=`  | Addition assignment (`sumMatrix`) | different matrix dimensions |
| `-=`  | Difference assignment (`subMatrix`) | different matrix dimensions |
| `*=`  | Multiplication assignment (`mulMatrix`/`mulNumber`) | the number of columns of the first matrix does not equal the number of rows of the second matrix |
| `subscript(rows: Int, columns: Int)`  | Indexation by matrix elements (row, column) | index is outside the matrix |

</details>

## Example

```swift
// func sumMatrix(other: Matrix) 

do {
  let matrixOne = Matrix()
  matrixOne[0, 0] = 1
  matrixOne[0, 1] = 1
  matrixOne[0, 2] = 1

  matrixOne[1, 0] = 1
  matrixOne[1, 1] = 1
  matrixOne[1, 2] = 1

  matrixOne[2, 0] = 1
  matrixOne[2, 1] = 1
  matrixOne[2, 2] = 1

  print("___matrixOne___")
  matrixOne.printMatrix()

  let matrixTwo = try Matrix(rows: 3, columns: 3)
  matrixTwo[0, 0] = 2
  matrixTwo[0, 1] = 2
  matrixTwo[0, 2] = 2

  matrixTwo[1, 0] = 2
  matrixTwo[1, 1] = 2
  matrixTwo[1, 2] = 2

  matrixTwo[2, 0] = 2
  matrixTwo[2, 1] = 2
  matrixTwo[2, 2] = 2

  print("___matrixTwo___")
  matrixTwo.printMatrix()

  try matrixOne.sumMatrix(other: matrixTwo)

  print("___Result___")
  matrixOne.printMatrix()

} catch let error as MatrixError {
  print(error.description)
} catch {
  print(error.unknownError)
}

/* 
Output to the console:

___matrixOne___
Matrix size: 3x3
1.0 1.0 1.0  
1.0 1.0 1.0  
1.0 1.0 1.0  
 
___matrixTwo___
Matrix size: 3x3
2.0 2.0 2.0  
2.0 2.0 2.0  
2.0 2.0 2.0  
 
___Result___
Matrix size: 3x3
3.0 3.0 3.0  
3.0 3.0 3.0  
3.0 3.0 3.0  

*/

```

```swift
// func sumMatrix(other: Matrix) - Exceptional situations

do {
  let matrixOne = Matrix()  // init by default (3x3)
  let matrixTwo = try Matrix(rows: 5, columns: 5)

  try matrixOne.sumMatrix(other: matrixTwo)

} catch let error as MatrixError {
  print(error.description)
} catch {
  print(error.unknownError)
}

/* 
Output to the console:

Error: Incorrect input, matrices should have the same size. 

*/

```
