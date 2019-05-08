From: Colin King <colin.king@canonical.com>
Date: Wed, 08 May 2019 10:22:09 +0000
Subject: [PATCH] net: dsa: lantiq: fix spelling mistake "brigde" -> "bridge"
Message-Id: <20190508102209.6830-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hauke Mehrtens <hauke@hauke-m.de>, andrew@lunn.ch, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are several spelling mistakes in dev_err messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/dsa/lantiq_gswip.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/lantiq_gswip.c b/drivers/net/dsa/lantiq_gswip.c
index 553831df58fe..4e64835deac2 100644
--- a/drivers/net/dsa/lantiq_gswip.c
+++ b/drivers/net/dsa/lantiq_gswip.c
@@ -1235,7 +1235,7 @@ static void gswip_port_fast_age(struct dsa_switch *ds, int port)
 
 		err = gswip_pce_table_entry_read(priv, &mac_bridge);
 		if (err) {
-			dev_err(priv->dev, "failed to read mac brigde: %d\n",
+			dev_err(priv->dev, "failed to read mac bridge: %d\n",
 				err);
 			return;
 		}
@@ -1252,7 +1252,7 @@ static void gswip_port_fast_age(struct dsa_switch *ds, int port)
 		mac_bridge.valid = false;
 		err = gswip_pce_table_entry_write(priv, &mac_bridge);
 		if (err) {
-			dev_err(priv->dev, "failed to write mac brigde: %d\n",
+			dev_err(priv->dev, "failed to write mac bridge: %d\n",
 				err);
 			return;
 		}
@@ -1328,7 +1328,7 @@ static int gswip_port_fdb(struct dsa_switch *ds, int port,
 
 	err = gswip_pce_table_entry_write(priv, &mac_bridge);
 	if (err)
-		dev_err(priv->dev, "failed to write mac brigde: %d\n", err);
+		dev_err(priv->dev, "failed to write mac bridge: %d\n", err);
 
 	return err;
 }
@@ -1360,7 +1360,7 @@ static int gswip_port_fdb_dump(struct dsa_switch *ds, int port,
 
 		err = gswip_pce_table_entry_read(priv, &mac_bridge);
 		if (err) {
-			dev_err(priv->dev, "failed to write mac brigde: %d\n",
+			dev_err(priv->dev, "failed to write mac bridge: %d\n",
 				err);
 			return err;
 		}
-- 
2.20.1
