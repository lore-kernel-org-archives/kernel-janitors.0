From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 01 Jan 2018 18:19:07 +0000
Subject: [PATCH] net: hns: Delete an error message for a failed memory allocation in hns_rcb_common_get_cfg()
Message-Id: <9cfe5e9d-e46b-82b8-987a-19c69c60cdb4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, lipeng <lipeng321@huawei.com>, Matthias Brugger <mbrugger@suse.com>, Salil Mehta <salil.mehta@huawei.com>, Timmy Li <lixiaoping3@huawei.com>, Yisen Zhuang <yisen.zhuang@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 Jan 2018 19:11:46 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_rcb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_rcb.c b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_rcb.c
index 6f3570cfb501..cd74f0598dde 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_rcb.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_rcb.c
@@ -767,10 +767,9 @@ int hns_rcb_common_get_cfg(struct dsaf_device *dsaf_dev,
 	rcb_common  		devm_kzalloc(dsaf_dev->dev, sizeof(*rcb_common) +
 			ring_num * sizeof(struct ring_pair_cb), GFP_KERNEL);
-	if (!rcb_common) {
-		dev_err(dsaf_dev->dev, "rcb common devm_kzalloc fail!\n");
+	if (!rcb_common)
 		return -ENOMEM;
-	}
+
 	rcb_common->comm_index = comm_index;
 	rcb_common->ring_num = ring_num;
 	rcb_common->dsaf_dev = dsaf_dev;
-- 
2.15.1

