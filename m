From: Don Koch <aardvark@krl.com>
Date: Thu, 08 Apr 2004 21:03:06 +0000
Subject: [Kernel-janitors] (no subject)
Message-Id: <200404082103.i38L36wH004209@p-chan.krl.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23301754595903201=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040311044154.9A05E1D71A2@ws3-3.us4.outblaze.com>
In-Reply-To: <20040311044154.9A05E1D71A2@ws3-3.us4.outblaze.com>
To: kernel-janitors@vger.kernel.org

--===============23301754595903201==
Content-Type: text/plain; charset=us-ascii

There's an instance in kj.pl (and kj-devel.pl) of a missing
argument to a call to check_pci_enable_device().  Patch follows.

-- 
Don Koch
http://www.krl.com/

--- kj.pl~	2004-04-08 15:41:08.000000000 -0400
+++ kj.pl	2004-04-08 16:48:13.000000000 -0400
@@ -149,7 +149,7 @@
 
 		if ($line=~/pdev-\>resource/) {
 			print "Make sure pci_enable_device --before-- reading resource\n";
-			check_pci_enable_device($linenr);
+			check_pci_enable_device($linenr, $filename);
 			print "$filename:$linenr:$line\n\n";
 		}
 
--- kj-devel.pl~	2004-04-08 15:41:17.000000000 -0400
+++ kj-devel.pl	2004-04-08 16:48:56.000000000 -0400
@@ -146,7 +146,7 @@
 
 		if ($line=~/pdev-\>resource/) {
 			print "Make sure pci_enable_device --before-- reading resource\n";
-			check_pci_enable_device($linenr);
+			check_pci_enable_device($linenr, $filename);
 			print "$filename:$linenr:$line\n\n";
 		}
 



--===============23301754595903201==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23301754595903201==--
