From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 16:02:52 +0000
Subject: [Kernel-janitors] Re: isdn/init: replace schedule_timeout() with
Message-Id: <20040920160252.GB1796@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15590685898339762=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040918211952.GB3609@masina.coderock.org>
In-Reply-To: <20040918211952.GB3609@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============15590685898339762==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 18, 2004 at 11:19:52PM +0200, Domen Puncer wrote:
> On 17/09/04 10:56 -0700, Nishanth Aravamudan wrote:
> > --- 2.6.9-rc2-vanilla/drivers/isdn/sc/init.c	2004-09-13 17:16:04.000000000 -0700
> > +++ 2.6.9-rc2/drivers/isdn/sc/init.c	2004-09-17 10:54:58.000000000 -0700
> > @@ -7,6 +7,7 @@
> ...
> > -			set_current_state(TASK_INTERRUPTIBLE);
> > -			schedule_timeout(milliseconds(10000));
> > +			msleep_interruptible(msecs_to_jiffies(10000));
> 
> Should be without msecs_to_jiffies.

Please find the corrected patch below:

--- 2.6.9-rc2-vanilla/drivers/isdn/sc/init.c	2004-09-13 17:16:04.000000000 -0700
+++ 2.6.9-rc2/drivers/isdn/sc/init.c	2004-09-20 09:01:27.000000000 -0700
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/delay.h>
 #include "includes.h"
 #include "hardware.h"
 #include "card.h"
@@ -167,8 +168,7 @@ static int __init sc_init(void)
 		if(do_reset) {
 			pr_debug("Doing a SAFE probe reset\n");
 			outb(0xFF, io[b] + RESET_OFFSET);
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(milliseconds(10000));
+			msleep_interruptible(10000);
 		}
 		pr_debug("RAM Base for board %d is 0x%x, %s probe\n", b, ram[b],
 			ram[b] == 0 ? "will" : "won't");
@@ -500,8 +500,7 @@ int identify_board(unsigned long rambase
 	 * Try to identify a PRI card
 	 */
 	outb(PRI_BASEPG_VAL, pgport);
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ);
+	msleep_interruptible(1000);
 	sig = readl(rambase + SIG_OFFSET);
 	pr_debug("Looking for a signature, got 0x%x\n", sig);
 	if(sig == SIGNATURE)
@@ -511,8 +510,7 @@ int identify_board(unsigned long rambase
 	 * Try to identify a PRI card
 	 */
 	outb(BRI_BASEPG_VAL, pgport);
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ);
+	msleep_interruptible(1000);
 	sig = readl(rambase + SIG_OFFSET);
 	pr_debug("Looking for a signature, got 0x%x\n", sig);
 	if(sig == SIGNATURE)

--===============15590685898339762==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15590685898339762==--
