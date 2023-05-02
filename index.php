<?php
	$host = "172.20.0.2";
	$uname = "root";
	$password = "root";
	$database = "redlock";

	$connect = mysqli_connect($host, $uname, $password, $database);

	if (!$connect){
		echo "Connection Failed!";
		die();
}

$query = mysqli_query($connect, "SELECT * FROM users");

while ($row = mysqli_fetch_array($query)) {
	echo "ID: " , $row['ID'] , "nama: " , $row['nama'] , "alamat: " , $row['alamat'] , "jabatan: " , $row['jabatan'] . "<br>";
}

?>
