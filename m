From: Vladimir Oltean <olteanv@gmail.com>
Date: Wed, 08 May 2019 20:32:25 +0000
Subject: [PATCH] net: dsa: sja1105: Don't return a negative in u8 sja1105_stp_state_get
Message-Id: <20190508203225.13275-1-olteanv@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, dan.carpenter@oracle.com
Cc: f.fainelli@gmail.com, vivien.didelot@gmail.com, andrew@lunn.ch, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>

Dan Carpenter says:

The patch 640f763f98c2: "net: dsa: sja1105: Add support for Spanning
Tree Protocol" from May 5, 2019, leads to the following static
checker warning:

        drivers/net/dsa/sja1105/sja1105_main.c:1073 sja1105_stp_state_get()
        warn: signedness bug returning '(-22)'

The caller doesn't check for negative errors anyway.

Fixes: 640f763f98c2: ("net: dsa: sja1105: Add support for Spanning Tree Protocol")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
 drivers/net/dsa/sja1105/sja1105_main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_main.c b/drivers/net/dsa/sja1105/sja1105_main.c
index 4ccdbc80f7be..46f76b4c5618 100644
--- a/drivers/net/dsa/sja1105/sja1105_main.c
+++ b/drivers/net/dsa/sja1105/sja1105_main.c
@@ -1124,7 +1124,11 @@ static u8 sja1105_stp_state_get(struct sja1105_private *priv, int port)
 		return BR_STATE_LEARNING;
 	if (mac[port].ingress && mac[port].egress && mac[port].dyn_learn)
 		return BR_STATE_FORWARDING;
-	return -EINVAL;
+	/* This is really an error condition if the MAC was in none of the STP
+	 * states above. But treating the port as disabled does nothing, which
+	 * is adequate, and it also resets the MAC to a known state later on.
+	 */
+	return BR_STATE_DISABLED;
 }
 
 /* For situations where we need to change a setting at runtime that is only
-- 
2.17.1
