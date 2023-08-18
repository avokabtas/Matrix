# Matrix

<details>
<summary>Реализация библиотеки Matrix.</summary>


> ***Более подробную документацию можно прочесть в Matrix/Matrix.docc/Matrix.md*** 


### Напоминание основных положений о матрице

Матрица - прямоугольная таблица чисел, расположенных в m строках и n столбцах.

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

Порядок матрицы — это число ее строк или столбцов. \
Главная диагональ квадратной матрицы — это диагональ, идущая из левого верхнего в правый нижний угол. \
Прямоугольная матрица (В) — это матрица, у которой число строк не равно числу столбцов. \
Квадратная матрица (А) — это матрица у которой число строк равно числу столбцов.

### Операции над матрицами

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


***


<details>
<summary>Implementation of the Matrix library. The English version. </summary>


> ***More detailed documentation can be found in Matrix/Matrix.docc/Matrix.md*** 


### A reminder of the matrix basics

Matrix is a rectangular table of numbers arranged in m rows and n columns

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

You can get the desired element using indices as follows A[1,1] = 1, where the first index is the row number, the second is the column number.

The order of a matrix is the number of its rows or columns. \
The main diagonal of a square matrix is the diagonal from the upper left to the lower right corner.

A rectangular matrix (B) is a matrix with the number of rows not equal to the number of columns. \
A square matrix (A) is a matrix with the number of rows equal to the number of columns.

## Matrix operations

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
