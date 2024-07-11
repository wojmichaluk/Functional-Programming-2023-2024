--task 1
firstDivSec (x : y : _) | y `mod` x == 0 = True
firstDivSec _ = False

--task 2
firstDivThird (x : y : z : _) | z `mod` x == 0 = True
firstDivThird _ = False