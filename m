From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 18:41:48 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/3] md/md: replace
Message-Id: <20040917184147.GA5755@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89584492495757018=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916231114.GE1777@us.ibm.com>
In-Reply-To: <20040916231114.GE1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============89584492495757018==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/md/md.c	2004-09-09 23:05:58.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/md/md.c	2004-09-10 11:51:33.000000000 -0700
@@ -3578,8 +3578,7 @@ static void md_do_sync(mddev_t *mddev)
 		if (currspeed > sysctl_speed_limit_min) {
 			if ((currspeed > sysctl_speed_limit_max) ||
 					!is_mddev_idle(mddev)) {
-				current->state = TASK_INTERRUPTIBLE;
-				schedule_timeout(HZ/4);
+				msleep_interruptible(250);
 				goto repeat;
 			}
 		}

--===============89584492495757018==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89584492495757018==--
