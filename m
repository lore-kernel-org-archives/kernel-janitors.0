From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 17 Jan 2005 23:44:25 +0000
Subject: [KJ] [PATCH 15/21] net/skethtool: remove duplicate delay
Message-Id: <20050117234425.GX24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============047395047974255755=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============047395047974255755==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying. 

Description: Remove an unnecessary second (and identical) delay.
schedule_timeout() does not need to be called, as msleep_interruptible() already
delayed the task.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/net/sk98lin/skethtool.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/net/sk98lin/skethtool.c	2005-01-16 23:52:18.000000000 -0800
@@ -437,9 +437,6 @@ static int locateDevice(struct net_devic
 	pAC->LedsOn = 0;
 	mod_timer(&pAC->BlinkTimer, jiffies);
 	msleep_interruptible(data * 1000);
-
-	set_current_state(TASK_INTERRUPTIBLE);
-	schedule_timeout(data * HZ);
 	del_timer_sync(&pAC->BlinkTimer);
 	toggleLeds(pNet, 0);
 

--===============047395047974255755==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============047395047974255755==--
