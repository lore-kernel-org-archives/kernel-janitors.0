From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 06 Nov 2017 21:53:30 +0000
Subject: [PATCH 2/4] fsl/fman: Remove some useless code
Message-Id: <54631ca4ec7d1bdb02f98851adac81fc548240e0.1510003551.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1510003551.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1510003551.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: madalin.bucur@nxp.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is no need to release explicitly some devm_ allocated resources.
If the 'mac_probe()' probe function fails, they will be released
automatically, as already done in the other error handling paths of
this function.

Also goto '_return_of_get_parent' as in the other error handling paths.
This is useless (priv->fixed_link is NULL at this point), but at least
it is consistent.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/freescale/fman/mac.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fman/mac.c b/drivers/net/ethernet/freescale/fman/mac.c
index c27667a005f7..ca12e28129ed 100644
--- a/drivers/net/ethernet/freescale/fman/mac.c
+++ b/drivers/net/ethernet/freescale/fman/mac.c
@@ -709,11 +709,8 @@ static int mac_probe(struct platform_device *_of_dev)
 	}
 
 	if (!of_device_is_available(mac_node)) {
-		devm_iounmap(dev, priv->vaddr);
-		__devm_release_region(dev, fman_get_mem_region(priv->fman),
-				      res.start, res.end + 1 - res.start);
-		devm_kfree(dev, mac_dev);
-		return -ENODEV;
+		err = -ENODEV;
+		goto _return_of_get_parent;
 	}
 
 	/* Get the cell-index */
-- 
2.14.1

