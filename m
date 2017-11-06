From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 06 Nov 2017 21:53:29 +0000
Subject: [PATCH 1/4] fsl/fman: Remove a useless call to 'dev_set_drvdata()'
Message-Id: <eb2c7fea4ceaba4344b33d93493be98e1dc5dcf0.1510003551.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1510003551.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1510003551.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: madalin.bucur@nxp.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Commit c6e26ea8c893 ("dpaa_eth: change device used") has removed usage of
'dev_set_drvdata()' in the 'mac_probe() function.

This call should also be axed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/freescale/fman/mac.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fman/mac.c b/drivers/net/ethernet/freescale/fman/mac.c
index 1d6da1ea7bfb..c27667a005f7 100644
--- a/drivers/net/ethernet/freescale/fman/mac.c
+++ b/drivers/net/ethernet/freescale/fman/mac.c
@@ -713,7 +713,6 @@ static int mac_probe(struct platform_device *_of_dev)
 		__devm_release_region(dev, fman_get_mem_region(priv->fman),
 				      res.start, res.end + 1 - res.start);
 		devm_kfree(dev, mac_dev);
-		dev_set_drvdata(dev, NULL);
 		return -ENODEV;
 	}
 
-- 
2.14.1

