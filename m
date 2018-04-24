From: Colin King <colin.king@canonical.com>
Date: Tue, 24 Apr 2018 11:39:45 +0000
Subject: [PATCH] fsl/fman_port: remove redundant check on port->rev_info.major
Message-Id: <20180424113945.16371-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Madalin Bucur <madalin.bucur@nxp.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check port->rev_info.major >= 6 is being performed twice, thus
the inner second check is always true and is redundant, hence it
can be removed. Detected by cppcheck.

drivers/net/ethernet/freescale/fman/fman_port.c:1394]: (warning)
Identical inner 'if' condition is always true.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/freescale/fman/fman_port.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fman/fman_port.c b/drivers/net/ethernet/freescale/fman/fman_port.c
index 6552d68ea6e1..ce6e24c74978 100644
--- a/drivers/net/ethernet/freescale/fman/fman_port.c
+++ b/drivers/net/ethernet/freescale/fman/fman_port.c
@@ -1391,12 +1391,10 @@ int fman_port_config(struct fman_port *port, struct fman_port_params *params)
 		/* FM_WRONG_RESET_VALUES_ERRATA_FMAN_A005127 Errata
 		 * workaround
 		 */
-		if (port->rev_info.major >= 6) {
-			u32 reg;
+		u32 reg;
 
-			reg = 0x00001013;
-			iowrite32be(reg, &port->bmi_regs->tx.fmbm_tfp);
-		}
+		reg = 0x00001013;
+		iowrite32be(reg, &port->bmi_regs->tx.fmbm_tfp);
 	}
 
 	return 0;
-- 
2.17.0

