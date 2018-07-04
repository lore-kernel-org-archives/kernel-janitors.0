From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Jul 2018 07:59:25 +0000
Subject: [PATCH] net: hns3: remove redundant variable 'protocol'
Message-Id: <20180704075925.16163-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable 'protocol' is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'protocol' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
index 7e34d5fff3ae..f73c9dff46ff 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
@@ -885,7 +885,6 @@ static int hns3_fill_desc(struct hns3_enet_ring *ring, void *priv,
 	u16 out_vtag = 0;
 	u32 paylen = 0;
 	u16 mss = 0;
-	__be16 protocol;
 	u8 ol4_proto;
 	u8 il4_proto;
 	int ret;
@@ -914,7 +913,6 @@ static int hns3_fill_desc(struct hns3_enet_ring *ring, void *priv,
 
 		if (skb->ip_summed = CHECKSUM_PARTIAL) {
 			skb_reset_mac_len(skb);
-			protocol = skb->protocol;
 
 			ret = hns3_get_l4_protocol(skb, &ol4_proto, &il4_proto);
 			if (ret)
-- 
2.17.1

