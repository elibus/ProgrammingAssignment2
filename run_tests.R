library('RUnit')

source('cachematrix.R')

test.suite <- defineTestSuite("Programming Assignment #2",
                              dirs = file.path("tests"),
                              testFileRegexp = '^\\d+\\.R')

test.result <- runTestSuite(test.suite)

printTextProtocol(test.result)

