<?php
  // don't use globals, put these in a class
  $range = array_merge(range('a','z'), range('A','Z'), range(0,9));
  $trans = array_flip($range);

  function getLastKey()
  {
    // fetch last key and return
    return 'a';
  }

  function getNextKey($key = null, $tail = '')
  {
    global $range, $trans; // bad
    if($key === null)
      $key = getLastKey();
    if(empty($key))
      return "a{$tail}";

    $keylen = strlen($key);
    $lastChar = $key[$keylen-1];

    if($lastChar != '9')
      return substr($key, 0, ($keylen-1)) . $range[$trans[$lastChar]+1] . $tail; 
    else
      return getNextKey(substr($key, 0, -1), "a{$tail}");
  }
