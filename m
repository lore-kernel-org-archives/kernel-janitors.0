From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 18:13:30 +0000
Subject: [Kernel-janitors] [PATCH 3/5] atm/he: replace schedule_timeout()
Message-Id: <20040915181330.GD4363@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50988199177227034=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============50988199177227034==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch I sent
19 July but the changes haven't appared in either 2.6.9-rc1-mm5 or
2.6.9-rc2.

Description: msleep() is used instead of schedule_timeout() to guarantee
the task delays as expected. Also, an extraneous set_current_state() is
removed, as the task is guaranteed to be in TASK_RUNNING upon returning
from schedule_timeout().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/atm/he.c	2004-09-13 17:16:06.000000000 -0700
+++ 2.6.9-rc2/drivers/atm/he.c	2004-09-14 11:25:55.000000000 -0700
@@ -2569,7 +2569,6 @@ he_close(struct atm_vcc *vcc)
 		timeout = schedule_timeout(30*HZ);
 
 		remove_wait_queue(&he_vcc->rx_waitq, &wait);
-		set_current_state(TASK_RUNNING);
 
 		if (timeout == 0)
 			hprintk("close rx timeout cid 0x%x\n", cid);
@@ -2595,8 +2594,7 @@ he_close(struct atm_vcc *vcc)
 
 		while (((tx_inuse = atomic_read(&vcc->sk->sk_wmem_alloc)) > 0) &&
 		       (retry < MAX_RETRY)) {
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			(void) schedule_timeout(sleep);
+			msleep(jiffies_to_msecs(sleep));
 			if (sleep < HZ)
 				sleep = sleep * 2;
 

--===============50988199177227034==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50988199177227034==--
