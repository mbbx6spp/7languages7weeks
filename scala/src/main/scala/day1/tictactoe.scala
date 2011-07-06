/**
 * @author Susan Potter <@SusanPotter>
 * 
 * This is my simple attempt to model a tictactoe game in Scala Day 1.
 * From the Seven Languages Seven Weeks book.
 */
package day1.tictactoe {

  import scala.collection.mutable._
  
  class TicTacToeSymbol(symbol : java.lang.Character) {
    def print = println(symbol)
    def toChar = symbol
    override def toString = symbol.toString
  }

  // Psuedo flyweights via object declarations
  // I could just use java.lang.Characters or even Strings,
  // but I wanted to see what would happen with extending object
  // definitions this way.

  // PS a Nought is an 'oh' and a Cross is an 'ex' for American readers
  object Nought extends TicTacToeSymbol('O')
  object Cross extends TicTacToeSymbol('X')
  object Empty extends TicTacToeSymbol(' ')
  
  class TicTacToeLine(cells : List[TicTacToeSymbol]) {
    def isWinning = {
      val first = cells.first
      if (Nought == first || Cross == first) {
        cells.forall { cell =>
          first == cell
        }
      } else {
        false
      }
    }

    def isEmpty = {
      cells.forall { cell => cell == Empty }
    }

    def toList = {
      cells
    }
  }

  object EmptyLine extends TicTacToeLine(List(Empty, Empty, Empty))

  // immutable so precalculate all "views" of matrix
  class TicTacToeMatrix(rows : List[TicTacToeLine]) {
    val length = rows.length
    val range = 0 until length
    val columns = new ArrayBuffer[TicTacToeLine](length)
    range.foreach { colIdx =>
      val l = new ArrayBuffer[TicTacToeSymbol](length)
      rows.foreach { row =>
        l.append(row.toList(colIdx))
      }
      columns.append(new TicTacToeLine(l.toList))
    }
    println(columns)

    def winner : Option[TicTacToeLine] = {
      List(winningHorizontal, winningVertical, winningDiagonal).find { line =>
        line.isWinning
      }
    }

    private def winningHorizontal : TicTacToeLine = {
      rows.find { row => row.isWinning }.getOrElse(EmptyLine)
    }

    private def winningVertical : TicTacToeLine = {
      columns.find { col => col.isWinning }.getOrElse(EmptyLine)
    }

    private def winningDiagonal : TicTacToeLine = {
      val left = new ArrayBuffer[TicTacToeSymbol](length)
      val right = new ArrayBuffer[TicTacToeSymbol](length)
      range.foreach { idx => 
        left.append(getAt(idx, idx))
        right.append(getAt((length - idx - 1), idx))
      }
      List(new TicTacToeLine(left.toList), 
            new TicTacToeLine(right.toList)).find { diag => 
        diag.isWinning
      }.getOrElse(EmptyLine)
    }

    private def getAt(X : Int, Y : Int) : TicTacToeSymbol = {
      val row = rows.toList(Y)
      row.toList(X)
    }
  }
  
  class TicTacToeBoard(matrix : TicTacToeMatrix) {
    def whoWins : TicTacToeSymbol = {
      matrix.winner.getOrElse(EmptyLine).toList.head
    }
  }
}
