From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 07 Apr 2020 19:32:33 +0000
Subject: [PATCH] qtnfmac: Simplify code in _attach functions
Message-Id: <20200407193233.9439-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: imitsyanko@quantenna.com, avinashp@quantenna.com, smatyukevich@quantenna.com, kvalo@codeaurora.org, davem@davemloft.net, huangfq.daxian@gmail.com
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is no need to re-implement 'netdev_alloc_skb_ip_align()' here.
Keep the code simple.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c | 2 +-
 drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c b/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c
index dbb241106d8a..eb67b66b846b 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c
@@ -286,7 +286,7 @@ static int pearl_skb2rbd_attach(struct qtnf_pcie_pearl_state *ps, u16 index)
 	struct sk_buff *skb;
 	dma_addr_t paddr;
 
-	skb = __netdev_alloc_skb_ip_align(NULL, SKB_BUF_SIZE, GFP_ATOMIC);
+	skb = netdev_alloc_skb_ip_align(NULL, SKB_BUF_SIZE);
 	if (!skb) {
 		priv->rx_skb[index] = NULL;
 		return -ENOMEM;
diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c b/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c
index dbf3c5fd751f..d1b850aa4657 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c
@@ -247,7 +247,7 @@ topaz_skb2rbd_attach(struct qtnf_pcie_topaz_state *ts, u16 index, u32 wrap)
 	struct sk_buff *skb;
 	dma_addr_t paddr;
 
-	skb = __netdev_alloc_skb_ip_align(NULL, SKB_BUF_SIZE, GFP_ATOMIC);
+	skb = netdev_alloc_skb_ip_align(NULL, SKB_BUF_SIZE);
 	if (!skb) {
 		ts->base.rx_skb[index] = NULL;
 		return -ENOMEM;
-- 
2.20.1
