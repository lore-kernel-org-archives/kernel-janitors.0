From: Colin King <colin.king@canonical.com>
Date: Fri, 01 May 2020 14:10:16 +0000
Subject: [PATCH] net: stmmac: gmac5+: fix potential integer overflow on 32 bit multiply
Message-Id: <20200501141016.290699-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The multiplication of cfg->ctr[1] by 1000000000 is performed using a
32 bit multiplication (since cfg->ctr[1] is a u32) and this can lead
to a potential overflow. Fix this by making the constant a ULL to
ensure a 64 bit multiply occurs.

Fixes: 504723af0d85 ("net: stmmac: Add basic EST support for GMAC5+")
Addresses-Coverity: ("Unintentional integer overflow")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index 494c859b4ade..67ba67ed0cb9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -624,7 +624,7 @@ int dwmac5_est_configure(void __iomem *ioaddr, struct stmmac_est *cfg,
 		total_offset += offset;
 	}
 
-	total_ctr = cfg->ctr[0] + cfg->ctr[1] * 1000000000;
+	total_ctr = cfg->ctr[0] + cfg->ctr[1] * 1000000000ULL;
 	total_ctr += total_offset;
 
 	ctr_low = do_div(total_ctr, 1000000000);
-- 
2.25.1
