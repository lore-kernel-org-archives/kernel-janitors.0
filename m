From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 17:13:54 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 17/33] char/moxa: replace
Message-Id: <20040916171354.GJ1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94296100541076233=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============94296100541076233==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/char/moxa.c	2004-09-09 23:05:41.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/char/moxa.c	2004-09-10 11:02:56.000000000 -0700
@@ -625,8 +625,7 @@ static void moxa_close(struct tty_struct
 	ch->tty = NULL;
 	if (ch->blocked_open) {
 		if (ch->close_delay) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(ch->close_delay);
+			msleep_interruptible(jiffies_to_msecs(ch->close_delay));
 		}
 		wake_up_interruptible(&ch->open_wait);
 	}

--===============94296100541076233==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94296100541076233==--
