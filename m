From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 07 Jun 2018 01:47:41 +0000
Subject: [PATCH -next] IB/mlx5: Fix return value check in flow_counters_set_data()
Message-Id: <1528336061-13069-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In case of error, the function mlx5_fc_create() returns ERR_PTR() and
never returns NULL. The NULL test in the return value check should be
replaced with IS_ERR().

Fixes: 3b3233fbf02e ("IB/mlx5: Add flow counters binding support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/infiniband/hw/mlx5/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/main.c b/drivers/infiniband/hw/mlx5/main.c
index e52dd21..f486e92 100644
--- a/drivers/infiniband/hw/mlx5/main.c
+++ b/drivers/infiniband/hw/mlx5/main.c
@@ -3199,8 +3199,8 @@ static int flow_counters_set_data(struct ib_counters *ibcounters,
 	if (!mcounters->hw_cntrs_hndl) {
 		mcounters->hw_cntrs_hndl = mlx5_fc_create(
 			to_mdev(ibcounters->device)->mdev, false);
-		if (!mcounters->hw_cntrs_hndl) {
-			ret = -ENOMEM;
+		if (IS_ERR(mcounters->hw_cntrs_hndl)) {
+			ret = PTR_ERR(mcounters->hw_cntrs_hndl);
 			goto free;
 		}
 		hw_hndl = true;

