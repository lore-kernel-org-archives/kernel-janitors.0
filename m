From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 10 May 2017 04:15:03 +0000
Subject: [PATCH] net: dsa: loop: Free resources if initialization is deferred
Message-Id: <20170510041503.29363-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Free some devm'allocated memory in case of deferred driver initialization.
This avoid to waste some memory in such a case.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/dsa/dsa_loop.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/dsa_loop.c b/drivers/net/dsa/dsa_loop.c
index a19e1781e9bb..557afb418320 100644
--- a/drivers/net/dsa/dsa_loop.c
+++ b/drivers/net/dsa/dsa_loop.c
@@ -260,8 +260,11 @@ static int dsa_loop_drv_probe(struct mdio_device *mdiodev)
 		return -ENOMEM;
 
 	ps->netdev = dev_get_by_name(&init_net, pdata->netdev);
-	if (!ps->netdev)
+	if (!ps->netdev) {
+		devm_kfree(&mdiodev->dev, ps);
+		devm_kfree(&mdiodev->dev, ds);
 		return -EPROBE_DEFER;
+	}
 
 	pdata->cd.netdev[DSA_LOOP_CPU_PORT] = &ps->netdev->dev;
 
-- 
2.11.0

