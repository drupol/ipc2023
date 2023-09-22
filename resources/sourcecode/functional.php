<?php
return [
  'greetings' => array_reduce(
    ['H','e','l','l','o',' ','W','o','r','l','d','!'],
    fn (string $carry, string $char): string => $carry . $char,
    ''
  ),
];
