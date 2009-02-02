<?php 
  error_reporting(0);
	set_time_limit(120);
  include("ged2csv_variables.php");

  // VARIABLES
  $error01 = "Database, Username, or Password problem";
  $error02 = "No action specified";

  // START MAIN SCRIPT 
  if ((isset($HTTP_POST_VARS["action"])) || (isset($HTTP_GET_VARS["action"])))  {
		
		// TEST CONNECTION
		if ($HTTP_GET_VARS["action"] == "test") { 
  	  if (!mysql_connect("localhost", $username, $password)) {  print $error01; }
  	  else { 
  	    if (!mysql_select_db($database)) { print $error01; }
  	    else { print "Connected"; }
  	  }
		}
		
		// CREATE CITATION TABLE
		elseif (($HTTP_POST_VARS["action"] == "create_table_citation") && (isset($HTTP_POST_VARS["table"]))) {
			db_connect($database, $username, $password);
			$table = $HTTP_POST_VARS["table"];
			$query = "DROP TABLE IF EXISTS $table;";
			mysql_query($query);
			$query = "CREATE TABLE $table (factkey varchar(6) NOT NULL default '0', srckey varchar(6) default NULL, source text, KEY factkey (factkey)) TYPE=MyISAM;";
			$result = mysql_query($query);
			echo $result;
		}
		
		// INSERT CITATION
		elseif (($HTTP_POST_VARS["action"] == "insert_citation") && (isset($HTTP_POST_VARS["table"]))) {
			db_connect($database, $username, $password);
			$table = $HTTP_POST_VARS["table"];
			$factkey = addslashes($HTTP_POST_VARS["factkey"]);
			$srckey = addslashes($HTTP_POST_VARS["srckey"]);
			$source = addslashes($HTTP_POST_VARS["source"]);
			$query = "INSERT INTO $table VALUES ('$factkey', '$srckey', '$source');";
			$result = mysql_query($query);
			echo mysql_affected_rows();
		}

		// CREATE FACTS TABLE
		elseif (($HTTP_POST_VARS["action"] == "create_table_fact") && (isset($HTTP_POST_VARS["table"]))) {
			db_connect($database, $username, $password);
			$table = $HTTP_POST_VARS["table"];
			$query = "DROP TABLE IF EXISTS $table;";
			mysql_query($query);
			$query = "CREATE TABLE $table (indfamkey varchar(20) NOT NULL default '', type varchar(255) NOT NULL default '', date tinytext NOT NULL, place tinytext NOT NULL, factkey varchar(20) NOT NULL default '', KEY indfamkey (indfamkey), KEY type (type)) TYPE=MyISAM;";
			$result = mysql_query($query);
			echo $result;
		}
		
		// INSERT FACT
		elseif (($HTTP_POST_VARS["action"] == "insert_fact") && (isset($HTTP_POST_VARS["table"]))) {
			db_connect($database, $username, $password);
			$table = $HTTP_POST_VARS["table"];
			$indfamkey = addslashes($HTTP_POST_VARS["indfamkey"]);
			$type = addslashes($HTTP_POST_VARS["type"]);
			$date = addslashes($HTTP_POST_VARS["date"]);
			$place = addslashes($HTTP_POST_VARS["place"]);
			$factkey = addslashes($HTTP_POST_VARS["factkey"]);
			$query = "INSERT INTO $table VALUES ('$indfamkey', '$type', '$date', '$place', '$factkey');";
			$result = mysql_query($query);
			echo mysql_affected_rows();
		}
		
		// CREATE FAMILY TABLE
		elseif (($HTTP_POST_VARS["action"] == "create_table_family") && (isset($HTTP_POST_VARS["table"]))) {
			db_connect($database, $username, $password);
			$table = $HTTP_POST_VARS["table"];
			$query = "DROP TABLE IF EXISTS $table;";
			mysql_query($query);
			$query = "CREATE TABLE $table (famkey varchar(6) NOT NULL default '', spouse1 varchar(6) NOT NULL default '', spouse2 varchar(6) NOT NULL default '', beginstatus tinytext NOT NULL, endstatus tinytext NOT NULL, notekey varchar(6) NOT NULL default '', PRIMARY KEY (famkey), KEY spouse1 (spouse1), KEY spouse2 (spouse2)) TYPE=MyISAM;";
			$result = mysql_query($query);
			echo $result;
		}
		
		// INSERT FAMILY
		elseif (($HTTP_POST_VARS["action"] == "insert_family") && (isset($HTTP_POST_VARS["table"]))) {
			db_connect($database, $username, $password);
			$table = $HTTP_POST_VARS["table"];
			$famkey = addslashes($HTTP_POST_VARS["famkey"]);
			$spouse1 = addslashes($HTTP_POST_VARS["spouse1"]);
			$spouse2 = addslashes($HTTP_POST_VARS["spouse2"]);
			$beginstatus = addslashes($HTTP_POST_VARS["beginstatus"]);
			$endstatus = addslashes($HTTP_POST_VARS["endstatus"]);
			$notekey = addslashes($HTTP_POST_VARS["notekey"]);
			$query = "INSERT INTO $table VALUES ('$famkey', '$spouse1', '$spouse2', '$beginstatus', '$endstatus', '$notekey');";
			$result = mysql_query($query);
			echo mysql_affected_rows();
		}
		
		// CREATE INDIV TABLE
		elseif (($HTTP_POST_VARS["action"] == "create_table_indiv") && (isset($HTTP_POST_VARS["table"]))) {
			db_connect($database, $username, $password);
			$table = $HTTP_POST_VARS["table"];
			$query = "DROP TABLE IF EXISTS $table;";
			mysql_query($query);
			$query = "CREATE TABLE $table (indkey varchar(6) NOT NULL default '', title tinytext NOT NULL, surname varchar(255) NOT NULL default '', givenname varchar(255) NOT NULL default '', aka tinytext NOT NULL, sex char(1) NOT NULL default '', notekey varchar(6) NOT NULL default '', PRIMARY KEY (indkey), KEY surname (surname), KEY givenname (givenname), KEY sex (sex)) TYPE=MyISAM;";
			$result = mysql_query($query);
			echo $result;
		}
		
		// INSERT INDIV
		elseif (($HTTP_POST_VARS["action"] == "insert_indiv") && (isset($HTTP_POST_VARS["table"]))) {
			db_connect($database, $username, $password);
			$table = $HTTP_POST_VARS["table"];
			$indkey = addslashes($HTTP_POST_VARS["indkey"]);
			$title = addslashes($HTTP_POST_VARS["title"]);
			$surname = addslashes($HTTP_POST_VARS["surname"]);
			$givenname = addslashes($HTTP_POST_VARS["givenname"]);
			$aka = addslashes($HTTP_POST_VARS["aka"]);
			$sex = addslashes($HTTP_POST_VARS["sex"]);
			$notekey = addslashes($HTTP_POST_VARS["notekey"]);
			$query = "INSERT INTO $table VALUES ('$indkey', '$title', '$surname', '$givenname', '$aka', '$sex', '$notekey');";
			$result = mysql_query($query);
			echo mysql_affected_rows();
		}
		
		// CREATE NOTE TABLE
		elseif (($HTTP_POST_VARS["action"] == "create_table_note") && (isset($HTTP_POST_VARS["table"]))) {
			db_connect($database, $username, $password);
			$table = $HTTP_POST_VARS["table"];
			$query = "DROP TABLE IF EXISTS $table;";
			mysql_query($query);
			$query = "CREATE TABLE $table (notekey varchar(7) NOT NULL default '', text text NOT NULL, PRIMARY KEY (notekey)) TYPE=MyISAM;";
			$result = mysql_query($query);
			echo $result;
		}
		
		// INSERT NOTE
		elseif (($HTTP_POST_VARS["action"] == "insert_note") && (isset($HTTP_POST_VARS["table"]))) {
			db_connect($database, $username, $password);
			$table = $HTTP_POST_VARS["table"];
			$notekey = addslashes($HTTP_POST_VARS["notekey"]);
			$text = addslashes($HTTP_POST_VARS["text"]);
			$query = "INSERT INTO $table VALUES ('$notekey', '$text');";
			$result = mysql_query($query);
			echo mysql_affected_rows();
		}
		
		// CREATE RELATION TABLE
		elseif (($HTTP_POST_VARS["action"] == "create_table_relation") && (isset($HTTP_POST_VARS["table"]))) {
			db_connect($database, $username, $password);
			$table = $HTTP_POST_VARS["table"];
			$query = "DROP TABLE IF EXISTS $table;";
			mysql_query($query);
			$query = "CREATE TABLE $table (indkey varchar(6) NOT NULL default '', famkey varchar(6) NOT NULL default '', KEY indkey (indkey), KEY famkey (famkey)) TYPE=MyISAM;";
			$result = mysql_query($query);
			echo $result;
		}
		
		// INSERT RELATION
		elseif (($HTTP_POST_VARS["action"] == "insert_relation") && (isset($HTTP_POST_VARS["table"]))) {
			db_connect($database, $username, $password);
			$table = $HTTP_POST_VARS["table"];
			$indkey = addslashes($HTTP_POST_VARS["indkey"]);
			$famkey = addslashes($HTTP_POST_VARS["famkey"]);
			$query = "INSERT INTO $table VALUES ('$indkey', '$famkey');";
			$result = mysql_query($query);
			echo mysql_affected_rows();
		}
		
		// CREATE SOURCE TABLE
		elseif (($HTTP_POST_VARS["action"] == "create_table_source") && (isset($HTTP_POST_VARS["table"]))) {
			db_connect($database, $username, $password);
			$table = $HTTP_POST_VARS["table"];
			$query = "DROP TABLE IF EXISTS $table;";
			mysql_query($query);
			$query = "CREATE TABLE $table (srckey varchar(6) NOT NULL default '', text text NOT NULL, notekey varchar(7) default NULL, PRIMARY KEY (srckey)) TYPE=MyISAM;";
			$result = mysql_query($query);
			echo $result;
		}
		
		// INSERT SOURCE
		elseif (($HTTP_POST_VARS["action"] == "insert_source") && (isset($HTTP_POST_VARS["table"]))) {
			db_connect($database, $username, $password);
			$table = $HTTP_POST_VARS["table"];
			$srckey = addslashes($HTTP_POST_VARS["srckey"]);
			$text = addslashes($HTTP_POST_VARS["text"]);
			$notekey = addslashes($HTTP_POST_VARS["notekey"]);
			$query = "INSERT INTO $table VALUES ('$srckey', '$text', '$notekey');";
			$result = mysql_query($query);
			echo mysql_affected_rows();
		}
		
		// CREATE CHILD TABLE
		elseif (($HTTP_POST_VARS["action"] == "create_table_child") && (isset($HTTP_POST_VARS["table"]))) {
			db_connect($database, $username, $password);
			$table = $HTTP_POST_VARS["table"];
			$query = "DROP TABLE IF EXISTS $table;";
			mysql_query($query);
			$query = "CREATE TABLE $table (famkey varchar(6) NOT NULL default '', indkey varchar(6) NOT NULL default '', KEY famkey (famkey)) TYPE=MyISAM;";
 			$result = mysql_query($query);
			echo $result;
		}
		
		// INSERT CHILD
		elseif (($HTTP_POST_VARS["action"] == "insert_child") && (isset($HTTP_POST_VARS["table"]))) {
			db_connect($database, $username, $password);
			$table = $HTTP_POST_VARS["table"];
			$famkey = addslashes($HTTP_POST_VARS["famkey"]);
			$indkey = addslashes($HTTP_POST_VARS["indkey"]);
			$query = "INSERT INTO $table VALUES ('$famkey', '$indkey');";
			$result = mysql_query($query);
			echo mysql_affected_rows();
		}

	}
	else { print $error02; }
	// END MAIN SCRIPT
	
  //FUNCTIONS
  function test_db_connect($database, $username, $password) {
    global $Error01;
    if (!mysql_connect("localhost", $username, $password)) {  print $Error01; }
    else { 

      if (!mysql_select_db($database)) { print $Error01; }
      else { print "Connected"; }
    }
  }

	
	function db_connect($database, $username, $password) {
		mysql_connect("localhost", $username, $password);
		mysql_select_db($database);
  }
  
  function insert_facts($table, $indfamkey, $date, $place, $factkey) {
  	$query = "INSERT into $table (indfamkey, date, place, factkey) values(\"$indfamkey\", \"$date\", \"$place\", \"$factkey\")";
		mysql_query($query);
		echo mysql_affected_rows();
  }
?>
