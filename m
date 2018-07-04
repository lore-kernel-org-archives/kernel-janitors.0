From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Jul 2018 07:49:43 +0000
Subject: [PATCH] net: fec: remove redundant variable 'inc'
Message-Id: <20180704074943.15820-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fugang Duan <fugang.duan@nxp.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable 'inc' is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'inc' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/freescale/fec_ptp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ethernet/freescale/fec_ptp.c
index 36c2d7d6ee1b..7e892b1cbd3d 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -99,7 +99,6 @@ static int fec_ptp_enable_pps(struct fec_enet_private *fep, uint enable)
 {
 	unsigned long flags;
 	u32 val, tempval;
-	int inc;
 	struct timespec64 ts;
 	u64 ns;
 	val = 0;
@@ -114,7 +113,6 @@ static int fec_ptp_enable_pps(struct fec_enet_private *fep, uint enable)
 
 	fep->pps_channel = DEFAULT_PPS_CHANNEL;
 	fep->reload_period = PPS_OUPUT_RELOAD_PERIOD;
-	inc = fep->ptp_inc;
 
 	spin_lock_irqsave(&fep->tmreg_lock, flags);
 
-- 
2.17.1

