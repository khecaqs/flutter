<?php

$ldaphost = "192.168.20.202";
$ldapUsername  = "cn=SysAdmin,o=DSA,dc=umt,dc=edu,dc=my";
$ldapPassword = "M3ng484ngT3l1p0t";


$baseDn = "ou=People,dc=umt,dc=edu,dc=my";
#echo "Siniiiii";
#exit;		
$pid = $_POST["uid"]; // get these values explicitly from the POST
$credential = $_POST["pwd"];

//echo "sini";exit;

/*ldap will bind anonymously, make sure we have some credentials*/

//if ((strtolower(substr($pid,0,2))!='uk') && (strtolower(substr($pid,0,2))!='gs')) {
//if (strtolower(substr($pid,0,2))!='uk') {
if (isset($pid) && $pid != '' && isset($credential)) {
/*	$ldap = ldap_connect($host);
	ldap_set_option($ldap, LDAP_OPT_PROTOCOL_VERSION, 3);
*/

	$ldap = ldap_connect($ldaphost);
	if(!ldap_set_option($ldap, LDAP_OPT_PROTOCOL_VERSION, 3)){
		print "Could not set LDAPv3\r\n";
	}
	else 
	{
		$r = ldap_bind($ldap, $ldapUsername, $ldapPassword) or die("\r\nCould not connect to LDAP server\r\n");
	}

	//ldap_start_tls($ldap);

	if (isset($ldap) && $ldap != '') {

	/* search for pid dn */

		//$result = @ldap_search($ldap, $baseDn, 'uid='.$pid);
		$result=ldap_search($ldap, "dc=umt,dc=edu,dc=my",'uid='.$pid); 

		if ($result != 0) {
			$entries = ldap_get_entries($ldap, $result);
			$principal = $entries[0]['dn'];
			 $oudata = explode(",",$principal);
			 $ou = explode("=",$oudata[1]);
			 //echo $ou[1] . ""; exit;
			//$nokp = trim($entries[0]["employeenumber"][0]);umticnumber
			$nokp =$entries[0]["umticnumber"][0];

			if (isset($principal)) 
			{

			/* bind as this user */
 
				if (@ldap_bind($ldap, $principal, $credential)) {
					//$_SESSION['icno']=trim($nokp);
					//$Identity=elnpt::Ekstrak_Email($conn,$pid);
					//$Identity=elnpt::Verified_Email($conn,$pid);
					//list($nokp,$email)=$Identity;
					//$profile=elnpt::Create_User_Profile($conn,$nokp);
					
					if ($ou[1] == 'Staff')
					{
						//echo "sini" .$ou[1] . "";
						//exit;
						
						if (substr($nokp,12,1)=='A')
						{
						$nokp = substr($nokp,0,12);
						
						$_SESSION["log_is_pengarah"]="TRUE";
												
						}
						
						$profile=portal::Create_User_Profile($conn,$nokp);

					//echo "Loading Time is :".(microtime());
					
					echo "<meta http-equiv=refresh content='0; url=index.php?'>";
												
					}
					else if ($ou[1] == 'Undergraduates')
					{
						//echo "sini" .$ou[1] . ""; 
						//exit;
						
						///echo "sini pid" .$pid;exit;
						///$_SESSION['USERPWD1']=$credential;	
																
						 $Curl_Session = curl_init('http://pelajar.mynemo.umt.edu.my/portal_login_ldap_centre.php');
						 curl_setopt ($Curl_Session, CURLOPT_POST, 0);
						 curl_setopt ($Curl_Session, CURLOPT_POSTFIELDS, "uid=$pid&pwd=$credential");
						 //curl_setopt ($Curl_Session, CURLOPT_FOLLOWLOCATION, 1);
						 curl_setopt ($Curl_Session, CURLOPT_HEADER, 0);
						 curl_setopt ($Curl_Session, CURLOPT_RETURNTRANSFER, true );
						 $sessionId = curl_exec ($Curl_Session);
						 curl_close ($Curl_Session);	
						 //echo $sessionId;exit;
						 header("Location:  http://pelajar.mynemo.umt.edu.my/index_centre.php?uid=".$pid."&session_id=".$sessionId);
						///liecha17
						exit();
											
					}
					else if ($ou[1] == 'Graduates')
					{
						//echo "sini" .$ou[1] . ""; 
						//exit;
						 $Curl_Session = curl_init('http://mynemo-stag.umt/portal_login_pel_gs_centre.php');
						 curl_setopt ($Curl_Session, CURLOPT_POST, 1);
						 curl_setopt ($Curl_Session, CURLOPT_POSTFIELDS, "uid=$pid&pwd=$credential");
						 curl_setopt ($Curl_Session, CURLOPT_FOLLOWLOCATION, 1);
						 curl_setopt ($Curl_Session, CURLOPT_HEADER, 0);
						 curl_exec ($Curl_Session);
						 curl_close ($Curl_Session);	
						 echo "sini" .$ou[1] . ""; 
						exit;
												
					}
					
		
					//header("Location: index.php?");
				} else {
				//	print('Authenticate failure');
					//$msg=portal::message("warning","index.php?","ID dan KATALALUAN anda tidak sah. Sila masukkan ID dan KATALALUAN yang betul.","PERHATIAN!");
							echo "ID dan KATALALUAN anda tidak sah. Sila masukkan ID dan KATALALUAN yang betul.";
			exit;

				
				}
			} else {
				//print('User not found in LDAP');
				$msg=portal::message("warning","index.php?","ID anda tidak wujud di dalam LDAP. Sila hubungi pentadbir sistem di talian 4489.","PERHATIAN!");
			}
			
			ldap_free_result($result);

		}	else {
				//print('Error occured searching the LDAP');
				$msg=portal::message("warning","index.php?","Berlaku ralat dalam pencarian pelayan LDAP. Sila hubungi pentadbir sistem di talian 4489.","PERHATIAN!");
			}
		ldap_close($ldap);
	} else {
		//print('Could not connect to LDAP at '.$host);
$msg=portal::message("warning","index.php?","Harap maaf!, cubaan untuk membuat sambungan kepada pelayan LDAP gagal. Sila hubungi pentadbir sistem di talian 4489.","PERHATIAN!");
	}
} else {

//print('Tiada ID');
$msg=portal::message("warning","index.php?","Sila masukkan ID dan KATALALUAN anda..","PERHATIAN !");
}

//echo $pid;
//echo "test a second";
//exit;

//} 

//else {
	//$msg=portal::message("warning","index.php?","Login tidak dibenarkan kerana anda bukan staf UMT!.","PERHATIAN !");
//}

//else {
	//$msg=elnpt::message("warning","index.php?","Login tidak dibenarkan kerana anda bukan staf UMT!.","PERHATIAN !");
//}

//} //tutup besor skali

?>