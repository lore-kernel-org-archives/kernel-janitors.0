From: Kristen Carlson <kristenc@cs.pdx.edu>
Date: Mon, 12 Jul 2004 21:14:32 +0000
Subject: [Kernel-janitors] [PATCH] remove check_region from eepro.c
Message-Id: <200407122114.i6CLEW2q007241@sirius.cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95354619167667232=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200407072024.i67KOdQM017410@sirius.cs.pdx.edu>
In-Reply-To: <200407072024.i67KOdQM017410@sirius.cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============95354619167667232==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Description: remove check_region from eepro.c 
(note that PnPWakeup must be defined to have this code compile)

Signed-off-by: Kristen Carlson Accardi <kristenc@cs.pdx.edu>


--- linux-2.6.7-kc/drivers/net/eepro.orig	2004-07-12 10:42:08.000000000 +0000
+++ linux-2.6.7-kc/drivers/net/eepro.c	2004-07-12 10:29:46.000000000 +0000
@@ -545,9 +545,9 @@ static int __init do_eepro_probe(struct 
 
 	{
 		unsigned short int WS[32]=WakeupSeq;
-
-		if (check_region(WakeupPort, 2)==0) {
-
+		if (!request_region(WakeupPort, 2, dev->name))
+			printk(KERN_WARNING "PnPWakeup Port not available");
+		else { 
 			if (net_debug>5)
 				printk(KERN_DEBUG "Waking UP\n");
 
@@ -557,7 +557,8 @@ static int __init do_eepro_probe(struct 
 				outb_p(WS[i],WakeupPort);
 				if (net_debug>5) printk(KERN_DEBUG ": %#x ",WS[i]);
 			}
-		} else printk(KERN_WARNING "Checkregion Failed!\n");
+			release_region(WakeupPort, 2);
+		}
 	}
 #endif
 

--===============95354619167667232==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95354619167667232==--
