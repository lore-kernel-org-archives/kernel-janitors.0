From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 17:26:56 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 3/4] sbus/bbc_i2c: replace
Message-Id: <20040927172656.GM1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8497681943616664=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040920235847.GF2270@us.ibm.com>
In-Reply-To: <20040920235847.GF2270@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============8497681943616664==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected. Also use
set_current_state() instead of direct assignment of current->state.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
--- 2.6.9-rc1-mm4-vanilla/drivers/sbus/char/bbc_i2c.c	2004-09-09 23:05:59.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/sbus/char/bbc_i2c.c	2004-09-10 15:42:35.000000000 -0700
@@ -189,13 +189,13 @@ static int wait_for_pin(struct bbc_i2c_b
 	while (limit-- > 0) {
 		u8 val;
 
-		current->state = TASK_INTERRUPTIBLE;
+		set_current_state(TASK_INTERRUPTIBLE);
 		*status = val = readb(bp->i2c_control_regs + 0);
 		if ((val & I2C_PCF_PIN) == 0) {
 			ret = 0;
 			break;
 		}
-		schedule_timeout(HZ/4);
+		msleep_interruptible(250);
 	}
 	remove_wait_queue(&bp->wq, &wait);
 	bp->waiting = 0;


--===============8497681943616664==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8497681943616664==--
