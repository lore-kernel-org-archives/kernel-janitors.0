From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 22 Jul 2004 22:12:55 +0000
Subject: [Kernel-janitors] [PATCH] i2c-nforce2: replace schedule_timeout()
Message-Id: <20040722221255.GO2165@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46432723898568007=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============46432723898568007==
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

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/i2c/busses/i2c-nforce2.c	2004-06-16 05:18:59.000000000 +0000
+++ linux-dev/drivers/i2c/busses/i2c-nforce2.c	2004-07-12 18:06:23.000000000 +0000
@@ -244,8 +244,7 @@ static s32 nforce2_access(struct i2c_ada
 		temp = inb_p(NVIDIA_SMB_STS);
 	}
 	if (~temp & NVIDIA_SMB_STS_DONE) {
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(HZ/100);
+		msleep(10);
 		temp = inb_p(NVIDIA_SMB_STS);
 	}
 

--===============46432723898568007==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46432723898568007==--
