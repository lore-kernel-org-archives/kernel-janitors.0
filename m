From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 23 Sep 2004 22:13:24 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 21/38] net/lanstreamer: replace
Message-Id: <20040923221324.GF13244@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99747274819555742=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============99747274819555742==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use ssleep() / msleep_interruptible() [as appropriate]
instead of schedule_timeout() to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/tokenring/lanstreamer.c	2004-09-13 17:15:44.000000000 -0700
+++ 2.6.9-rc2/drivers/net/tokenring/lanstreamer.c	2004-09-23 14:17:23.000000000 -0700
@@ -455,8 +455,7 @@ static int streamer_reset(struct net_dev
 	writew(readw(streamer_mmio + BCTL) | BCTL_SOFTRESET, streamer_mmio + BCTL);
 	t = jiffies;
 	/* Hold soft reset bit for a while */
-	current->state = TASK_UNINTERRUPTIBLE;
-	schedule_timeout(HZ);
+	ssleep(1);
 	
 	writew(readw(streamer_mmio + BCTL) & ~BCTL_SOFTRESET,
 	       streamer_mmio + BCTL);
@@ -512,8 +511,7 @@ static int streamer_reset(struct net_dev
 	writew(SISR_MI, streamer_mmio + SISR_MASK_SUM);
 
 	while (!((readw(streamer_mmio + SISR)) & SISR_SRB_REPLY)) {
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(HZ/10);
+		msleep_interruptible(100);
 		if (jiffies - t > 40 * HZ) {
 			printk(KERN_ERR
 			       "IBM PCI tokenring card not responding\n");

--===============99747274819555742==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99747274819555742==--
