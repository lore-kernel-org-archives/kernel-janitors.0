From: Matthew Wilcox <willy@debian.org>
Date: Mon, 12 Jul 2004 22:04:38 +0000
Subject: [Kernel-janitors] eepro attempts to do its own PNP handling
Message-Id: <20040712220438.GO32326@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42884662693968223=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============42884662693968223==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Adam, how should this be handled?  Can we just rip this code out?

----- Forwarded message from Kristen Carlson <kristenc@cs.pdx.edu> -----

From: Kristen Carlson <kristenc@cs.pdx.edu>
To: kernel-janitors@lists.osdl.org
Date: Mon, 12 Jul 2004 14:14:32 -0700 (PDT)
X-Mailer: ELM [version 2.5 PL5]
X-Virus-Scanned: by amavisd-new
X-Spam-Status: No, hits=0 required=5 tests=
X-Spam-Checker-Version: SpamAssassin 2.63-osdl_revision__1.18__
X-MIMEDefang-Filter: osdl$Revision: 1.70 $
X-Scanned-By: MIMEDefang 2.36
Subject: [Kernel-janitors] [PATCH] remove check_region from eepro.c
X-BeenThere: kernel-janitors@lists.osdl.org
X-Mailman-Version: 2.1.2
Precedence: list
List-Id: Kernel janitors discussions and patches
	<kernel-janitors.lists.osdl.org>
List-Unsubscribe: <http://lists.osdl.org/mailman/listinfo/kernel-janitors>,
	<mailto:kernel-janitors-request@lists.osdl.org?subject=unsubscribe>
List-Archive: <http://lists.osdl.org/pipermail/kernel-janitors>
List-Post: <mailto:kernel-janitors@lists.osdl.org>
List-Help: <mailto:kernel-janitors-request@lists.osdl.org?subject=help>
List-Subscribe: <http://lists.osdl.org/mailman/listinfo/kernel-janitors>,
	<mailto:kernel-janitors-request@lists.osdl.org?subject=subscribe>
Errors-To: kernel-janitors-bounces@lists.osdl.org
X-Spam-Score: 0.0 (/)

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
 

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors


----- End forwarded message -----

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============42884662693968223==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42884662693968223==--
