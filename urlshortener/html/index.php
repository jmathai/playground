<?php
try
{
  $config = parse_ini_file('../secret/mysql');
  $dbh = new PDO("mysql:host={$config['host']};dbname={$config['name']}", $config['user'], $config['pass']);
  $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
  $key = addslashes(substr($_GET['__key__'], 1));
  $stmt = $dbh->query("SELECT ur_id, ur_url FROM url_redirect WHERE ur_key='{$key}'");

  $redirect = $stmt->fetch();

  if(!$redirect)
  {
    throw new Exception("Did not find redirect key {$_SERVER['REQUEST_URI']} in database");
  }

  $ip = addslashes($_SERVER['REMOTE_ADDR']);
  $agent = addslashes($_SERVER['HTTP_USER_AGENT']);
  $time  = time();
  $res = $dbh->exec($sql = "INSERT INTO url_redirect_log(url_ur_id, url_ip, url_userAgent, url_dateCreated) VALUES({$redirect['ur_id']}, '{$ip}', '{$agent}', {$time})");
  if(!$res)
  {
    error_log("Failure inserting into url_redirect_log ({$sql})");
  }
  
  header('HTTP/1.1 301 Moved Permanently');
  header("Location: {$redirect['ur_url']}");
}
catch(Exception $e)
{
  error_log('Exception at ' . $_SERVER['REQUEST_URI'] . ' (' . $e->getMessage() . ')');
  header('HTTP/1.1 404 Not Found');
  echo 'Document not found';
}
?>
