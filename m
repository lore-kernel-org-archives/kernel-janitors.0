From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 23:22:58 +0000
Subject: [Kernel-janitors] [PATCH] message/i2o_core: replace
Message-Id: <20040726232258.GC1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43968874138113323=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============43968874138113323==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() so the task
is guaranteed to delay the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/message/i2o/i2o_core.c	2004-06-16 05:19:37.000000000 +0000
+++ linux-dev/drivers/message/i2o/i2o_core.c	2004-07-02 21:47:38.000000000 +0000
@@ -889,8 +889,7 @@ int i2o_release_device(struct i2o_device
 		if((err=i2o_issue_claim(I2O_CMD_UTIL_RELEASE, d->controller, d->lct_data.tid, I2O_CLAIM_PRIMARY)) )
 		{
 			err = -ENXIO;
-			current->state = TASK_UNINTERRUPTIBLE;
-			schedule_timeout(HZ);
+			msleep(1000);
 		}
 		else
 		{

--===============43968874138113323==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43968874138113323==--
