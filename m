From: Colin King <colin.king@canonical.com>
Date: Sat, 07 Jul 2018 12:47:06 +0000
Subject: [PATCH] drivers: net: lmc: remove redundant variable next_rx
Message-Id: <20180707124706.23344-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable next_rx is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'next_rx' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wan/lmc/lmc_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wan/lmc/lmc_main.c b/drivers/net/wan/lmc/lmc_main.c
index 90a4ad9a2d08..093bd21f574d 100644
--- a/drivers/net/wan/lmc/lmc_main.c
+++ b/drivers/net/wan/lmc/lmc_main.c
@@ -1491,7 +1491,6 @@ static int lmc_rx(struct net_device *dev)
     lmc_softc_t *sc = dev_to_sc(dev);
     int i;
     int rx_work_limit = LMC_RXDESCS;
-    unsigned int next_rx;
     int rxIntLoopCnt;		/* debug -baz */
     int localLengthErrCnt = 0;
     long stat;
@@ -1505,7 +1504,6 @@ static int lmc_rx(struct net_device *dev)
     rxIntLoopCnt = 0;		/* debug -baz */
 
     i = sc->lmc_next_rx % LMC_RXDESCS;
-    next_rx = sc->lmc_next_rx;
 
     while (((stat = sc->lmc_rxring[i].status) & LMC_RDES_OWN_BIT) != DESC_OWNED_BY_DC21X4)
     {
-- 
2.17.1

