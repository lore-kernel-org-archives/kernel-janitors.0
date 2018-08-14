From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Aug 2018 09:09:05 +0000
Subject: [PATCH net-next] net: dsa: mv88e6xxx: missing unlock on error path
Message-Id: <20180814090905.rm6i665c5utl7d32@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We added a new error path, but we need to drop the lock before we return.

Fixes: 2d2e1dd29962 ("net: dsa: mv88e6xxx: Cache the port cmode")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 17752316ab10..8da3d39e3218 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -2408,7 +2408,7 @@ static int mv88e6xxx_setup(struct dsa_switch *ds)
 		if (chip->info->ops->port_get_cmode) {
 			err = chip->info->ops->port_get_cmode(chip, i, &cmode);
 			if (err)
-				return err;
+				goto unlock;
 
 			chip->ports[i].cmode = cmode;
 		}
