From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 21:00:12 +0000
Subject: [Kernel-janitors] [PATCH] isdn/sc: replace schedule_timeout() with
Message-Id: <20040723210012.GL2675@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33160589925244288=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============33160589925244288==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch. 

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/sc/init.c	2004-06-16 05:19:43.000000000 +0000
+++ linux-dev/drivers/isdn/sc/init.c	2004-07-12 18:46:07.000000000 +0000
@@ -167,8 +167,7 @@ static int __init sc_init(void)
 		if(do_reset) {
 			pr_debug("Doing a SAFE probe reset\n");
 			outb(0xFF, io[b] + RESET_OFFSET);
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(milliseconds(10000));
+			msleep(10000);
 		}
 		pr_debug("RAM Base for board %d is 0x%x, %s probe\n", b, ram[b],
 			ram[b] == 0 ? "will" : "won't");
@@ -500,8 +499,7 @@ int identify_board(unsigned long rambase
 	 * Try to identify a PRI card
 	 */
 	outb(PRI_BASEPG_VAL, pgport);
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ);
+	msleep(1000);
 	sig = readl(rambase + SIG_OFFSET);
 	pr_debug("Looking for a signature, got 0x%x\n", sig);
 	if(sig == SIGNATURE)
@@ -511,8 +509,7 @@ int identify_board(unsigned long rambase
 	 * Try to identify a PRI card
 	 */
 	outb(BRI_BASEPG_VAL, pgport);
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ);
+	msleep(1000);
 	sig = readl(rambase + SIG_OFFSET);
 	pr_debug("Looking for a signature, got 0x%x\n", sig);
 	if(sig == SIGNATURE)

--===============33160589925244288==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33160589925244288==--
