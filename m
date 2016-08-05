From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 05 Aug 2016 11:25:13 +0000
Subject: [PATCH 07/11 v2] phy: qcom-ufs: use of_property_read_bool
Message-Id: <alpine.DEB.2.10.1608051324260.2999@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr> <1470387411-15879-8-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1470387411-15879-8-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Use of_property_read_bool to check for the existence of a property.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e1,e2,x;
@@
-	if (of_get_property(e1,e2,NULL))
-		x = true;
-	else
-		x = false;
+	x = of_property_read_bool(e1,e2);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
v2: special case for propagating true and false

 drivers/phy/phy-qcom-ufs.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/phy-qcom-ufs.c b/drivers/phy/phy-qcom-ufs.c
index 107cb57..18a5b49 100644
--- a/drivers/phy/phy-qcom-ufs.c
+++ b/drivers/phy/phy-qcom-ufs.c
@@ -283,10 +283,8 @@ static int __ufs_qcom_phy_init_vreg(struct phy *phy,
 			err = 0;
 		}
 		snprintf(prop_name, MAX_PROP_NAME, "%s-always-on", name);
-		if (of_get_property(dev->of_node, prop_name, NULL))
-			vreg->is_always_on = true;
-		else
-			vreg->is_always_on = false;
+		vreg->is_always_on = of_property_read_bool(dev->of_node,
+							   prop_name);
 	}

 	if (!strcmp(name, "vdda-pll")) {

