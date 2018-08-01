From: Colin King <colin.king@canonical.com>
Date: Wed, 01 Aug 2018 16:39:47 +0000
Subject: [PATCH] qede: fix null pointer dereference on skb on allocation failure
Message-Id: <20180801163947.22743-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

If skb fails to be allocated with the call to build_skb then a
null pointer dereference will occur on the call to skb_reserve.
Fix this by checking for a null skb and returning NULL.

Detected by CoverityScan, CID#1469485 ("Dereference null return value")

Fixes: 8a8633978b84 ("qede: Add build_skb() support.")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qede/qede_fp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/qlogic/qede/qede_fp.c b/drivers/net/ethernet/qlogic/qede/qede_fp.c
index 6c702399b801..4b912ff5c0f3 100644
--- a/drivers/net/ethernet/qlogic/qede/qede_fp.c
+++ b/drivers/net/ethernet/qlogic/qede/qede_fp.c
@@ -730,6 +730,8 @@ qede_build_skb(struct qede_rx_queue *rxq,
 
 	buf = page_address(bd->data) + bd->page_offset;
 	skb = build_skb(buf, rxq->rx_buf_seg_size);
+	if (!skb)
+		return NULL;
 
 	skb_reserve(skb, pad);
 	skb_put(skb, len);
-- 
2.17.1

