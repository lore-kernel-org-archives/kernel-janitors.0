From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 22:42:50 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 7/33] char/fdc-io: replace
Message-Id: <20040915224250.GL5778@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93168830466416253=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============93168830466416253==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. 

Description: Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/char/ftape/lowlevel/fdc-io.c	2004-09-13 17:15:47.000000000 -0700
+++ 2.6.9-rc2/drivers/char/ftape/lowlevel/fdc-io.c	2004-09-14 11:59:57.000000000 -0700
@@ -389,7 +389,7 @@ int fdc_interrupt_wait(unsigned int time
 	recalc_sigpending();
 	spin_unlock_irq(&current->sighand->siglock);
 
-	current->state = TASK_INTERRUPTIBLE;
+	set_current_state(TASK_INTERRUPTIBLE);
 	add_wait_queue(&ftape_wait_intr, &wait);
 	while (!ft_interrupt_seen && (current->state == TASK_INTERRUPTIBLE)) {
 		timeout = schedule_timeout(timeout);

--===============93168830466416253==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93168830466416253==--
