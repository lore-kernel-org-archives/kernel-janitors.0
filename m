From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Sep 2019 11:37:34 +0000
Subject: [PATCH] net: lmc: fix spelling mistake "runnin" -> "running"
Message-Id: <20190911113734.26185-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the lmc_trace message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wan/lmc/lmc_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wan/lmc/lmc_main.c b/drivers/net/wan/lmc/lmc_main.c
index d74349628db2..0e6a51525d91 100644
--- a/drivers/net/wan/lmc/lmc_main.c
+++ b/drivers/net/wan/lmc/lmc_main.c
@@ -1115,7 +1115,7 @@ static void lmc_running_reset (struct net_device *dev) /*fold00*/
     sc->lmc_cmdmode |= (TULIP_CMD_TXRUN | TULIP_CMD_RXRUN);
     LMC_CSR_WRITE (sc, csr_command, sc->lmc_cmdmode);
 
-    lmc_trace(dev, "lmc_runnin_reset_out");
+    lmc_trace(dev, "lmc_running_reset_out");
 }
 
 
-- 
2.20.1
