From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 17 Jan 2005 22:56:05 +0000
Subject: [KJ] [PATCH 11/21] char/sx: replace schedule_timeout() with
Message-Id: <20050117225605.GQ24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23259920155965474=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============23259920155965474==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying. 

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee consistent timing regardless of HZ value. schedule_timeout(1) will
vary between 10 and 1 milliseconds, depending on the value of HZ (100 or 1000
respectively). For consistent behavior, msleep_interruptible() should be used.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/char/sx.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/char/sx.c	2005-01-16 23:45:13.000000000 -0800
@@ -1515,13 +1515,9 @@ static void sx_close (void *ptr)
 	sx_reconfigure_port(port);	
 	sx_send_command (port, HS_CLOSE, 0, 0);
 
-	while (to-- && (sx_read_channel_byte (port, hi_hstat) != HS_IDLE_CLOSED)) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout (1);
-		if (signal_pending (current))
+	while (to-- && (sx_read_channel_byte (port, hi_hstat) != HS_IDLE_CLOSED))
+		if (msleep_interruptible(10))
 				break;
-	}
-	current->state = TASK_RUNNING;
 	if (sx_read_channel_byte (port, hi_hstat) != HS_IDLE_CLOSED) {
 		if (sx_send_command (port, HS_FORCE_CLOSED, -1, HS_IDLE_CLOSED) != 1) {
 			printk (KERN_ERR 

--===============23259920155965474==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23259920155965474==--
