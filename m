From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 22 Jul 2004 21:47:34 +0000
Subject: [Kernel-janitors] [PATCH] isicom: replace schedule_timeout() with
Message-Id: <20040722214734.GI2165@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============092356829155571862=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============092356829155571862==
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

Note: I could not find any current Maintainer for this driver. If there
is one I should sent the patch too, please let me know.

Thanks,
Nish



Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/char/isicom.c	2004-06-16 05:18:55.000000000 +0000
+++ linux-dev/drivers/char/isicom.c	2004-07-12 17:52:28.000000000 +0000
@@ -1906,8 +1906,7 @@ int init_module(void)
 void cleanup_module(void)
 {
 	re_schedule = 0;
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(HZ);
+	msleep(1000);
 
 #ifdef ISICOM_DEBUG	
 	printk("ISICOM: isicom_tx tx_count = %ld.\n", tx_count);

--===============092356829155571862==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============092356829155571862==--
