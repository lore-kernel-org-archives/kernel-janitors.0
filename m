From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 23:40:31 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 2/2] i2c/i2c-mpc: replace
Message-Id: <20040916234031.GG1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93051679188758074=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916230412.GD1777@us.ibm.com>
In-Reply-To: <20040916230412.GD1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============93051679188758074==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Previous patch won't compile. Any comments would (still) be appreciated.

Description: Properly orders set_current_state() and add_wait_queue().
Uses msleep_interruptible() in place of schedule_timeout() to guarantee
the task delays as expected. Uses set_current_state() instead of direct
assignment of current->state.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/i2c/busses/i2c-mpc.c	2004-09-13 17:15:46.000000000 -0700
+++ 2.6.9-rc2/drivers/i2c/busses/i2c-mpc.c	2004-09-16 16:37:31.000000000 -0700
@@ -23,6 +23,7 @@
 #include <asm/ocp.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
+#include <linux/delay.h>
 
 #define MPC_I2C_ADDR  0x00
 #define MPC_I2C_FDR 	0x04
@@ -91,9 +92,9 @@ static int i2c_wait(struct mpc_i2c *i2c,
 		x = readb(i2c->base + MPC_I2C_SR);
 		writeb(0, i2c->base + MPC_I2C_SR);
 	} else {
+		set_current_state(TASK_INTERRUPTIBLE);
 		add_wait_queue(&i2c->queue, &wait);
 		while (!(i2c->interrupt & CSR_MIF)) {
-			set_current_state(TASK_INTERRUPTIBLE);
 			if (signal_pending(current)) {
 				pr_debug("I2C: Interrupted\n");
 				result = -EINTR;
@@ -104,9 +105,9 @@ static int i2c_wait(struct mpc_i2c *i2c,
 				result = -EIO;
 				break;
 			}
-			schedule_timeout(timeout);
+			msleep_interruptible(jiffies_to_msecs(timeout));
 		}
-		current->state = TASK_RUNNING;
+		set_current_state(TASK_RUNNING);
 		remove_wait_queue(&i2c->queue, &wait);
 		x = i2c->interrupt;
 		i2c->interrupt = 0;

--===============93051679188758074==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93051679188758074==--
