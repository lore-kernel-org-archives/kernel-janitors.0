From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 17:25:50 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 2/4] sbus/bbc_envctrl: replace
Message-Id: <20040927172550.GL1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16154788366584039=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040920221309.GA2270@us.ibm.com>
In-Reply-To: <20040920221309.GA2270@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============16154788366584039==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected. Change the
units of POLL_INTERVAL to msecs to correspond to the msleep*() change.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/sbus/char/bbc_envctrl.c	2004-09-09 23:05:59.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/sbus/char/bbc_envctrl.c	2004-09-10 15:41:09.000000000 -0700
@@ -452,7 +452,7 @@ static void fans_full_blast(void)
 	}
 }
 
-#define POLL_INTERVAL	(5 * HZ)
+#define POLL_INTERVAL	(5 * 1000)
 static unsigned long last_warning_jiffies;
 static struct task_struct *kenvctrld_task;
 
@@ -468,8 +468,7 @@ static int kenvctrld(void *__unused)
 		struct bbc_cpu_temperature *tp;
 		struct bbc_fan_control *fp;
 
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(POLL_INTERVAL);
+		msleep_interruptible(POLL_INTERVAL);
 		if (signal_pending(current))
 			break;
 

--===============16154788366584039==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16154788366584039==--
