From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 28 Jul 2004 17:37:48 +0000
Subject: Re: [Kernel-janitors] [PATCH] net/ibmtr: replace schedule_timeout()
Message-Id: <20040728173747.GE1935@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66651907233648999=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727204332.GA3471@us.ibm.com>
In-Reply-To: <20040727204332.GA3471@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============66651907233648999==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 01:43:32PM -0700, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. 
> 
> Applys-to: 2.6.7
> 
> Description: Use msleep() instead of schedule_timeout() to guarantee
> the task delays for the desired time.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

The previous patch introduced extraneous whitespace, sorry. Thanks,
Domen.


--- linux-vanilla/drivers/net/tokenring/ibmtr.c	2004-06-15 22:19:37.000000000 -0700
+++ linux-dev/drivers/net/tokenring/ibmtr.c	2004-07-28 10:36:12.000000000 -0700
@@ -108,6 +108,7 @@ in the event that chatty debug messages 
 #define IBMTR_DEBUG_MESSAGES 0
 
 #include <linux/module.h>
+#include <linux/delay.h>
 
 #ifdef PCMCIA		/* required for ibmtr_cs.c to build */
 #undef MODULE		/* yes, really */
@@ -857,8 +858,7 @@ static int tok_init_card(struct net_devi
 	writeb(~INT_ENABLE, ti->mmio + ACA_OFFSET + ACA_RESET + ISRP_EVEN);
 	outb(0, PIOaddr + ADAPTRESET);
 
-	current->state=TASK_UNINTERRUPTIBLE;
-	schedule_timeout(TR_RST_TIME); /* wait 50ms */
+	msleep(jiffies_to_msecs(TR_RST_TIME));
 
 	outb(0, PIOaddr + ADAPTRESETREL);
 #ifdef ENABLE_PAGING

--===============66651907233648999==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66651907233648999==--
