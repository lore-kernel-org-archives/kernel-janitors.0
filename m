From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 01 Sep 2004 22:56:30 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc1-bk7] tokenring/lanstreamer:
Message-Id: <20040901225630.GJ2516@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19229354262234954=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040901222224.GD2516@us.ibm.com>
In-Reply-To: <20040901222224.GD2516@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============19229354262234954==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is one of 10 patches which have either not been pushed to mainline
(2.6.9-rc1-bk7) or have not been included in any of the recent kjt's.

Applys-to: 2.6.9-rc1-bk7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays as desired.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.9-rc1-bk7-vanilla/drivers/net/tokenring/lanstreamer.c	2004-08-31 21:26:33.000000000 +0000
+++ 2.6.9-rc1-bk7-dev/drivers/net/tokenring/lanstreamer.c	2004-09-01 21:30:32.000000000 +0000
@@ -455,8 +455,7 @@ static int streamer_reset(struct net_dev
 	writew(readw(streamer_mmio + BCTL) | BCTL_SOFTRESET, streamer_mmio + BCTL);
 	t = jiffies;
 	/* Hold soft reset bit for a while */
-	current->state = TASK_UNINTERRUPTIBLE;
-	schedule_timeout(HZ);
+	msleep(1000);
 	
 	writew(readw(streamer_mmio + BCTL) & ~BCTL_SOFTRESET,
 	       streamer_mmio + BCTL);

--===============19229354262234954==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19229354262234954==--
