From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 17:28:17 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 4/4] sbus/envctrl: replace
Message-Id: <20040927172817.GN1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39897270863831835=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040920235909.GG2270@us.ibm.com>
In-Reply-To: <20040920235909.GG2270@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============39897270863831835==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected.

--- 2.6.9-rc1-mm4-vanilla/drivers/sbus/char/envctrl.c	2004-09-09 23:05:59.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/sbus/char/envctrl.c	2004-09-10 15:42:50.000000000 -0700
@@ -1034,8 +1034,7 @@ static int kenvctrld(void *__unused)
 
 	printk(KERN_INFO "envctrl: %s starting...\n", current->comm);
 	for (;;) {
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(poll_interval);
+		msleep_interruptible(jiffies_to_msecs(poll_interval));
 
 		if(signal_pending(current))
 			break;

--===============39897270863831835==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39897270863831835==--
