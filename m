From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 20:43:32 +0000
Subject: [Kernel-janitors] [PATCH] net/ibmtr: replace schedule_timeout()
Message-Id: <20040727204332.GA3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1382370995312816=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============1382370995312816==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to guarantee
the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/tokenring/ibmtr.c	2004-06-16 05:19:37.000000000 +0000
+++ linux-dev/drivers/net/tokenring/ibmtr.c	2004-07-21 17:27:52.000000000 +0000
@@ -108,7 +108,8 @@ in the event that chatty debug messages 
 #define IBMTR_DEBUG_MESSAGES 0
 
 #include <linux/module.h>
-
+#include <linux/delay.h>
+ 
 #ifdef PCMCIA		/* required for ibmtr_cs.c to build */
 #undef MODULE		/* yes, really */
 #undef ENABLE_PAGING
@@ -857,8 +858,7 @@ static int tok_init_card(struct net_devi
 	writeb(~INT_ENABLE, ti->mmio + ACA_OFFSET + ACA_RESET + ISRP_EVEN);
 	outb(0, PIOaddr + ADAPTRESET);
 
-	current->state=TASK_UNINTERRUPTIBLE;
-	schedule_timeout(TR_RST_TIME); /* wait 50ms */
+	msleep(jiffies_to_msecs(TR_RST_TIME));
 
 	outb(0, PIOaddr + ADAPTRESETREL);
 #ifdef ENABLE_PAGING

--===============1382370995312816==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1382370995312816==--
