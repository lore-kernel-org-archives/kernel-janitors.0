From: Vicente Feito <vicente.feito@gmail.com>
Date: Tue, 22 Mar 2005 11:25:28 +0000
Subject: [KJ][PATCH] kj-devel.pl - diff -u
Message-Id: <200503221125.28549.vicente.feito@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_oCAQC8Mwyi4qsbH"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_oCAQC8Mwyi4qsbH
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

here's the diff -u patch

Vicente.


--Boundary-00=_oCAQC8Mwyi4qsbH
Content-Type: text/x-diff;
  charset="us-ascii";
  name="kj-devel.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="kj-devel.patch"

--- ../kj-devel.pl.orig	2005-03-22 00:05:01.000000000 +0000
+++ kj-devel.pl	2005-03-22 09:21:41.000000000 +0000
@@ -253,8 +253,8 @@
 				
 				if (not exists($locks{$2}) or 
 					(exists($locks{$2}) and @{$locks{$2}} == 0)) {
-					print "Unlocking a lock that hasn't been aquired ".
-						"yet(could be a false positive) - Line:$linenr\n\n";
+					print "Unlocking a lock that hasn't been acquired ".
+						"yet (could be a false positive) - Line:$linenr\n\n";
 				} else {
 					#get rid of the last one
 					pop @{$locks{$2}};
@@ -269,8 +269,8 @@
 
 				if (not exists($locks_irq{$2}) or 
 					(exists($locks_irq{$2}) and @{$locks_irq{$2}} == 0)) {
-					print "Unlocking a lock that hasn't been aquired ".
-						"yet(could be a false positive) - Line:$linenr\n\n";
+					print "Unlocking a lock that hasn't been acquired ".
+						"yet (could be a false positive) - Line:$linenr\n\n";
 				} else {
 					pop @{$locks_irq{$2}};
 				}
@@ -284,8 +284,8 @@
 
 				if (not exists($locks_bh{$2}) or 
 					(exists($locks_bh{$2}) and @{$locks_bh{$2}} == 0)) {
-					print "Unlocking a lock that hasn't been aquired ".
-						"yet(could be a false positive) - Line:$linenr\n\n";
+					print "Unlocking a lock that hasn't been acquired ".
+						"yet (could be a false positive) - Line:$linenr\n\n";
 				} else {
 					pop @{$locks_bh{$2}};
 				}
@@ -299,7 +299,7 @@
 				if (not exists($ioremap{$2}) or 
 					(exists($ioremap{$2}) and @{$ioremap{$2}} == 0)) {
 					print "Unmapping a region that hasn't been mapped ".
-						"yet(could be a false positive) - Line:$linenr\n\n";
+						"yet (could be a false positive) - Line:$linenr\n\n";
 				} else {
 					pop @{$ioremap{$2}};
 				}
@@ -344,7 +344,11 @@
 				print "$filename:$linenr:$line\n\n";
 			}
 			if ($line=~/(const )?char ?\* ?\w+ ?= ?\".*\"/) {
-				print "Using foo[] it's recommended over *foo: saves memory references & code\n";
+				print "Using foo[] is recommended over *foo: saves memory references & code\n";
+				print "$filename:$linenr:$line\n\n";
+			}
+			if ($line=~/memset\((.*),( *sizeof.*),( *\d+)\)/) {
+				print "Your memset parameters appears to be backwards\n";
 				print "$filename:$linenr:$line\n\n";
 			}
 			$linenr++;
@@ -356,7 +360,7 @@
 		show_balance_results(1,%ioremap);
 	
 		if (!$nomodules and !defined($module)) {
-			print "If you're building a module, be concious that you must use the". 
+			print "If you're building a module, note that you must use the". 
 				" init mechanism, module_init() and module_exit().\n";
 		}
 		if (!$nomodules and $drvdata) {

--Boundary-00=_oCAQC8Mwyi4qsbH
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_oCAQC8Mwyi4qsbH--
