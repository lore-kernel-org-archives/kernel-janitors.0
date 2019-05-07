From: Colin King <colin.king@canonical.com>
Date: Tue, 07 May 2019 08:44:58 +0000
Subject: [PATCH][next] net: dsa: sja1105: fix comparisons against uninitialized status fields
Message-Id: <20190507084458.22520-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to sja1105_status_get to set various fields in the status
structure can potentially be skipped in a while-loop because of a couple
of prior continuation jump paths. This can potientially lead to checking
be checking against an uninitialized fields in the structure which may
lead to unexpected results.  Fix this by ensuring all the fields in status
are initialized to zero to be safe.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 8aa9ebccae87 ("net: dsa: Introduce driver for NXP SJA1105 5-port L2 switch")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/dsa/sja1105/sja1105_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_spi.c b/drivers/net/dsa/sja1105/sja1105_spi.c
index 244a94ccfc18..76f6a51e10d9 100644
--- a/drivers/net/dsa/sja1105/sja1105_spi.c
+++ b/drivers/net/dsa/sja1105/sja1105_spi.c
@@ -394,7 +394,7 @@ int sja1105_static_config_upload(struct sja1105_private *priv)
 	struct sja1105_static_config *config = &priv->static_config;
 	const struct sja1105_regs *regs = priv->info->regs;
 	struct device *dev = &priv->spidev->dev;
-	struct sja1105_status status;
+	struct sja1105_status status = {};
 	int rc, retries = RETRIES;
 	u8 *config_buf;
 	int buf_len;
-- 
2.20.1
