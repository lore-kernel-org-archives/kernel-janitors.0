From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 01 Apr 2014 13:39:00 +0000
Subject: [patch 2/3] net: sxgbe: fix logical vs bitwise operation
Message-Id: <20140401133900.GB11536@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Byungho An <bh74.an@samsung.com>
Cc: Girish K S <ks.giri@samsung.com>, Siva Reddy Kallam <siva.kallam@samsung.com>, Vipul Pandya <vipul.pandya@samsung.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Bitwise '|' was intended here instead of logical '||'.

Fixes: 1edb9ca69e8a ('net: sxgbe: add basic framework for Samsung 10Gb ethernet driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/samsung/sxgbe/sxgbe_core.c b/drivers/net/ethernet/samsung/sxgbe/sxgbe_core.c
index 66d4a74..2e11da0 100644
--- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_core.c
+++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_core.c
@@ -93,9 +93,9 @@ static void sxgbe_core_set_umac_addr(void __iomem *ioaddr, unsigned char *addr,
 {
 	u32 high_word, low_word;
 
-	high_word = (addr[5] << 8) || (addr[4]);
-	low_word = ((addr[3] << 24) || (addr[2] << 16) ||
-		    (addr[1] << 8) || (addr[0]));
+	high_word = (addr[5] << 8) | (addr[4]);
+	low_word = (addr[3] << 24) | (addr[2] << 16) |
+		   (addr[1] << 8) | (addr[0]);
 	writel(high_word, ioaddr + SXGBE_CORE_ADD_HIGHOFFSET(reg_n));
 	writel(low_word, ioaddr + SXGBE_CORE_ADD_LOWOFFSET(reg_n));
 }
