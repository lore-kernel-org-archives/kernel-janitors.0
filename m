From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 14 Oct 2004 18:35:20 +0000
Subject: [KJ] Re: [PATCH] i2c/i2c-ibm_iic: replace schedule_timeout() with
Message-Id: <20041014183520.GG2214@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============020947578526698152=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============020947578526698152==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Forgot the Signed-off-by: line, sorry.


Any comments would (still) be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected. Remove the unnecessary
set_current_state() following the if, as schedule_timeout() [and thus,
mlseep_interruptible()] is guaranteed to return in TASK_RUNNING.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc4-vanilla/drivers/i2c/busses/i2c-ibm_iic.c	2004-10-14 11:24:43.000000000 -0700
+++ 2.6.9-rc4/drivers/i2c/busses/i2c-ibm_iic.c	2004-10-14 11:30:08.000000000 -0700
@@ -416,10 +416,8 @@ static int iic_wait_for_tc(struct ibm_ii
     		init_waitqueue_entry(&wait, current);
 		
 		add_wait_queue(&dev->wq, &wait);
-		set_current_state(TASK_INTERRUPTIBLE);
 		if (in_8(&iic->sts) & STS_PT)
-			schedule_timeout(dev->adap.timeout * HZ);
-		set_current_state(TASK_RUNNING);
+			msleep_interruptible(dev->adap.timeout * 1000);
 		remove_wait_queue(&dev->wq, &wait);
 		
 		if (unlikely(signal_pending(current))){

--===============020947578526698152==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============020947578526698152==--
