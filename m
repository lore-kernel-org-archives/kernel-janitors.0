From: Colin King <colin.king@canonical.com>
Date: Tue, 07 May 2019 10:34:34 +0000
Subject: [PATCH][next] net: dsa: sja1105: fix check on while loop exit
Message-Id: <20190507103434.16174-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190507095033.25396-1-colin.king@canonical.com>
In-Reply-To: <20190507095033.25396-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The while-loop exit condition check is not correct; the
loop should continue if the returns from the function calls are
negative or the CRC status returns are invalid.  Currently it
is ignoring the returns from the function calls.  Fix this by
removing the status return checks and only break from the loop
at the very end when we know that all the success condtions have
been met.

Kudos to Dan Carpenter for describing the correct fix.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 8aa9ebccae87 ("net: dsa: Introduce driver for NXP SJA1105 5-port L2 switch")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: Discard my broken origina fix. Use correct fix as described by
    Dan Carpenter.
---
 drivers/net/dsa/sja1105/sja1105_spi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_spi.c b/drivers/net/dsa/sja1105/sja1105_spi.c
index 244a94ccfc18..40ac696adf63 100644
--- a/drivers/net/dsa/sja1105/sja1105_spi.c
+++ b/drivers/net/dsa/sja1105/sja1105_spi.c
@@ -465,9 +465,11 @@ int sja1105_static_config_upload(struct sja1105_private *priv)
 			dev_err(dev, "Switch reported that configuration is "
 				"invalid, retrying...\n");
 			continue;
+
 		}
-	} while (--retries && (status.crcchkl = 1 || status.crcchkg = 1 ||
-		 status.configs = 0 || status.ids = 1));
+		/* Success! */
+		break;
+	} while (--retries);
 
 	if (!retries) {
 		rc = -EIO;
-- 
2.20.1
