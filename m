From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 21:39:43 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/17] media/bttv-i2c: replace
Message-Id: <20040920213943.GE2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6485082622085816=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============6485082622085816==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/media/video/bttv-i2c.c	2004-09-13 17:15:40.000000000 -0700
+++ 2.6.9-rc2/drivers/media/video/bttv-i2c.c	2004-09-14 16:35:07.000000000 -0700
@@ -139,10 +139,8 @@ bttv_i2c_wait_done(struct bttv *btv)
 	int rc = 0;
 	
 	add_wait_queue(&btv->i2c_queue, &wait);
-	set_current_state(TASK_INTERRUPTIBLE);
 	if (0 == btv->i2c_done)
-		schedule_timeout(HZ/50+1);
-	set_current_state(TASK_RUNNING);
+		msleep_interruptible(20);
 	remove_wait_queue(&btv->i2c_queue, &wait);
 
 	if (0 == btv->i2c_done)

--===============6485082622085816==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6485082622085816==--
