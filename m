From: Colin King <colin.king@canonical.com>
Date: Wed, 06 Feb 2019 10:25:03 +0000
Subject: [PATCH] net: sxgbe: fix unintended sign extension
Message-Id: <20190206102503.16929-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Byungho An <bh74.an@samsung.com>, Girish K S <ks.giri@samsung.com>, Vipul Pandya <vipul.pandya@samsung.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Shifting a u8 by 24 will cause the value to be promoted to an integer. If
the top bit of the u8 is set then the following conversion to an unsigned
long will sign extend the value causing the upper 32 bits to be set in
the result.

Fix this by casting the u8 value to an unsigned long before the shift.

Detected by CoverityScan, CID#1195586 ("Unintended sign extension")

Fixes: 1edb9ca69e8a ("net: sxgbe: add basic framework for Samsung 10Gb ethernet driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c b/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
index 6d22dd500790..51fe161e5da9 100644
--- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
+++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c
@@ -1822,7 +1822,8 @@ static void sxgbe_set_umac_addr(void __iomem *ioaddr, unsigned char *addr,
 	 * is RO.
 	 */
 	writel(data | SXGBE_HI_REG_AE, ioaddr + SXGBE_ADDR_HIGH(reg_n));
-	data = (addr[3] << 24) | (addr[2] << 16) | (addr[1] << 8) | addr[0];
+	data = ((unsigned long)addr[3] << 24) | (addr[2] << 16) |
+		(addr[1] << 8) | addr[0];
 	writel(data, ioaddr + SXGBE_ADDR_LOW(reg_n));
 }
 
-- 
2.20.1
