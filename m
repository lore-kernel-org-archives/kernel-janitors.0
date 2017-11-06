From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 06 Nov 2017 21:53:32 +0000
Subject: [PATCH 4/4] fsl/fman: Remove a useless 'dev_err()' call
Message-Id: <a96033164bfced51ea1c13a37bd314f49f0def86.1510003551.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1510003551.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1510003551.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: madalin.bucur@nxp.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Memory allocation functions already display some informaton in case of
memory allocation failure. There is no need to add an extra 'dev_err' here.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/freescale/fman/mac.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fman/mac.c b/drivers/net/ethernet/freescale/fman/mac.c
index 86c1e69f44d6..88c0a0636b44 100644
--- a/drivers/net/ethernet/freescale/fman/mac.c
+++ b/drivers/net/ethernet/freescale/fman/mac.c
@@ -615,7 +615,6 @@ static int mac_probe(struct platform_device *_of_dev)
 	mac_dev = devm_kzalloc(dev, sizeof(*mac_dev), GFP_KERNEL);
 	if (!mac_dev) {
 		err = -ENOMEM;
-		dev_err(dev, "devm_kzalloc() = %d\n", err);
 		goto _return;
 	}
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-- 
2.14.1

