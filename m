From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 21 Jul 2004 21:43:54 +0000
Subject: [Kernel-janitors] [PATCH] ds1620: replace schedule_timeout() with
Message-Id: <20040721214354.GL1906@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70726823161939079=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============70726823161939079==
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

Note: I looked for the appropriate maintainer of this driver, but I did
not find anyone. If someone could tell me who that would be, I would
appreciate it.

Thanks,
Nish



Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/char/ds1620.c	2004-06-16 05:18:57.000000000 +0000
+++ linux-dev/drivers/char/ds1620.c	2004-07-10 18:32:44.000000000 +0000
@@ -370,8 +370,7 @@ static int __init ds1620_init(void)
 	th_start.hi = 1;
 	ds1620_write_state(&th_start);
 
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(2*HZ);
+	msleep(2000);
 
 	ds1620_write_state(&th);
 

--===============70726823161939079==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70726823161939079==--
