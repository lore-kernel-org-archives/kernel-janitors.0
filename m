From: Colin King <colin.king@canonical.com>
Date: Tue, 03 Oct 2017 10:46:33 +0000
Subject: [PATCH] net: dsa: mt7530: make functions mt7530_phy_write static
Message-Id: <20171003104633.27151-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function mt7530_phy_write is local to the source and does not need to
be in global scope, so make it static.

Cleans up sparse warnings:
symbol 'mt7530_phy_write' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/dsa/mt7530.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index faa3b88d2206..034241696ce2 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -564,7 +564,8 @@ static int mt7530_phy_read(struct dsa_switch *ds, int port, int regnum)
 	return mdiobus_read_nested(priv->bus, port, regnum);
 }
 
-int mt7530_phy_write(struct dsa_switch *ds, int port, int regnum, u16 val)
+static int mt7530_phy_write(struct dsa_switch *ds, int port, int regnum,
+			    u16 val)
 {
 	struct mt7530_priv *priv = ds->priv;
 
-- 
2.14.1

