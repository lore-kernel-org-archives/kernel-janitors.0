From: Colin King <colin.king@canonical.com>
Date: Tue, 12 Nov 2019 13:05:23 +0000
Subject: [PATCH][next] net: dsa: mv88e6xxx: fix broken if statement because of a stray semicolon
Message-Id: <20191112130523.232461-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Iwan R Timmer <irtimmer@gmail.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a stray semicolon in an if statement that will cause a dev_err
message to be printed unconditionally. Fix this by removing the stray
semicolon.

Addresses-Coverity: ("Stay semicolon")
Fixes: f0942e00a1ab ("net: dsa: mv88e6xxx: Add support for port mirroring")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/dsa/mv88e6xxx/chip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index e8bf6ac1e0f4..3bd988529178 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -5317,7 +5317,7 @@ static void mv88e6xxx_port_mirror_del(struct dsa_switch *ds, int port,
 		if (chip->info->ops->set_egress_port(chip,
 						     direction,
 						     dsa_upstream_port(ds,
-								       port)));
+								       port)))
 			dev_err(ds->dev, "failed to set egress port\n");
 	}
 
-- 
2.20.1
