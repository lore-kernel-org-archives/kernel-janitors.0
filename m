From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 17 Jan 2005 21:20:11 +0000
Subject: [KJ] [PATCH 7/22] ftape/fdc-io: insert set_current_state() before
Message-Id: <20050117212011.GI24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============068584577036343575=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============068584577036343575==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Inserts a set_current_state(TASK_INTERRUPTIBLE) before the
schedule_timeout() call. Without this change, after the first iteration of the
loop, schedule_timeout() will not only return immediately, but the loop will
break, as the conditional will no longer be satisfied. In fact, this conditional
makes little sense given the workings of schedule_timeout. The timeout variable
is ignored, as well, and I'm fairly certain that it should be included in the
loop conditional. That way, if the timeout expires before a signal hits, -ETIME
will be returned by fdc_interrupt_wait() instead of -EINTR.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-rc1-kj-v/drivers/char/ftape/lowlevel/fdc-io.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/char/ftape/lowlevel/fdc-io.c	2005-01-17 13:12:29.000000000 -0800
@@ -387,7 +387,8 @@ int fdc_interrupt_wait(unsigned int time
 
 	set_current_state(TASK_INTERRUPTIBLE);
 	add_wait_queue(&ftape_wait_intr, &wait);
-	while (!ft_interrupt_seen && (current->state == TASK_INTERRUPTIBLE)) {
+	while (!ft_interrupt_seen && timeout) {
+		set_current_state(TASK_INTERRUPTIBLE);
 		timeout = schedule_timeout(timeout);
         }
 

--===============068584577036343575==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============068584577036343575==--
