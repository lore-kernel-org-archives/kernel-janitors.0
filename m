From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Aug 2018 09:06:43 +0000
Subject: [PATCH net-next] net: dsa: mv88e6xxx: bitwise vs logical bug
Message-Id: <20180814090643.ilis47jhsaa2sbhi@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We are trying to test if these flags are set but there are some && vs &
typos.

Fixes: efd1ba6af93f ("net: dsa: mv88e6xxx: Add SERDES phydev_mac_change up for 6390")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/dsa/mv88e6xxx/serdes.c b/drivers/net/dsa/mv88e6xxx/serdes.c
index f007d109b385..e82983975754 100644
--- a/drivers/net/dsa/mv88e6xxx/serdes.c
+++ b/drivers/net/dsa/mv88e6xxx/serdes.c
@@ -502,8 +502,8 @@ static irqreturn_t mv88e6390_serdes_thread_fn(int irq, void *dev_id)
 		err = mv88e6390_serdes_irq_status_sgmii(chip, lane, &status);
 		if (err)
 			goto out;
-		if (status && (MV88E6390_SGMII_INT_LINK_DOWN ||
-			       MV88E6390_SGMII_INT_LINK_UP)) {
+		if (status & (MV88E6390_SGMII_INT_LINK_DOWN |
+			      MV88E6390_SGMII_INT_LINK_UP)) {
 			ret = IRQ_HANDLED;
 			mv88e6390_serdes_irq_link_sgmii(chip, port->port, lane);
 		}
