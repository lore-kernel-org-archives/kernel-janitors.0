From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 21:22:47 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 27/33] char/sx: replace direct
Message-Id: <20040916212246.GU1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2494157905045673=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============2494157905045673==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/char/sx.c	2004-09-09 23:05:41.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/char/sx.c	2004-09-10 11:18:12.000000000 -0700
@@ -1502,7 +1502,7 @@ static void sx_close (void *ptr)
 	sx_send_command (port, HS_CLOSE, 0, 0);
 
 	while (to-- && (sx_read_channel_byte (port, hi_hstat) != HS_IDLE_CLOSED)) {
-		current->state = TASK_INTERRUPTIBLE;
+		set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout (1);
 		if (signal_pending (current))
 				break;

--===============2494157905045673==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2494157905045673==--
