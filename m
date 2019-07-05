From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 05 Jul 2019 01:16:42 +0000
Subject: [PATCH net-next] gve: Fix error return code in gve_alloc_qpls()
Message-Id: <20190705011642.156707-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Catherine Sullivan <csully@google.com>, Sagi Shahar <sagis@google.com>, Jon Olson <jonolson@google.com>, Colin Ian King <colin.king@canonical.com>, Willem de Bruijn <willemb@google.com>, Luigi Rizzo <lrizzo@google.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: f5cedc84a30d ("gve: Add transmit and receive support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/google/gve/gve_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index eef500bd2ff7..b65f6b010a82 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -625,8 +625,10 @@ static int gve_alloc_qpls(struct gve_priv *priv)
 				     sizeof(unsigned long) * BITS_PER_BYTE;
 	priv->qpl_cfg.qpl_id_map = kvzalloc(BITS_TO_LONGS(num_qpls) *
 					    sizeof(unsigned long), GFP_KERNEL);
-	if (!priv->qpl_cfg.qpl_id_map)
+	if (!priv->qpl_cfg.qpl_id_map) {
+		err = -ENOMEM;
 		goto free_qpls;
+	}
 
 	return 0;
