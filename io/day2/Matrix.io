/**metadoc copyright Susan Potter <me@susanpotter.net>, 2011 */
/**metadoc license Creative Commons BY-NC-SA */
/**metadoc category 7languages7weeks */
/**metadoc description Create Matrix object that provides */

Matrix := Object clone do(
  init = method(
    proto init()
    // create slot and setter in init so only clones of Matrix 
    // can invoke setRows
    rows ::= list()

    // simulate "instance" methods on new clones of Matrix

    // sum() method on Matrix clones
    self sum := method(
      acc := 0
      rows foreach(r,
        r foreach(elem,
          acc = acc + elem
        )
      )
      acc
    )

    // dimx() returns x-dimension of matrix
    self dimx := method(
      rows first size
    )

    // dimy() returns y-dimension of matrix
    self dimy := method(
      rows size
    )

    // set(x, y, val) on Matrix clones
    self set := method(x, y, val,
      currentRow := rows at(y-1)
      currentRow atPut(x-1, val)
    )

    // get(x, y) on Matrix clones
    self get := method(x, y, 
      (rows at(y-1)) at(x-1)
    )

    self transpose := method(
      transMatrix := self clone
      transMatrix println
      x := self dimx()
      y := self dimy()
      while(y > 0,
        while(x > 0,
          ("(" .. x .. ", " .. y .. ")") println
          transMatrix set(x-1, y-1, self get(y-1, x-1))
          x = x - 1
        )
        y = y - 1
      )
      transMatrix
    )
  )

  // psuedo "class" methods - I know this is totally wrong way to think of it,
  // helping me thing through modeling the Objects
  build := method(rows,
    Matrix clone setRows(rows)
  )

  zero := method(n,
    Matrix dim(n, n)
  )

  identity := method(n,
    idMatrix := Matrix zero(n)
    while(n > 0,
      idMatrix set(n, n, 1)
      n = n - 1
    ) 
    idMatrix
  )

  dim := method(x, y,
    i := list()
    x repeat(i append(0))
    zeroRow := i
    j := list()
    Matrix clone setRows(y repeat(j append(i clone)))
  )

  print := method(
    self printHeader()
    rows foreach(r, r print)
  )

  println := method(
    self printHeader()
    rows foreach(r, r println)
  )

  printHeader := method(
    self rows first size println
    self rows size println
    ("Matrix " .. self rows first size .. " x " .. self rows size) println
  )
)

m := Matrix clone setRows(list(list(1, 0), list(0, 1)))
m sum println
m = Matrix clone setRows(list(
  list(3, 4, 2, 7),
  list(2, 0, 6, 4),
  list(1, 1, 5, 2),
  list(6, 4, 17, 0)
))
m sum println
m = Matrix dim(9, 4)
m println
Matrix zero(5) println
m identity(4) println
m identity(7) transpose println
