From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 23 Sep 2004 17:41:11 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 15/38] net/ibmtr: replace
Message-Id: <20040923174111.GB2154@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83017228999693571=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============83017228999693571==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() / msleep_interruptible() [as appropriate]
instead of schedule_timeout() to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/tokenring/ibmtr.c	2004-09-13 17:15:44.000000000 -0700
+++ 2.6.9-rc2/drivers/net/tokenring/ibmtr.c	2004-09-21 14:25:12.000000000 -0700
@@ -108,6 +108,7 @@ in the event that chatty debug messages 
 #define IBMTR_DEBUG_MESSAGES 0
 
 #include <linux/module.h>
+#include <linux/delay.h>
 
 #ifdef PCMCIA		/* required for ibmtr_cs.c to build */
 #undef MODULE		/* yes, really */
@@ -317,7 +318,7 @@ static void ibmtr_cleanup_card(struct ne
 	if (dev->base_addr) {
 		outb(0,dev->base_addr+ADAPTRESET);
 		
-		schedule_timeout(TR_RST_TIME); /* wait 50ms */
+		msleep(jiffies_to_msecs(TR_RST_TIME)); /* wait 50ms */
 
 		outb(0,dev->base_addr+ADAPTRESETREL);
 	}
@@ -858,8 +859,7 @@ static int tok_init_card(struct net_devi
 	writeb(~INT_ENABLE, ti->mmio + ACA_OFFSET + ACA_RESET + ISRP_EVEN);
 	outb(0, PIOaddr + ADAPTRESET);
 
-	current->state=TASK_UNINTERRUPTIBLE;
-	schedule_timeout(TR_RST_TIME); /* wait 50ms */
+	msleep(jiffies_to_msecs(TR_RST_TIME));		/* wait 50ms */
 
 	outb(0, PIOaddr + ADAPTRESETREL);
 #ifdef ENABLE_PAGING
@@ -912,9 +912,8 @@ static int tok_open(struct net_device *d
 			DPRINTK("Adapter is up and running\n");
 			return 0;
 		}
-		current->state=TASK_INTERRUPTIBLE;
-		i=schedule_timeout(TR_RETRY_INTERVAL); /* wait 30 seconds */
-		if(i!=0) break; /*prob. a signal, like the i>24*HZ case above */
+		if(msleep_interruptible(jiffies_to_msecs(TR_RETRY_INTERVAL)))
+			break; /*prob. a signal, like the i>24*HZ case above */
 	}
 	outb(0, dev->base_addr + ADAPTRESET);/* kill pending interrupts*/
 	DPRINTK("TERMINATED via signal\n");	/*BMS useful */

--===============83017228999693571==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83017228999693571==--
