From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 06 Nov 2019 14:59:21 +0000
Subject: [PATCH net-next] net: aquantia: fix return value check in aq_ptp_init()
Message-Id: <20191106145921.124814-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Egor Pomozov <epomozov@marvell.com>, Igor Russkikh <igor.russkikh@aquantia.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Function ptp_clock_register() returns ERR_PTR() and never returns
NULL. The NULL test should be removed.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/aquantia/atlantic/aq_ptp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
index 3ec08415e53e..252a80b6d3b6 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
@@ -1205,7 +1205,7 @@ int aq_ptp_init(struct aq_nic_s *aq_nic, unsigned int idx_vec)
 	aq_ptp->ptp_info = aq_ptp_clock;
 	aq_ptp_gpio_init(&aq_ptp->ptp_info, &mbox.info);
 	clock = ptp_clock_register(&aq_ptp->ptp_info, &aq_nic->ndev->dev);
-	if (!clock || IS_ERR(clock)) {
+	if (IS_ERR(clock)) {
 		netdev_err(aq_nic->ndev, "ptp_clock_register failed\n");
 		err = PTR_ERR(clock);
 		goto err_exit;
