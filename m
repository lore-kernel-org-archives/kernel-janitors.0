From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 16:43:49 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 11/33] char/i830_irq: replace
Message-Id: <20040916164349.GD1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40230446240195716=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============40230446240195716==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. 

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/char/drm/i830_irq.c	2004-09-09 23:05:37.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/char/drm/i830_irq.c	2004-09-10 10:34:30.000000000 -0700
@@ -105,7 +105,7 @@ int i830_wait_irq(drm_device_t *dev, int
 		   	ret = -EBUSY;	/* Lockup?  Missed irq? */
 			break;
 		}
-	      	schedule_timeout(HZ*3);
+	      	msleep_interruptible(3000);
 	      	if (signal_pending(current)) {
 		   	ret = -EINTR;
 			break;

--===============40230446240195716==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40230446240195716==--
