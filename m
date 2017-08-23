From: Colin King <colin.king@canonical.com>
Date: Wed, 23 Aug 2017 15:39:36 +0000
Subject: [PATCH][next] net: hinic: fix comparison of a uint16_t type with -1
Message-Id: <20170823153936.22857-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aviad Krawczyk <aviad.krawczyk@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The comparison of hw_ioctxt.rx_buf_sz_idx = -1 is always false because
rx_buf_sz_idx is a uint16_t. Fix this by explicitly casting -1 to uint16_t.

Detected by CoverityScan, CID#1454559 ("Operands don't affect result")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/huawei/hinic/hinic_hw_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/huawei/hinic/hinic_hw_dev.c b/drivers/net/ethernet/huawei/hinic/hinic_hw_dev.c
index 09dec6de8dd5..71e26070fb7f 100644
--- a/drivers/net/ethernet/huawei/hinic/hinic_hw_dev.c
+++ b/drivers/net/ethernet/huawei/hinic/hinic_hw_dev.c
@@ -352,7 +352,7 @@ static int set_hw_ioctxt(struct hinic_hwdev *hwdev, unsigned int rq_depth,
 		}
 	}
 
-	if (hw_ioctxt.rx_buf_sz_idx = -1)
+	if (hw_ioctxt.rx_buf_sz_idx = (uint16_t)-1)
 		return -EINVAL;
 
 	hw_ioctxt.sq_depth  = ilog2(sq_depth);
-- 
2.14.1

