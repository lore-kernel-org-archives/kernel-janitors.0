From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 23 May 2018 19:07:13 +0000
Subject: [PATCH 2/5] phy: add missing of_node_put
Message-Id: <1527102436-13447-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1527102436-13447-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1527102436-13447-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The device node iterators perform an of_node_get on each iteration, so a
jump out of the loop requires an of_node_put.

The semantic patch that fixes this problem in the break case is as follows
(http://coccinelle.lip6.fr):

// <smpl>
@@
expression root,e;
local idexpression child;
iterator name for_each_child_of_node;
@@

 for_each_child_of_node(root, child) {
   ... when != of_node_put(child)
       when != e = child
+  of_node_put(child);
?  break;
   ...
}
... when != child
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/phy/hisilicon/phy-hisi-inno-usb2.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/hisilicon/phy-hisi-inno-usb2.c b/drivers/phy/hisilicon/phy-hisi-inno-usb2.c
index 5243812..0da14b6 100644
--- a/drivers/phy/hisilicon/phy-hisi-inno-usb2.c
+++ b/drivers/phy/hisilicon/phy-hisi-inno-usb2.c
@@ -154,14 +154,18 @@ static int hisi_inno_phy_probe(struct platform_device *pdev)
 		struct phy *phy;
 
 		rst = of_reset_control_get_exclusive(child, NULL);
-		if (IS_ERR(rst))
+		if (IS_ERR(rst)) {
+			of_node_put(child);
 			return PTR_ERR(rst);
+		}
 		priv->ports[i].utmi_rst = rst;
 		priv->ports[i].priv = priv;
 
 		phy = devm_phy_create(dev, child, &hisi_inno_phy_ops);
-		if (IS_ERR(phy))
+		if (IS_ERR(phy)) {
+			of_node_put(child);
 			return PTR_ERR(phy);
+		}
 
 		phy_set_bus_width(phy, 8);
 		phy_set_drvdata(phy, &priv->ports[i]);
@@ -169,6 +173,7 @@ static int hisi_inno_phy_probe(struct platform_device *pdev)
 
 		if (i > INNO_PHY_PORT_NUM) {
 			dev_warn(dev, "Support %d ports in maximum\n", i);
+			of_node_put(child);
 			break;
 		}
 	}

