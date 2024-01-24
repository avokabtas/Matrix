//
//  Matrix.swift
//  
//
//  Created by Aliia Satbakova on 15.08.2023.
//

import Foundation

// MARK: - Enum: Math, MatrixError

/**
 Константа epsilon - для сравнения чисел с плавающей точкой с некоторой точностью.
 
 - Note:
 При использовании чисел с плавающей точкой возможна неточность вычислений из-за округления чисел.
 Поэтому при сравнении чисел необходимо учитывать эту неточность и использовать константу,
 которая будет определять, насколько близки должны быть числа, чтобы считаться равными.
 Например, если разница между двумя числами меньше или равна 1e-7, то они считаются равными.
 */
public enum Math {
    static let epsilon = 1e-7
}

/**
 Исключительные ситуации при работе с матрицами.
 */
public enum MatrixError: Error {
    case incorrectArguments
    case differentMatrixSize
    case differentColumnsAndRows
    case matrixNotSquare
    case determinantIsZeroOrNaN
    case outOfRange
}

extension MatrixError: LocalizedError {
    public var description: String {
        switch self {
        case .incorrectArguments:
            return "Error: Incorrect input, values must be bigger than 0."
        case .differentMatrixSize:
            return "Error: Incorrect input, matrices should have the same size."
        case .differentColumnsAndRows:
            return "Error: Incorrect input, the number of columns of the first matrix is not equal to the number of rows of the second matrix."
        case .matrixNotSquare:
            return "Error: Incorrect input, the matrix is not square."
        case .determinantIsZeroOrNaN:
            return "Error: Incorrect input, matrix determinant is 0."
        case .outOfRange:
            return "Error: Incorrect input, index is outside the matrix."
        }
    }
}

extension Error {
    var unknownError: String {
        return "Unknown error occurred."
    }
}


public class Matrix {
    
    // MARK: - Приватные поля
    
    private var rows: Int
    private var columns: Int
    private var matrix: [[Double]]
    
    // MARK: - Инициализация: дефолтная и с параметрами
    
    public init() {
        rows = 3
        columns = 3
        matrix = []
        createMatrix()
    }
    
    /*
    // Инициализатор с использованием convenience
    convenience init() throws {
       try self.init(rows: 3, columns: 3)
    }
    */
    
    public init(rows: Int, columns: Int) throws {
        /// Если хотя бы одно из значений параметров является неположительным, то выбрасывается исключение.
        guard rows > 0 && columns > 0 else {
            throw MatrixError.incorrectArguments
        }
        /// Инициализатор устанавливает значения для свойств.
        self.rows = rows
        self.columns = columns
        /// Создает пустую матрицу.
        matrix = []
        /// Функция будет создавать матрицу с указанным количеством строк и столбцов.
        createMatrix()
    }
    
    // MARK: - Вычисляемые свойства: геттер и сеттер. Доступ к приватным полям rows и columns
    
    public var numberOfRows: Int {
        get {
            /// Возвращает количество строк в матрице, которое хранится в переменной self.rows.
            return self.rows
        }
        set {
            do {
                /// Является ли новое значение newValue больше 0.
                guard newValue > 0 else {
                    throw MatrixError.incorrectArguments
                }
                /// Значение переменной self.rows обновляется.
                self.rows = newValue
                /// Пересоздает матрицу с новым количеством строк.
                createMatrix()
            } catch let error as MatrixError {
                print(error.description)
            } catch {
                print(error.unknownError)
            }
        }
    }
    
    public var numberOfColumns: Int {
        get {
            /// Возвращает количество столбцов в матрице, которое хранится в переменной self.columns.
            return self.columns
        }
        set {
            do {
                /// Является ли новое значение newValue больше 0.
                guard newValue > 0 else {
                    throw MatrixError.incorrectArguments
                }
                /// Значение переменной self.columns обновляется.
                self.columns = newValue
                /// Пересоздает матрицу с новым количеством строк.
                createMatrix()
            } catch let error as MatrixError {
                print(error.description)
            } catch {
                print(error.unknownError)
            }
        }
    }
    
    // MARK: - Индексация по элементам матрицы (строка, колонка)
    
    /**
     Сабскрипт позволяет получать и задавать значение элемента матрицы по указанным индексам.
     
     - Parameters:
     - rows: Принимает номер строки.
     - columns: Принимает номер столбца.
     - Returns: Возвращает значение типа Double.
     */
    public subscript(rows: Int, columns: Int) -> Double {
        get {
            do {
                /// Находятся ли указанные индексы (rows и columns) в допустимом диапазоне для матрицы.
                guard !(rows >= self.rows || columns >= self.columns || rows < 0 || columns < 0) else {
                    throw MatrixError.outOfRange
                }
                return self.matrix[rows][columns]
            } catch let error as MatrixError {
                print(error.description)
                return 0.0
            } catch {
                print(error.unknownError)
                return 0.0
            }
            
        }
        set {
            do {
                /// Находятся ли указанные индексы (rows и columns) в допустимом диапазоне для матрицы.
                guard !(rows >= self.rows || columns >= self.columns || rows < 0 || columns < 0) else {
                    throw MatrixError.outOfRange
                }
                self.matrix[rows][columns] = newValue
            } catch let error as MatrixError {
                print(error.description)
            } catch {
                print(error.unknownError)
            }
        }
    }
    
    // MARK: - Создание и вывод матрицы в консоль
    
    /**
     Создание и инициализация матрицы.
     Каждый элемент матрицы устанавливается в значение 0.0 с помощью repeating: 0.0
     */
    private func createMatrix() {
        matrix = Array(repeating: Array(repeating: 0.0, count: columns), count: rows)
    }
    
    /**
     Печатаем матрицу в консоль.
     */
    public func printMatrix() {
        print("Matrix size: \(rows)x\(columns)")
        for i in 0..<rows {
            for j in 0..<columns {
                print(matrix[i][j], terminator: " ")
            }
            print(" ")
        }
        print(" ")
    }
    
    // MARK: - Операции над матрицами
    
    /**
     Проверяет матрицы на равенство между собой.
     
     - Parameters:
     - other: Принимает другую матрицу.
     - Returns: Возвращает значение типа Bool.
     */
    public func equalMatrix(other: Matrix) -> Bool {
        var result = true
        /// Проверка, имеют ли две матрицы одинаковое количество строк и столбцов
        if rows == other.rows && columns == other.columns {
            /// Перебираем каждый индекс обеих матриц
            for i in 0..<rows {
                for j in 0..<columns {
                    /// Для каждой пары элементов метод вычисляет разницу между ними с помощью функции fabs(),
                    /// которая возвращает абсолютное значение числа. Если разница между элементами превышает
                    /// заданную константу epsilon, то метод устанавливает значение переменной "result" в false.
                    if fabs(matrix[i][j] - other.matrix[i][j]) >= Math.epsilon {
                        result = false
                    }
                }
            }
        } else {
            /// Если же количество строк или столбцов не совпадает, то также устанавливаем значение переменной "result" в false.
            result = false
        }
        /// Возращаем result и если true, но только в том случае, если все элементы обеих матриц совпадают с точностью до значения EPS.
        return result
    }
    
    /**
     Сумма двух матриц. Прибавляет вторую матрицу к текущей.
     
     - Parameters:
     - other: Принимает другую матрицу.
     - Throws: `MatrixError.differentMatrixSize`. Если размеры матриц не совпадают (количество строк или столбцов).
     */
    public func sumMatrix(other: Matrix) throws {
        guard rows == other.rows || columns == other.columns else {
            throw MatrixError.differentMatrixSize
        }
        for i in 0..<rows {
            for j in 0..<columns {
                matrix[i][j] += other.matrix[i][j]
            }
        }
        
    }
    
    /**
     Разница двух матриц. Вычитает значение матрицы из текущей.
     
     - Parameter other: Принимает другую матрицу.
     - Throws: `MatrixError.differentMatrixSize`. Если размеры матриц не совпадают (количество строк или столбцов).
     */
    public func subMatrix(other: Matrix) throws {
        guard rows == other.rows || columns == other.columns else {
            throw MatrixError.differentMatrixSize
        }
        for i in 0..<rows {
            for j in 0..<columns {
                matrix[i][j] -= other.matrix[i][j]
            }
        }
    }
    
    /**
     Умножает текущую матрицу на число.
     
     - Parameters:
     - number: Принимает число.
     */
    public func mulNumber(number: Double) {
        for i in 0..<rows {
            for j in 0..<columns {
                matrix[i][j] *= number
            }
        }
    }
    
    /**
     Умножает текущую матрицу на переданную матрицу.
     
     - Parameters:
     - other: Принимает другую матрицу.
     - Throws: `MatrixError.differentColumnsAndRows`. Если число столбцов первой матрицы не равно числу строк второй матрицы.
     */
    public func mulMatrix(other: Matrix) throws {
        guard columns == other.rows else {
            throw MatrixError.differentColumnsAndRows
        }
        /// Временная матрица temp с количеством строк равным числу строк текущей матрицы
        /// и количеством столбцов равным числу столбцов переданной матрицы.
        let temp = try Matrix(rows: rows, columns: other.columns)
        /// Умножение элементов матрицы.
        for i in 0..<rows {
            for j in 0..<other.columns {
                for k in 0..<columns {
                    temp.matrix[i][j] += matrix[i][k] * other.matrix[k][j]
                }
            }
        }
        /// После завершения умножения, значения размеров исходной матрицы
        /// и сама матрица обновляются значениями временной матрицы.
        self.rows = temp.rows
        self.columns = temp.columns
        self.matrix = temp.matrix
    }
    
    /**
     Создает новую транспонированную матрицу из текущей и возвращает ее.
     
     - Returns: Возвращает значение типа Matrix.
     - Throws: `MatrixError.differentMatrixSize`. Если матрица пустая.
     */
    public func transposeMatrix() throws -> Matrix {
        guard !matrix.isEmpty && rows > 0 else {
            throw MatrixError.differentMatrixSize
        }
        let temp = try Matrix(rows: rows, columns: columns)
        for i in 0..<rows {
            for j in 0..<columns {
                /// Происходит присваивание значения элемента исходной матрицы  элементу новой матрицы - temp.
                /// Каждый элемент исходной матрицы становится элементом новой матрицы в позиции, обратной по отношению к исходной.
                temp.matrix[i][j] = matrix[j][i]
            }
        }
        return temp
    }
    
    /**
     Создается матрица минора (матрица без определенной строки и столбца) на основе текущей матрицы.
     Метод приватный для determinantMatrix(), calcComplementsMatrix().
     
     - Parameters:
     - rows: Принимает количество строк.
     - columns: Принимает количество столбцов.
     - Returns: Возвращает значение типа Matrix.
     - Throws: `MatrixError.incorrectArguments`. Если переданные  rows и columns не соответствуют размерам текущей матрицы.
     */
    private func minorMatrix(rows: Int, columns: Int) throws -> Matrix {
        guard rows >= 0 && rows < self.rows && columns >= 0 && columns < self.columns else {
            throw MatrixError.incorrectArguments
        }
        /// Матрица содержит минорное подмножество элементов текущей матрицы.
        let resultMinor = try Matrix(rows: self.rows - 1, columns: self.columns - 1)
        var resultRow = 0
        for i in 0..<self.rows {
            /// Если текущий индекс является переданным индексом rows или columns, то пропускаем эту итерацию.
            if i == rows {
                continue
            }
            var resultColumn = 0
            for j in 0..<self.columns {
                if j == columns {
                    continue
                }
                /// Копируем элемент из текущей матрицы в соответствующую позицию в матрице минора.
                resultMinor.matrix[resultRow][resultColumn] = self.matrix[i][j]
                resultColumn += 1
            }
            resultRow += 1
        }
        return resultMinor
    }
    
    /**
     Вычисляет и возвращает определитель текущей матрицы.
     
     - Returns: Возвращает значение типа Double.
     - Throws: `MatrixError.matrixNotSquare`. Если матрица не является квадратной.
     */
    public func determinantMatrix() throws -> Double {
        guard rows == columns else {
            throw MatrixError.matrixNotSquare
        }
        var resultDeterminant = 0.0
        /// Если количество строк равно 1, значит матрица представляет собой один элемент,
        /// и детерминант будет равен этому элементу matrix[0][0].
        if rows == 1 {
            resultDeterminant = matrix[0][0]
            /// Если количество строк равно 2, метод использует формулу для вычисления детерминанта матрицы 2x2.
        } else if rows == 2 {
            resultDeterminant = matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0]
            /// Если количество строк больше 2, метод использует разложение по первому столбцу матрицы
            /// и рекурсивно вычисляет детерминант матрицы миноров. Для каждой строки i в цикле for,
            /// метод создает минорную матрицу, ищет ее детерминант и добавляет его к результату,
            /// умноженному на соответствующий элемент матрицы и знак (-1 или 1).
            /// Затем знак меняется для следующей итерации с помощью sign *= -1
        } else if rows > 2 {
            //var sign = 1
            for i in 0..<rows {
                let minor = try self.minorMatrix(rows: i, columns: 0)
                let minorDet = try minor.determinantMatrix()
                resultDeterminant += pow(-1.0, Double(i)) * matrix[i][0] * minorDet
            }
        }
        return resultDeterminant
    }
    
    /**
     Вычисляет матрицу алгебраических дополнений текущей матрицы и возвращает ее.
     
     - Returns: Возвращает значение типа Matrix.
     - Throws: `MatrixError.matrixNotSquare`. Если матрица не является квадратной.
     */
    public func calcComplementsMatrix() throws -> Matrix {
        guard rows == columns else {
            throw MatrixError.matrixNotSquare
        }
        let result = try Matrix(rows: rows, columns: columns)
        for i in 0..<rows {
            for j in 0..<columns {
                let minor = try minorMatrix(rows: i, columns: j)
                let minorDet = try minor.determinantMatrix()
                result.matrix[i][j] = pow(-1.0, Double(i + j)) * minorDet
            }
        }
        return result
    }
    
    /**
     Вычисляет и возвращает обратную матрицу.
     
     - Returns: Возвращает значение типа Matrix.
     - Throws: `MatrixError.determinantIsZeroOrNaN`. Если определитель матрицы равен 0.
     */
    public func inverseMatrix() throws -> Matrix {
        let determinant = try self.determinantMatrix()
        guard !(fabs(determinant) < Math.epsilon || determinant.isNaN) else {
            throw MatrixError.determinantIsZeroOrNaN
        }
        let result = try Matrix(rows: rows, columns: columns)
        let complMat = try self.calcComplementsMatrix()
        let transMat = try complMat.transposeMatrix()
        
        for i in 0..<rows {
            for j in 0..<columns {
                result.matrix[i][j] = transMat.matrix[i][j] / determinant
            }
        }
        return result
    }
    
    // MARK: - Перегрузка операторов
    
    /**
     Сложение двух матриц.
     
     - Parameters:
     - lhs: Принимает первую матрицу.
     - rhs: Принимает вторую матрицу.
     - Returns: Возвращает значение типа Matrix.
     - Throws: `MatrixError.differentMatrixSize`. Если размеры матриц не совпадают (количество строк или столбцов).
     */
    static func + (lhs: Matrix, rhs: Matrix) throws -> Matrix {
        guard lhs.rows == rhs.rows && lhs.columns == rhs.columns else {
            throw MatrixError.differentMatrixSize
        }
        try? lhs.sumMatrix(other: rhs)
        return lhs
    }
    
    /**
     Вычитание одной матрицы из другой.
     
     - Parameters:
     - lhs: Принимает первую матрицу.
     - rhs: Принимает вторую матрицу.
     - Returns: Возвращает значение типа Matrix.
     - Throws: `MatrixError.differentMatrixSize`. Если размеры матриц не совпадают (количество строк или столбцов).
     */
    static func - (lhs: Matrix, rhs: Matrix) throws -> Matrix {
        guard lhs.rows == rhs.rows && lhs.columns == rhs.columns else {
            throw MatrixError.differentMatrixSize
        }
        try? lhs.subMatrix(other: rhs)
        return lhs
    }
    
    /**
     Умножение матрицы на число.
     
     - Parameters:
     - lhs: Принимает первую матрицу.
     - rhs: Принимает число .
     - Returns: Возвращает значение типа Matrix.
     */
    static func * (lhs: Matrix, rhs: Double) -> Matrix {
        lhs.mulNumber(number: rhs)
        return lhs
    }
    
    /**
     Умножение матриц.
     
     - Parameters:
     - lhs: Принимает первую матрицу.
     - rhs: Принимает вторую матрицу.
     - Returns: Возвращает значение типа Matrix.
     - Throws: `MatrixError.differentColumnsAndRows`. Если число столбцов первой матрицы не равно числу строк второй матрицы.
     */
    static func * (lhs: Matrix, rhs: Matrix) throws -> Matrix {
        guard lhs.columns == rhs.rows else {
            throw MatrixError.differentColumnsAndRows
        }
        try lhs.mulMatrix(other: rhs)
        return lhs
    }
    
    /**
     Проверка на равенство матриц.
     
     - Parameters:
     - lhs: Принимает первую матрицу.
     - rhs: Принимает вторую матрицу.
     - Returns: Возвращает значение типа Bool.
     */
    static func == (lhs: Matrix, rhs: Matrix) -> Bool {
        return lhs.equalMatrix(other: rhs)
    }
    
    /**
     Присвоение сложения.
     
     - Parameters:
     - lhs: Принимает первую матрицу.
     - rhs: Принимает вторую матрицу.
     - Returns: Возвращает значение типа Matrix.
     - Throws: `MatrixError.differentMatrixSize`. Если размеры матриц не совпадают (количество строк или столбцов).
     */
    static func += (lhs: inout Matrix, rhs: Matrix) throws -> Matrix {
        guard lhs.rows == rhs.rows || lhs.columns == rhs.columns else {
            throw MatrixError.differentMatrixSize
        }
        try? lhs.sumMatrix(other: rhs)
        return lhs
        
    }
    
    /**
     Присвоение разности.
     
     - Parameters:
     - lhs: Принимает первую матрицу.
     - rhs: Принимает вторую матрицу.
     - Returns: Возвращает значение типа Matrix.
     - Throws: `MatrixError.differentMatrixSize`. Если размеры матриц не совпадают (количество строк или столбцов).
     */
    static func -= (lhs: inout Matrix, rhs: Matrix) throws -> Matrix {
        guard lhs.rows == rhs.rows || lhs.columns == rhs.columns else {
            throw MatrixError.differentMatrixSize
        }
        try? lhs.subMatrix(other: rhs)
        return lhs
    }
    
    /**
     Присвоение умножения матрицы на число.
     
     - Parameters:
     - lhs: Принимает первую матрицу.
     - rhs: Принимает число.
     - Returns: Возвращает значение типа Matrix.
     */
    static func *= (lhs: inout Matrix, rhs: Double) -> Matrix {
        lhs.mulNumber(number: rhs)
        return lhs
    }
    
    /**
     Присвоение умножения текущей матрицы на другую матрицу.
     
     - Parameters:
     - lhs: Принимает первую матрицу.
     - rhs: Принимает вторую матрицу.
     - Returns: Возвращает значение типа Matrix.
     - Throws: `MatrixError.differentColumnsAndRows`. Если число столбцов первой матрицы не равно числу строк второй матрицы.
     */
    static func *= (lhs: inout Matrix, rhs: Matrix) throws -> Matrix {
        guard lhs.columns == rhs.rows else {
            throw MatrixError.differentColumnsAndRows
        }
        try? lhs.mulMatrix(other: rhs)
        return lhs
    }
    
}
