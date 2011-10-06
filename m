From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Oct 2011 06:17:38 +0000
Subject: [patch] Staging: dt3155v4l: silence a compiler warning
Message-Id: <20111006061738.GD14701@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The '!' is dead code that was left over from a previous version.
It causes a compiler warning:
drivers/staging/dt3155v4l/dt3155v4l.c:335:3: warning: value computed
	is not used

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/dt3155v4l/dt3155v4l.c b/drivers/staging/dt3155v4l/dt3155v4l.c
index 7f5ae2d..5a2ec91 100644
--- a/drivers/staging/dt3155v4l/dt3155v4l.c
+++ b/drivers/staging/dt3155v4l/dt3155v4l.c
@@ -332,7 +332,7 @@ dt3155_irq_handler_even(int irq, void *dev_id)
 		return IRQ_HANDLED; /* start of field irq */
 	}
 	if ((tmp & FLD_START) && (tmp & FLD_END_ODD))
-		!ipd->stats.start_before_end++;
+		ipd->stats.start_before_end++;
 	/*	check for corrupted fields     */
 /*	write_i2c_reg(ipd->regs, EVEN_CSR, CSR_ERROR | CSR_DONE);	*/
 /*	write_i2c_reg(ipd->regs, ODD_CSR, CSR_ERROR | CSR_DONE);	*/
