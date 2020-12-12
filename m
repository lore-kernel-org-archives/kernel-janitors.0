From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 12 Dec 2020 18:20:05 +0000
Subject: [PATCH] net: bcmgenet: Fix a resource leak in an error handling path in the probe functin
Message-Id: <20201212182005.120437-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: opendmb@gmail.com, f.fainelli@gmail.com, davem@davemloft.net, kuba@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If the 'register_netdev()' call fails, we must undo a previous
'bcmgenet_mii_init()' call.

Fixes: 1c1008c793fa ("net: bcmgenet: add main driver file")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
The missing 'bcmgenet_mii_exit()' call is added here, instead of in the
error handling path in order to avoid some goto spaghetti code.
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index be85dad2e3bc..fcca023f22e5 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -4069,8 +4069,10 @@ static int bcmgenet_probe(struct platform_device *pdev)
 	clk_disable_unprepare(priv->clk);
 
 	err = register_netdev(dev);
-	if (err)
+	if (err) {
+		bcmgenet_mii_exit(dev);
 		goto err;
+	}
 
 	return err;
 
-- 
2.27.0
