From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 27 Apr 2020 10:43:22 +0000
Subject: [PATCH net-next] dpaa2-eth: fix error return code in setup_dpni()
Message-Id: <20200427104322.11214-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ioana Ciornei <ioana.ciornei@nxp.com>, Ioana Radulescu <ruxandra.radulescu@nxp.com>, Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org

Fix to return negative error code -ENOMEM from the error handling
case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
index 8ec435ba7d27..11accab81ea1 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
@@ -2702,8 +2702,10 @@ static int setup_dpni(struct fsl_mc_device *ls_dev)
 
 	priv->cls_rules = devm_kzalloc(dev, sizeof(struct dpaa2_eth_cls_rule) *
 				       dpaa2_eth_fs_count(priv), GFP_KERNEL);
-	if (!priv->cls_rules)
+	if (!priv->cls_rules) {
+		err = -ENOMEM;
 		goto close;
+	}
 
 	return 0;
