From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Mar 2019 08:12:34 +0000
Subject: [PATCH net] net: hns3: Fix a logical vs bitwise typo
Message-Id: <20190306081234.GC2625@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Yunsheng Lin <linyunsheng@huawei.com>
Cc: Salil Mehta <salil.mehta@huawei.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There were a couple logical ORs accidentally mixed in with the bitwise
ORs.

Fixes: e8149933b1fa ("net: hns3: remove hnae3_get_bit in data path")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Very recent bug.

 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
index 3cb43b1f1c2e..1e4efc47c7a5 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
@@ -2321,8 +2321,8 @@ static void hns3_rx_checksum(struct hns3_enet_ring *ring, struct sk_buff *skb,
 	if (!(bd_base_info & BIT(HNS3_RXD_L3L4P_B)))
 		return;
 
-	if (unlikely(l234info & (BIT(HNS3_RXD_L3E_B) | BIT(HNS3_RXD_L4E_B) ||
-				 BIT(HNS3_RXD_OL3E_B) ||
+	if (unlikely(l234info & (BIT(HNS3_RXD_L3E_B) | BIT(HNS3_RXD_L4E_B) |
+				 BIT(HNS3_RXD_OL3E_B) |
 				 BIT(HNS3_RXD_OL4E_B)))) {
 		u64_stats_update_begin(&ring->syncp);
 		ring->stats.l3l4_csum_err++;
-- 
2.17.1
