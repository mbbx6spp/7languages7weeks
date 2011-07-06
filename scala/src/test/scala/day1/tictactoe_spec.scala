import org.scalatest.FlatSpec
import org.scalatest.matchers.ShouldMatchers
import day1.tictactoe._

class TicTacToeSpec extends FlatSpec with ShouldMatchers {
  "A Nought" should "return 'O' from #toChar" in {
    assert(Nought.toChar === 'O')
  }

  "A Cross" should "return 'X' from #toChar" in {
    assert(Cross.toChar === 'X')
  }

  "A Cross winning 4x4 TicTacToe line" should "return Cross from #isWinning" in {
    val winningLine = new TicTacToeLine(List(Cross, Cross, Cross, Cross))
    assert(winningLine.isWinning)
  }

  "An empty TicTacToe board" should "return Empty as the winner" in {
    val board = new TicTacToeBoard(
      new TicTacToeMatrix(List(EmptyLine, EmptyLine, EmptyLine)))
    assert(Empty === board.whoWins)
  }

  "An partial TicTacToe board" should "return Empty as the winner" in {
    val row1 = new TicTacToeLine(List(Nought, Empty, Empty))
    val row2 = new TicTacToeLine(List(Empty, Cross, Empty))
    val row3 = new TicTacToeLine(List(Empty, Empty, Nought))
    val board = new TicTacToeBoard(new TicTacToeMatrix(List(row1, row2, row3)))
    assert(Empty === board.whoWins)
  }

  "A tied TicTacToe board" should "return Empty as the winner" in {
    val row1 = new TicTacToeLine(List(Nought, Cross, Nought))
    val row2 = new TicTacToeLine(List(Nought, Cross, Cross))
    val row3 = new TicTacToeLine(List(Cross, Nought, Nought))
    val board = new TicTacToeBoard(new TicTacToeMatrix(List(row1, row2, row3)))
    assert(Empty === board.whoWins)
  }

  "A Nought left diagonal winning TicTacToe board" should "return Nought as the winner" in {
    val row1 = new TicTacToeLine(List(Nought, Cross, Empty))
    val row2 = new TicTacToeLine(List(Empty, Nought, Empty))
    val row3 = new TicTacToeLine(List(Empty, Cross, Nought))
    val board = new TicTacToeBoard(new TicTacToeMatrix(List(row1, row2, row3)))
    assert(Nought === board.whoWins)
  }

  "A Cross column winning TicTacToe board" should "return Cross as the winner" in {
    val row1 = new TicTacToeLine(List(Nought, Cross, Nought))
    val row2 = new TicTacToeLine(List(Empty, Cross, Empty))
    val row3 = new TicTacToeLine(List(Empty, Cross, Nought))
    val board = new TicTacToeBoard(new TicTacToeMatrix(List(row1, row2, row3)))
    assert(Cross === board.whoWins)
  }

  "A Cross row winning TicTacToe board" should "return Cross as the winner" in {
    val row1 = new TicTacToeLine(List(Cross, Cross, Cross))
    val row2 = new TicTacToeLine(List(Empty, Nought, Empty))
    val row3 = new TicTacToeLine(List(Empty, Nought, Nought))
    val board = new TicTacToeBoard(new TicTacToeMatrix(List(row1, row2, row3)))
    assert(Cross === board.whoWins)
  }

  "A Nought right diagonal winning TicTacToe board" should "return Nought as the winner" in {
    val row1 = new TicTacToeLine(List(Cross, Cross, Nought))
    val row2 = new TicTacToeLine(List(Empty, Nought, Empty))
    val row3 = new TicTacToeLine(List(Nought, Cross, Nought))
    val board = new TicTacToeBoard(new TicTacToeMatrix(List(row1, row2, row3)))
    assert(Nought === board.whoWins)
  }

  "A Cross 4x4 column winning TicTacToe board" should "return Cross as the winner" in {
    val row1 = new TicTacToeLine(List(Nought, Cross, Nought, Empty))
    val row2 = new TicTacToeLine(List(Empty, Cross, Nought, Empty))
    val row3 = new TicTacToeLine(List(Empty, Cross, Nought, Cross))
    val row4 = new TicTacToeLine(List(Nought, Cross, Empty, Nought))
    val board = new TicTacToeBoard(new TicTacToeMatrix(List(row1, row2, row3, row4)))
    assert(Cross === board.whoWins)
  }
  "A Nought 4x4 left diagonal winning TicTacToe board" should "return Nought as the winner" in {
    val row1 = new TicTacToeLine(List(Nought, Cross, Nought, Empty))
    val row2 = new TicTacToeLine(List(Empty, Nought, Empty, Empty))
    val row3 = new TicTacToeLine(List(Empty, Cross, Nought, Cross))
    val row4 = new TicTacToeLine(List(Nought, Cross, Empty, Nought))
    val board = new TicTacToeBoard(new TicTacToeMatrix(List(row1, row2, row3, row4)))
    assert(Nought === board.whoWins)
  }
}
