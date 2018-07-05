From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Jul 2018 08:30:04 +0000
Subject: [PATCH][next] net: dsa: fix spelling mistake "waitting" -> "waiting"
Message-Id: <20180705083004.13735-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err error message.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/dsa/vitesse-vsc73xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/vitesse-vsc73xx.c b/drivers/net/dsa/vitesse-vsc73xx.c
index a4fc260006de..3bbd86084119 100644
--- a/drivers/net/dsa/vitesse-vsc73xx.c
+++ b/drivers/net/dsa/vitesse-vsc73xx.c
@@ -930,7 +930,7 @@ static void vsc73xx_adjust_link(struct dsa_switch *ds, int port,
 				     VSC73XX_ARBEMPTY, &val);
 			if (--maxloop = 0) {
 				dev_err(vsc->dev,
-					"timeout waitting for block arbiter\n");
+					"timeout waiting for block arbiter\n");
 				/* Continue anyway */
 				break;
 			}
-- 
2.17.1

