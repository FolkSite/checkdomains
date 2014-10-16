<?

$words = array(
  array('shop', 'market', 'goods', 'store'),
  array('buy', 'my', 'tv', 'ru', 'site', 'internet', 'online'),
  array('children', 'baby', 'cheap')
);

require(__DIR__.'/lib/Combinatorics.php');


$combinatorics = new Math_Combinatorics;
$permutations = $combinatorics->permutations(array(0, 1, 2), 3);

foreach($permutations as $p) {

  $wordsPerm = array();
  foreach($p as $pKey) {
    $wordsPerm[] = $words[$pKey];
  }
  
  foreach($wordsPerm[0] as $word1) 
    foreach($wordsPerm[1] as $word2)
      foreach($wordsPerm[2] as $word3) {
        $word = $word1.$word2.$word3;
        echo $word.PHP_EOL;
      }
  
}

