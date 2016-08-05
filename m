From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 05 Aug 2016 08:56:47 +0000
Subject: [PATCH 07/11] phy: qcom-ufs: use of_property_read_bool
Message-Id: <1470387411-15879-8-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr>
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
expression e1,e2;
statement S2,S1;
@@
-       if (of_get_property(e1,e2,NULL))
+       if (of_property_read_bool(e1,e2))
        S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/phy/phy-qcom-ufs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-qcom-ufs.c b/drivers/phy/phy-qcom-ufs.c
index 107cb57..8eaf60a 100644
--- a/drivers/phy/phy-qcom-ufs.c
+++ b/drivers/phy/phy-qcom-ufs.c
@@ -283,7 +283,7 @@ static int __ufs_qcom_phy_init_vreg(struct phy *phy,
 			err = 0;
 		}
 		snprintf(prop_name, MAX_PROP_NAME, "%s-always-on", name);
-		if (of_get_property(dev->of_node, prop_name, NULL))
+		if (of_property_read_bool(dev->of_node, prop_name))
 			vreg->is_always_on = true;
 		else
 			vreg->is_always_on = false;

