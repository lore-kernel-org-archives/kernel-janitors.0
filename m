From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 11 Jan 2005 00:56:30 +0000
Subject: [KJ] [UPDATE PATCH] sbus/envctrl: replace schedule_timeout() with
Message-Id: <20050111005630.GL9186@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============022804889654032268=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050110164703.GD14307@nd47.coderock.org>
In-Reply-To: <20050110164703.GD14307@nd47.coderock.org>
To: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>

--===============022804889654032268==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 10, 2005 at 05:47:03PM +0100, Domen Puncer wrote:
> Patchset of 171 patches is at http://coderock.org/kj/2.6.10-bk13-kj/
> 
> Quick patch summary: about 30 new, 30 merged, 30 dropped.
> Seems like most external trees are merged in -linus, so i'll start
> (re)sending old patches.

<snip>

> msleep_interruptible-drivers_sbus_char_envctrl.patch

Please consider updating to the following patch:

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected. Change the units of
poll_interval to msecs as it is only used in this delay.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.10-v/drivers/sbus/char/envctrl.c	2004-12-24 13:34:01.000000000 -0800
+++ 2.6.10/drivers/sbus/char/envctrl.c	2005-01-05 14:23:05.000000000 -0800
@@ -1007,7 +1007,7 @@ static int kenvctrld(void *__unused)
 		return -ENODEV;
 	}
 
-	poll_interval = 5 * HZ; /* TODO env_mon_interval */
+	poll_interval = 5000; /* TODO env_mon_interval */
 
 	daemonize("kenvctrld");
 	allow_signal(SIGKILL);
@@ -1016,10 +1016,7 @@ static int kenvctrld(void *__unused)
 
 	printk(KERN_INFO "envctrl: %s starting...\n", current->comm);
 	for (;;) {
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(poll_interval);
-
-		if(signal_pending(current))
+		if(msleep_interruptible(poll_interval))
 			break;
 
 		for (whichcpu = 0; whichcpu < ENVCTRL_MAX_CPU; ++whichcpu) {

--===============022804889654032268==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============022804889654032268==--
