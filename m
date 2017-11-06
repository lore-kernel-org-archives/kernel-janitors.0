From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 06 Nov 2017 21:53:31 +0000
Subject: [PATCH 3/4] fsl/fman: Add a missing 'of_node_put()' call in an error handling path
Message-Id: <410c7999411773529e5c020bc19c24ae8d78b91c.1510003551.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1510003551.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1510003551.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: madalin.bucur@nxp.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'of_phy_find_device()' fails, we must undo the previous 'of_node_get()'
call, as done the the following error handling code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/freescale/fman/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/freescale/fman/mac.c b/drivers/net/ethernet/freescale/fman/mac.c
index ca12e28129ed..86c1e69f44d6 100644
--- a/drivers/net/ethernet/freescale/fman/mac.c
+++ b/drivers/net/ethernet/freescale/fman/mac.c
@@ -821,6 +821,7 @@ static int mac_probe(struct platform_device *_of_dev)
 		phy = of_phy_find_device(mac_dev->phy_node);
 		if (!phy) {
 			err = -EINVAL;
+			of_node_put(mac_dev->phy_node);
 			goto _return_of_get_parent;
 		}
 
-- 
2.14.1

