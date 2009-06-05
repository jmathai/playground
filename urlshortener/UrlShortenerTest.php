<?php
include 'functions.php';
include 'PHPUnit/Framework.php';
class UrlShortenerTest extends PHPUnit_Framework_TestCase
{
  function testKeyGenerator()
  {
    $this->assertEquals('b', getNextKey('a'), 'String after a is not "b"');
    $this->assertEquals('aa', getNextKey('9'), 'Key after 9 is not "aa"');
    $this->assertEquals('ijeue', getNextKey('ijeud'), 'Key after ijeud is not "ijeue"');
    $this->assertEquals('12346', getNextKey('12345'), 'Key after 12345 is not "12346"');
    $this->assertEquals('7dhfgbcvdfgftdyhg', getNextKey('7dhfgbcvdfgftdyhf'), 'Key after 7dhfgbcvdfgftdyhg is not "7dhfgbcvdfgftdyhg"');
  }
}
