From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Jul 2020 12:39:14 +0000
Subject: [PATCH] media: mtk-mdp: Fix a refcounting bug on error in init
Message-Id: <20200722123914.GB220681@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
Cc: Houlong Wei <houlong.wei@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org

We need to call of_node_put(comp->dev_node); on the error paths in this
function.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 362fff924aef..478ad034ef2a 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -57,6 +57,7 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 {
 	struct device_node *larb_node;
 	struct platform_device *larb_pdev;
+	int ret;
 	int i;
 
 	comp->dev_node = of_node_get(node);
@@ -67,8 +68,8 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 		if (IS_ERR(comp->clk[i])) {
 			if (PTR_ERR(comp->clk[i]) != -EPROBE_DEFER)
 				dev_err(dev, "Failed to get clock\n");
-
-			return PTR_ERR(comp->clk[i]);
+			ret = PTR_ERR(comp->clk[i]);
+			goto put_dev;
 		}
 
 		/* Only RDMA needs two clocks */
@@ -87,20 +88,27 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 	if (!larb_node) {
 		dev_err(dev,
 			"Missing mediadek,larb phandle in %pOF node\n", node);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_dev;
 	}
 
 	larb_pdev = of_find_device_by_node(larb_node);
 	if (!larb_pdev) {
 		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
 		of_node_put(larb_node);
-		return -EPROBE_DEFER;
+		ret = -EPROBE_DEFER;
+		goto put_dev;
 	}
 	of_node_put(larb_node);
 
 	comp->larb_dev = &larb_pdev->dev;
 
 	return 0;
+
+put_dev:
+	of_node_put(comp->dev_node);
+
+	return ret;
 }
 
 void mtk_mdp_comp_deinit(struct device *dev, struct mtk_mdp_comp *comp)
-- 
2.27.0
