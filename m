From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 20:59:04 +0000
Subject: [Kernel-janitors] [PATCH] isdn/icn.c: replace schedule_timeout()
Message-Id: <20040723205904.GK2675@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44696864313081375=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============44696864313081375==
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


--- linux-vanilla/drivers/isdn/icn/icn.c	2004-06-16 05:20:26.000000000 +0000
+++ linux-dev/drivers/isdn/icn/icn.c	2004-07-12 18:10:30.000000000 +0000
@@ -762,8 +762,7 @@ icn_check_loader(int cardnumber)
 #ifdef BOOT_DEBUG
 			printk(KERN_DEBUG "Loader %d TO?\n", cardnumber);
 #endif
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(ICN_BOOT_TIMEOUT1);
+			msleep(jiffies_to_msecs(ICN_BOOT_TIMEOUT1));
 		} else {
 #ifdef BOOT_DEBUG
 			printk(KERN_DEBUG "Loader %d OK\n", cardnumber);
@@ -974,8 +973,7 @@ icn_loadproto(u_char * buffer, icn_card 
 #ifdef BOOT_DEBUG
 			printk(KERN_DEBUG "Proto TO?\n");
 #endif
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(ICN_BOOT_TIMEOUT1);
+			msleep(jiffies_to_msecs(ICN_BOOT_TIMEOUT1));
 		} else {
 			if ((card->secondhalf) || (!card->doubleS0)) {
 #ifdef BOOT_DEBUG

--===============44696864313081375==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44696864313081375==--
