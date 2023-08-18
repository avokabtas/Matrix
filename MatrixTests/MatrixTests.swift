//
//  MatrixTests.swift
//  MatrixTests
//
//  Created by Aliia Satbakova on 15.08.2023.
//

import XCTest
@testable import Matrix

final class MatrixTests: XCTestCase {
  
  // MARK: - Индексация по элементам матрицы
  
  func testSubscript() {
    // given
    let matrix = Matrix()
    // when
    matrix[0, 0] = 1
    matrix[1, 1] = 2
    // then
    XCTAssertEqual(matrix[0, 0], 1.0)
    XCTAssertEqual(matrix[1, 1], 2.0)
  }
  
  // MARK: - Геттеры и сеттеры
  
  func testNumberOfRows() {
    do {
      // given
      let matrix = try Matrix(rows: 2, columns: 2)
      // when
      matrix.numberOfRows = 4
      // then
      XCTAssertEqual(matrix.numberOfRows, 4)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testNumberOfColumns() {
    do {
      // given
      let matrix = try Matrix(rows: 2, columns: 2)
      // when
      matrix.numberOfColumns = 4
      // then
      XCTAssertEqual(matrix.numberOfColumns, 4)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  //MARK: - Операции над матрицами
  
  func testEqualMatrix() {
    // given
    let matrixOne = Matrix()
    let matrixTwo = Matrix()
    // then
    XCTAssertTrue(matrixOne.equalMatrix(other: matrixTwo))
  }
  
  func testEqualMatrix2() {
    do {
      // given
      let matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 5
      matrixOne[0, 1] = 5
      matrixOne[1, 0] = 5
      matrixOne[1, 1] = 5
      let matrixTwo = try Matrix(rows: 2, columns: 2)
      matrixTwo[0, 0] = 5
      matrixTwo[0, 1] = 5
      matrixTwo[1, 0] = 5
      matrixTwo[1, 1] = 5
      // then
      XCTAssertTrue(matrixOne.equalMatrix(other: matrixTwo))
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testEqualMatrix3() {
    do {
      // given
      let matrixOne = try Matrix(rows: 2, columns: 3)
      let matrixTwo = try Matrix(rows: 7, columns: 8)
      // then
      XCTAssertFalse(matrixOne.equalMatrix(other: matrixTwo))
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testEqualMatrix4() {
    do {
      // given
      let matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 1
      matrixOne[0, 1] = 2
      matrixOne[1, 0] = 3
      matrixOne[1, 1] = 4
      let matrixTwo = try Matrix(rows: 2, columns: 2)
      matrixTwo[0, 0] = 5
      matrixTwo[0, 1] = 6
      matrixTwo[1, 0] = 7
      matrixTwo[1, 1] = 8
      // then
      XCTAssertFalse(matrixOne.equalMatrix(other: matrixTwo))
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testSumMatrix() {
    do {
      // given
      let matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 1
      matrixOne[0, 1] = 2
      matrixOne[1, 0] = 3
      matrixOne[1, 1] = 4
      let matrixTwo = try Matrix(rows: 2, columns: 2)
      matrixTwo[0, 0] = 5
      matrixTwo[0, 1] = 6
      matrixTwo[1, 0] = 7
      matrixTwo[1, 1] = 8
      // when
      try matrixOne.sumMatrix(other: matrixTwo)
      // then
      XCTAssertEqual(matrixOne[0, 0], 6.0)
      XCTAssertEqual(matrixOne[0, 1], 8.0)
      XCTAssertEqual(matrixOne[1, 0], 10.0)
      XCTAssertEqual(matrixOne[1, 1], 12.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testSumMatrixError() {
    do {
      // given
      let matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 1
      matrixOne[0, 1] = 2
      matrixOne[1, 0] = 3
      matrixOne[1, 1] = 4
      let matrixTwo = try Matrix(rows: 3, columns: 3)
      matrixTwo[0, 0] = 1
      matrixTwo[0, 1] = 2
      matrixTwo[0, 2] = 3
      matrixTwo[1, 0] = 4
      matrixTwo[1, 1] = 5
      matrixTwo[1, 2] = 6
      matrixTwo[2, 0] = 7
      matrixTwo[2, 1] = 8
      matrixTwo[2, 2] = 9
      // then
      XCTAssertThrowsError(try matrixOne.sumMatrix(other: matrixTwo)) { error in
        XCTAssertEqual((error as? MatrixError), MatrixError.differentMatrixSize)
      }
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testSumMatrixError2() {
    do {
      // given
      let matrixOne = Matrix()
      let matrixTwo = try Matrix(rows: 1, columns: 1)
      // then
      XCTAssertThrowsError(try matrixOne.sumMatrix(other: matrixTwo)) { error in
        XCTAssertEqual((error as? MatrixError), MatrixError.differentMatrixSize)
      }
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testSubMatrix() {
    do {
      // given
      let matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 2
      matrixOne[0, 1] = 2
      matrixOne[1, 0] = 2
      matrixOne[1, 1] = 2
      let matrixTwo = try Matrix(rows: 2, columns: 2)
      matrixTwo[0, 0] = 1
      matrixTwo[0, 1] = 1
      matrixTwo[1, 0] = 1
      matrixTwo[1, 1] = 1
      // when
      try matrixOne.subMatrix(other: matrixTwo)
      // then
      XCTAssertEqual(matrixOne[0, 0], 1.0)
      XCTAssertEqual(matrixOne[0, 1], 1.0)
      XCTAssertEqual(matrixOne[1, 0], 1.0)
      XCTAssertEqual(matrixOne[1, 1], 1.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testSubMatrixError() {
    do {
      // given
      let matrixOne = Matrix()
      let matrixTwo = try Matrix(rows: 4, columns: 4)
      // then
      XCTAssertThrowsError(try matrixOne.subMatrix(other: matrixTwo)) { error in
        XCTAssertEqual((error as? MatrixError), MatrixError.differentMatrixSize)
      }
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testMulNumber() {
    do {
      // given
      let matrix = try Matrix(rows: 2, columns: 2)
      matrix[0, 0] = 1
      matrix[0, 1] = 2
      matrix[1, 0] = 3
      matrix[1, 1] = 4
      // when
      matrix.mulNumber(number: 2)
      // then
      XCTAssertEqual(matrix[0, 0], 2.0)
      XCTAssertEqual(matrix[0, 1], 4.0)
      XCTAssertEqual(matrix[1, 0], 6.0)
      XCTAssertEqual(matrix[1, 1], 8.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testMulMatrix() {
    do {
      // given
      let matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 1
      matrixOne[0, 1] = 2
      matrixOne[1, 0] = 3
      matrixOne[1, 1] = 4
      let matrixTwo = try Matrix(rows: 2, columns: 2)
      matrixTwo[0, 0] = 5
      matrixTwo[0, 1] = 6
      matrixTwo[1, 0] = 7
      matrixTwo[1, 1] = 8
      // when
      try matrixOne.mulMatrix(other: matrixTwo)
      // then
      XCTAssertEqual(matrixOne[0, 0], 19.0)
      XCTAssertEqual(matrixOne[0, 1], 22.0)
      XCTAssertEqual(matrixOne[1, 0], 43.0)
      XCTAssertEqual(matrixOne[1, 1], 50.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testMulMatrix2() {
    do {
      // given
      let matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 3
      matrixOne[0, 1] = 3
      matrixOne[1, 0] = 3
      matrixOne[1, 1] = 3
      let matrixTwo = try Matrix(rows: 2, columns: 2)
      matrixTwo[0, 0] = 3
      matrixTwo[0, 1] = 3
      matrixTwo[1, 0] = 3
      matrixTwo[1, 1] = 3
      // when
      try matrixOne.mulMatrix(other: matrixTwo)
      // then
      XCTAssertEqual(matrixOne[0, 0], 18.0)
      XCTAssertEqual(matrixOne[0, 1], 18.0)
      XCTAssertEqual(matrixOne[1, 0], 18.0)
      XCTAssertEqual(matrixOne[1, 1], 18.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testMulMatrixError() {
    do {
      // given
      let matrixOne = try Matrix(rows: 2, columns: 1)
      let matrixTwo = try Matrix(rows: 2, columns: 1)
      // then
      XCTAssertThrowsError(try matrixOne.mulMatrix(other: matrixTwo)) { error in
        XCTAssertEqual((error as? MatrixError), MatrixError.differentColumnsAndRows)
      }
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testTransposeMatrix() {
    do {
      // given
      var matrix = try Matrix(rows: 2, columns: 2)
      matrix[0, 0] = 4
      matrix[0, 1] = 8
      matrix[1, 0] = 3
      matrix[1, 1] = 5
      // when
      matrix = try matrix.transposeMatrix()
      // then
      XCTAssertEqual(matrix[0, 0], 4.0)
      XCTAssertEqual(matrix[0, 1], 3.0)
      XCTAssertEqual(matrix[1, 0], 8.0)
      XCTAssertEqual(matrix[1, 1], 5.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testDeterminantMatrix() {
    do {
      // given
      let matrix = try Matrix(rows: 2, columns: 2)
      matrix[0, 0] = 1
      matrix[0, 1] = 2
      matrix[1, 0] = 3
      matrix[1, 1] = 4
      // then
      XCTAssertEqual(try matrix.determinantMatrix(), -2.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }

  func testDeterminantMatrix2() {
    do {
      // given
      let matrix = try Matrix(rows: 2, columns: 2)
      matrix[0, 0] = 22
      matrix[0, 1] = 21
      matrix[1, 0] = 24
      matrix[1, 1] = 32
      // then
      XCTAssertEqual(try matrix.determinantMatrix(), 200.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testDeterminantMatrix3() {
    do {
      // given
      let matrix = try Matrix(rows: 2, columns: 2)
      matrix[0, 0] = -5
      matrix[0, 1] = -4
      matrix[1, 0] = -2
      matrix[1, 1] = -3
      // then
      XCTAssertEqual(try matrix.determinantMatrix(), 7.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testDeterminantMatrix4() {
    do {
      // given
      let matrix = try Matrix(rows: 5, columns: 5)
      // then
      XCTAssertEqual(try matrix.determinantMatrix(), 0.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testDeterminantMatrixError() {
    do {
      // given
      let matrix = try Matrix(rows: 5, columns: 1)
      // then
      XCTAssertThrowsError(try matrix.determinantMatrix()) { error in
        XCTAssertEqual((error as? MatrixError), MatrixError.matrixNotSquare)
      }
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testCalcComplementsMatrix() {
    do {
      // given
      let matrix = try Matrix(rows: 2, columns: 2)
      matrix[0, 0] = 1
      matrix[0, 1] = 2
      matrix[1, 0] = 3
      matrix[1, 1] = 4
      // when
      let complementsMatrix = try matrix.calcComplementsMatrix()
      // then
      XCTAssertEqual(complementsMatrix[0, 0], 4.0)
      XCTAssertEqual(complementsMatrix[0, 1], -3.0)
      XCTAssertEqual(complementsMatrix[1, 0], -2.0)
      XCTAssertEqual(complementsMatrix[1, 1], 1.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testCalcComplementsMatrixError() {
    do {
      // given
      let matrix = try Matrix(rows: 2, columns: 7)
      // then
      XCTAssertThrowsError(try matrix.calcComplementsMatrix()) { error in
        XCTAssertEqual((error as? MatrixError), MatrixError.matrixNotSquare)
      }
    } catch {
      XCTFail("Error: \(error)")
    }
  }

  func testInverseMatrix() {
    do {
      // given
      let matrix = try Matrix(rows: 2, columns: 2)
      matrix[0, 0] = 1
      matrix[0, 1] = 2
      matrix[1, 0] = 3
      matrix[1, 1] = 4
      // when
      let inverseMatrix = try matrix.inverseMatrix()
      // then
      XCTAssertEqual(inverseMatrix[0, 0], -2.0)
      XCTAssertEqual(inverseMatrix[0, 1], 1.0)
      XCTAssertEqual(inverseMatrix[1, 0], 1.5)
      XCTAssertEqual(inverseMatrix[1, 1], -0.5)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testInverseMatrix2() {
    do {
      // given
      let matrix = Matrix()
      matrix[0, 0] = 8
      matrix[0, 1] = 2
      matrix[0, 2] = 4
      
      matrix[1, 0] = 4
      matrix[1, 1] = 6
      matrix[1, 2] = 6
      
      matrix[2, 0] = 4
      matrix[2, 1] = 8
      matrix[2, 2] = 8
      // when
      let inverseMatrix = try matrix.inverseMatrix()
      // then
      XCTAssertEqual(inverseMatrix[0, 0], 0.0)
      XCTAssertEqual(inverseMatrix[0, 1], 1.0)
      XCTAssertEqual(inverseMatrix[0, 2], -0.75)

      XCTAssertEqual(inverseMatrix[1, 0], -0.5)
      XCTAssertEqual(inverseMatrix[1, 1], 3.0)
      XCTAssertEqual(inverseMatrix[1, 2], -2.0)
      
      XCTAssertEqual(inverseMatrix[2, 0], 0.5)
      XCTAssertEqual(inverseMatrix[2, 1], -3.5)
      XCTAssertEqual(inverseMatrix[2, 2], 2.5)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testInverseMatrixError() {
    do {
      // given
      let matrix = try Matrix(rows: 3, columns: 3)
      matrix[0, 0] = 2
      matrix[0, 1] = 2
      matrix[0, 2] = 2

      matrix[1, 0] = 2
      matrix[1, 1] = 2
      matrix[1, 2] = 2

      matrix[2, 0] = 2
      matrix[2, 1] = 2
      matrix[2, 2] = 2
      // then
      XCTAssertThrowsError(try matrix.inverseMatrix()) { error in
        XCTAssertEqual((error as? MatrixError), MatrixError.determinantIsZeroOrNaN)
      }
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  //MARK: - Перегрузка операторов
  
  func testAdditionOperator() {
    do {
      // given
      var matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 1
      matrixOne[0, 1] = 1
      matrixOne[1, 0] = 1
      matrixOne[1, 1] = 1
      let matrixTwo = try Matrix(rows: 2, columns: 2)
      matrixTwo[0, 0] = 1
      matrixTwo[0, 1] = 1
      matrixTwo[1, 0] = 1
      matrixTwo[1, 1] = 1
      // when
      matrixOne = try matrixOne + matrixTwo
      // then
      XCTAssertEqual(matrixOne[0, 0], 2.0)
      XCTAssertEqual(matrixOne[0, 1], 2.0)
      XCTAssertEqual(matrixOne[1, 0], 2.0)
      XCTAssertEqual(matrixOne[1, 1], 2.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testAdditionOperatorError() {
    do {
      // given
      let matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 1
      matrixOne[0, 1] = 1
      matrixOne[1, 0] = 1
      matrixOne[1, 1] = 1
      let matrixTwo = try Matrix(rows: 1, columns: 2)
      matrixTwo[0, 0] = 1
      matrixTwo[0, 1] = 1
      // then
      XCTAssertThrowsError(try matrixOne + matrixTwo) { error in
        XCTAssertEqual((error as? MatrixError), MatrixError.differentMatrixSize)
      }
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testSubtractionOperator() {
    do {
      // given
      var matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 3
      matrixOne[0, 1] = 3
      matrixOne[1, 0] = 3
      matrixOne[1, 1] = 3
      let matrixTwo = try Matrix(rows: 2, columns: 2)
      matrixTwo[0, 0] = 1
      matrixTwo[0, 1] = 1
      matrixTwo[1, 0] = 1
      matrixTwo[1, 1] = 1
      // when
      matrixOne = try matrixOne - matrixTwo
      // then
      XCTAssertEqual(matrixOne[0, 0], 2.0)
      XCTAssertEqual(matrixOne[0, 1], 2.0)
      XCTAssertEqual(matrixOne[1, 0], 2.0)
      XCTAssertEqual(matrixOne[1, 1], 2.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testSubtractionOperatorError() {
    do {
      // given
      let matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 1
      matrixOne[0, 1] = 1
      matrixOne[1, 0] = 1
      matrixOne[1, 1] = 1
      let matrixTwo = try Matrix(rows: 1, columns: 2)
      matrixTwo[0, 0] = 1
      matrixTwo[0, 1] = 1
      // then
      XCTAssertThrowsError(try matrixOne - matrixTwo) { error in
        XCTAssertEqual((error as? MatrixError), MatrixError.differentMatrixSize)
      }
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testMultiplicationByNumberOperator() {
    do {
      // given
      var matrix = try Matrix(rows: 2, columns: 2)
      matrix[0, 0] = 2
      matrix[0, 1] = 2
      matrix[1, 0] = 2
      matrix[1, 1] = 2
      // when
      matrix = matrix * 2
      // then
      XCTAssertEqual(matrix[0, 0], 4.0)
      XCTAssertEqual(matrix[0, 1], 4.0)
      XCTAssertEqual(matrix[1, 0], 4.0)
      XCTAssertEqual(matrix[1, 1], 4.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testMultiplicationMatrixOperator() {
    do {
      // given
      var matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 1
      matrixOne[0, 1] = 2
      matrixOne[1, 0] = 3
      matrixOne[1, 1] = 4
      let matrixTwo = try Matrix(rows: 2, columns: 2)
      matrixTwo[0, 0] = 5
      matrixTwo[0, 1] = 6
      matrixTwo[1, 0] = 7
      matrixTwo[1, 1] = 8
      // when
      matrixOne = try matrixOne * matrixTwo
      // then
      XCTAssertEqual(matrixOne[0, 0], 19.0)
      XCTAssertEqual(matrixOne[0, 1], 22.0)
      XCTAssertEqual(matrixOne[1, 0], 43.0)
      XCTAssertEqual(matrixOne[1, 1], 50.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testMultiplicationMatrixOperator2() {
    do {
      // given
      var matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 3
      matrixOne[0, 1] = 3
      matrixOne[1, 0] = 3
      matrixOne[1, 1] = 3
      let matrixTwo = try Matrix(rows: 2, columns: 2)
      matrixTwo[0, 0] = 3
      matrixTwo[0, 1] = 3
      matrixTwo[1, 0] = 3
      matrixTwo[1, 1] = 3
      // when
      matrixOne = try matrixOne * matrixTwo
      // then
      XCTAssertEqual(matrixOne[0, 0], 18.0)
      XCTAssertEqual(matrixOne[0, 1], 18.0)
      XCTAssertEqual(matrixOne[1, 0], 18.0)
      XCTAssertEqual(matrixOne[1, 1], 18.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testMultiplicationMatrixOperatorError() {
    do {
      // given
      let matrixOne = try Matrix(rows: 2, columns: 2)
      let matrixTwo = try Matrix(rows: 1, columns: 2)
      // then
      XCTAssertThrowsError(try matrixOne * matrixTwo) { error in
        XCTAssertEqual((error as? MatrixError), MatrixError.differentColumnsAndRows)
      }
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testEqualityOperator() {
    do {
      // given
      let matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 1
      matrixOne[0, 1] = 2
      matrixOne[1, 0] = 3
      matrixOne[1, 1] = 4
      let matrixTwo = try Matrix(rows: 2, columns: 2)
      matrixTwo[0, 0] = 5
      matrixTwo[0, 1] = 6
      matrixTwo[1, 0] = 7
      matrixTwo[1, 1] = 8
      // then
      XCTAssertFalse(matrixOne == matrixTwo)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testEqualityOperator2() {
    do {
      // given
      let matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 5
      matrixOne[0, 1] = 5
      matrixOne[1, 0] = 5
      matrixOne[1, 1] = 5
      let matrixTwo = try Matrix(rows: 2, columns: 2)
      matrixTwo[0, 0] = 5
      matrixTwo[0, 1] = 5
      matrixTwo[1, 0] = 5
      matrixTwo[1, 1] = 5
      // then
      XCTAssertTrue(matrixOne == matrixTwo)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testAdditionAssignmentOperator() {
    do {
      // given
      var matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 5
      matrixOne[0, 1] = 5
      matrixOne[1, 0] = 5
      matrixOne[1, 1] = 5
      let matrixTwo = try Matrix(rows: 2, columns: 2)
      matrixTwo[0, 0] = 5
      matrixTwo[0, 1] = 5
      matrixTwo[1, 0] = 5
      matrixTwo[1, 1] = 5
      // when
      try matrixOne += matrixTwo
      // then
      XCTAssertEqual(matrixOne[0, 0], 10.0)
      XCTAssertEqual(matrixOne[0, 1], 10.0)
      XCTAssertEqual(matrixOne[1, 0], 10.0)
      XCTAssertEqual(matrixOne[1, 1], 10.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testAdditionAssignmentOperatorError() {
    do {
      // given
      var matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 1
      matrixOne[0, 1] = 1
      matrixOne[1, 0] = 1
      matrixOne[1, 1] = 1
      // when
      let matrixTwo = Matrix()
      // then
      XCTAssertThrowsError(try matrixOne += matrixTwo) { error in
        XCTAssertEqual((error as? MatrixError), MatrixError.differentMatrixSize)
      }
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testDifferenceAssignmentOperator() {
    do {
      // given
      var matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 5
      matrixOne[0, 1] = 5
      matrixOne[1, 0] = 5
      matrixOne[1, 1] = 5
      let matrixTwo = try Matrix(rows: 2, columns: 2)
      matrixTwo[0, 0] = 2
      matrixTwo[0, 1] = 2
      matrixTwo[1, 0] = 2
      matrixTwo[1, 1] = 2
      // when
      try matrixOne -= matrixTwo
      // then
      XCTAssertEqual(matrixOne[0, 0], 3.0)
      XCTAssertEqual(matrixOne[0, 1], 3.0)
      XCTAssertEqual(matrixOne[1, 0], 3.0)
      XCTAssertEqual(matrixOne[1, 1], 3.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testDifferenceAssignmentOperatorError() {
    do {
      // given
      var matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 1
      matrixOne[0, 1] = 1
      matrixOne[1, 0] = 1
      matrixOne[1, 1] = 1
      // when
      let matrixTwo = Matrix()
      // then
      XCTAssertThrowsError(try matrixOne -= matrixTwo) { error in
        XCTAssertEqual((error as? MatrixError), MatrixError.differentMatrixSize)
      }
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testMultiplicationAssignmentByNumberOperator() {
    do {
      // given
      var matrix = try Matrix(rows: 2, columns: 2)
      matrix[0, 0] = 5
      matrix[0, 1] = 5
      matrix[1, 0] = 5
      matrix[1, 1] = 5
      // when
      matrix *= 2
      // then
      XCTAssertEqual(matrix[0, 0], 10.0)
      XCTAssertEqual(matrix[0, 1], 10.0)
      XCTAssertEqual(matrix[1, 0], 10.0)
      XCTAssertEqual(matrix[1, 1], 10.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testMultiplicationAssignmentMatrixOperator() {
    do {
      // given
      var matrixOne = try Matrix(rows: 2, columns: 2)
      matrixOne[0, 0] = 1
      matrixOne[0, 1] = 2
      matrixOne[1, 0] = 3
      matrixOne[1, 1] = 4
      let matrixTwo = try Matrix(rows: 2, columns: 2)
      matrixTwo[0, 0] = 5
      matrixTwo[0, 1] = 6
      matrixTwo[1, 0] = 7
      matrixTwo[1, 1] = 8
      // when
      try matrixOne *= matrixTwo
      // then
      XCTAssertEqual(matrixOne[0, 0], 19.0)
      XCTAssertEqual(matrixOne[0, 1], 22.0)
      XCTAssertEqual(matrixOne[1, 0], 43.0)
      XCTAssertEqual(matrixOne[1, 1], 50.0)
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  func testMultiplicationAssignmentMatrixOperatorError() {
    do {
      // given
      var matrixOne = try Matrix(rows: 2, columns: 1)
      let matrixTwo = try Matrix(rows: 2, columns: 1)
      // then
      XCTAssertThrowsError(try matrixOne *= matrixTwo) { error in
        XCTAssertEqual((error as? MatrixError), MatrixError.differentColumnsAndRows)
      }
    } catch {
      XCTFail("Error: \(error)")
    }
  }
  
  static var allTests = [
    ("testSubscript", testSubscript),
    ("testNumberOfRows", testNumberOfRows),
    ("testNumberOfColumns", testNumberOfColumns),
    ("testEqualMatrix", testEqualMatrix),
    ("testEqualMatrix2", testEqualMatrix2),
    ("testEqualMatrix3", testEqualMatrix3),
    ("testEqualMatrix4", testEqualMatrix4),
    ("testSumMatrix", testSumMatrix),
    ("testSumMatrixError", testSumMatrixError),
    ("testSumMatrixError2", testSumMatrixError2),
    ("testSubMatrix", testSubMatrix),
    ("testSubMatrixError", testSubMatrixError),
    ("testMulNumber", testMulNumber),
    ("testMulMatrix", testMulMatrix),
    ("testMulMatrix2", testMulMatrix2),
    ("testMulMatrixError", testMulMatrixError),
    ("testTransposeMatrix", testTransposeMatrix),
    ("testDeterminantMatrix", testDeterminantMatrix),
    ("testDeterminantMatrix2", testDeterminantMatrix2),
    ("testDeterminantMatrix3", testDeterminantMatrix3),
    ("testDeterminantMatrix4", testDeterminantMatrix4),
    ("testDeterminantMatrixError", testDeterminantMatrixError),
    ("testCalcComplementsMatrix", testCalcComplementsMatrix),
    ("testCalcComplementsMatrixError", testCalcComplementsMatrixError),
    ("testInverseMatrix", testInverseMatrix),
    ("testInverseMatrix2", testInverseMatrix2),
    ("testInverseMatrixError", testInverseMatrixError),
    ("testAdditionOperator", testAdditionOperator),
    ("testAdditionOperatorError", testAdditionOperatorError),
    ("testSubtractionOperator", testSubtractionOperator),
    ("testSubtractionOperatorError", testSubtractionOperatorError),
    ("testMultiplicationByNumberOperator", testMultiplicationByNumberOperator),
    ("testMultiplicationMatrixOperator", testMultiplicationMatrixOperator),
    ("testMultiplicationMatrixOperator2", testMultiplicationMatrixOperator2),
    ("testMultiplicationMatrixOperatorError", testMultiplicationMatrixOperatorError),
    ("testEqualityOperator", testEqualityOperator),
    ("testEqualityOperator2", testEqualityOperator2),
    ("testAdditionAssignmentOperator", testAdditionAssignmentOperator),
    ("testAdditionAssignmentOperatorError", testAdditionAssignmentOperatorError),
    ("testDifferenceAssignmentOperator", testDifferenceAssignmentOperator),
    ("testDifferenceAssignmentOperatorError", testDifferenceAssignmentOperatorError),
    ("testMultiplicationAssignmentByNumberOperator", testMultiplicationAssignmentByNumberOperator),
    ("testMultiplicationAssignmentMatrixOperator", testMultiplicationAssignmentMatrixOperator),
    ("testMultiplicationAssignmentMatrixOperatorError", testMultiplicationAssignmentMatrixOperatorError)
  ]
  
}

