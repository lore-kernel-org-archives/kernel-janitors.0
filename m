From: Colin King <colin.king@canonical.com>
Date: Wed, 10 Feb 2021 15:26:44 +0000
Subject: [PATCH][next] net: hns3: Fix uninitialized return from function
Message-Id: <20210210152644.137770-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Huazhong Tan <tanhuazhong@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently function hns3_reset_notify_uninit_enet is returning
the contents of the uninitialized variable ret.  Fix this by
removing ret (since it is no longer used) and replace it with
a return of the literal value 0.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 64749c9c38a9 ("net: hns3: remove redundant return value of hns3_uninit_all_ring()")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
index 9565b7999426..bf4302a5cf95 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
@@ -4640,7 +4640,6 @@ static int hns3_reset_notify_uninit_enet(struct hnae3_handle *handle)
 {
 	struct net_device *netdev = handle->kinfo.netdev;
 	struct hns3_nic_priv *priv = netdev_priv(netdev);
-	int ret;
 
 	if (!test_and_clear_bit(HNS3_NIC_STATE_INITED, &priv->state)) {
 		netdev_warn(netdev, "already uninitialized\n");
@@ -4662,7 +4661,7 @@ static int hns3_reset_notify_uninit_enet(struct hnae3_handle *handle)
 
 	hns3_put_ring_config(priv);
 
-	return ret;
+	return 0;
 }
 
 static int hns3_reset_notify(struct hnae3_handle *handle,
-- 
2.30.0
