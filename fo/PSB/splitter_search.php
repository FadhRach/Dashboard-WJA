<?php
require_once('../koneksi.php');
 
function get_splitter($link , $term){ 
 $query = "SELECT * FROM tb_splitter WHERE nama_splitter LIKE '%".$term."%' ORDER BY nama_splitter ASC";
 $result = mysqli_query($link, $query); 
 $data = mysqli_fetch_all($result,MYSQLI_ASSOC);
 return $data; 
}
 
if (isset($_GET['term'])) {
 $getSplitter = get_splitter($link, $_GET['term']);
 $splitterList = array();
 foreach($getSplitter as $Splitter){
 $SplitterList[] = $Splitter['nama_splitter'];
 }
 echo json_encode($SplitterList);
}
?>