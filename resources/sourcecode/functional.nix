{
  greetings = builtins.foldl'
    (carry: char: carry + char)
    ""
    [ "H" "e" "l" "l" "o" " " "W" "o" "r" "l" "d" "!" ];
}
