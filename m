From: Colin King <colin.king@canonical.com>
Date: Thu, 20 Dec 2018 14:05:50 +0000
Subject: [PATCH] ray_cs: fix array out-of-bounds access
Message-Id: <20181220140550.18853-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently array element org[3] is being accessed, however the array is
only 3 elements in size, so this looks like an off-by-one out-of-bounds
error. Fix this by using org[2], which I believe was the original
intent.

This issue has existed in the driver back in the pre-git days, so no
idea when it was introduced.

Detected by CoverityScan, CID#711344 ("Out-of-bounds read")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/ray_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ray_cs.c b/drivers/net/wireless/ray_cs.c
index 33ad87528d9a..8b2741c8edf2 100644
--- a/drivers/net/wireless/ray_cs.c
+++ b/drivers/net/wireless/ray_cs.c
@@ -959,7 +959,7 @@ static int translate_frame(ray_dev_t *local, struct tx_msg __iomem *ptx,
 		if (proto = htons(ETH_P_AARP) || proto = htons(ETH_P_IPX)) {
 			/* This is the selective translation table, only 2 entries */
 			writeb(0xf8,
-			       &((struct snaphdr_t __iomem *)ptx->var)->org[3]);
+			       &((struct snaphdr_t __iomem *)ptx->var)->org[2]);
 		}
 		/* Copy body of ethernet packet without ethernet header */
 		memcpy_toio((void __iomem *)&ptx->var +
-- 
2.19.1
