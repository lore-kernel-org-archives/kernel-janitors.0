From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 23 Sep 2004 22:03:02 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 27/38] net/ns83820: replace
Message-Id: <20040923220302.GB5260@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53447120704396367=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============53447120704396367==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/ns83820.c	2004-09-13 17:15:45.000000000 -0700
+++ 2.6.9-rc2/drivers/net/ns83820.c	2004-09-14 17:23:57.000000000 -0700
@@ -1960,8 +1960,7 @@ static int __devinit ns83820_init_one(st
 	if (reset_phy) {
 		printk(KERN_INFO "%s: resetting phy\n", ndev->name);
 		writel(dev->CFG_cache | CFG_PHY_RST, dev->base + CFG);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout((HZ+99)/100);
+		msleep(10);
 		writel(dev->CFG_cache, dev->base + CFG);
 	}
 

--===============53447120704396367==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53447120704396367==--
