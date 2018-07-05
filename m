From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 05 Jul 2018 08:59:09 +0000
Subject: [PATCH net-next] net: dsa: vsc73xx: Make some functions static
Message-Id: <1530781149-52681-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warnings:

drivers/net/dsa/vitesse-vsc73xx.c:1054:6: warning:
 symbol 'vsc73xx_get_strings' was not declared. Should it be static?
drivers/net/dsa/vitesse-vsc73xx.c:1113:5: warning:
 symbol 'vsc73xx_get_sset_count' was not declared. Should it be static?
drivers/net/dsa/vitesse-vsc73xx.c:1122:6: warning:
 symbol 'vsc73xx_get_ethtool_stats' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/dsa/vitesse-vsc73xx.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/vitesse-vsc73xx.c b/drivers/net/dsa/vitesse-vsc73xx.c
index a4fc260..d4ea5cd 100644
--- a/drivers/net/dsa/vitesse-vsc73xx.c
+++ b/drivers/net/dsa/vitesse-vsc73xx.c
@@ -1051,8 +1051,8 @@ static void vsc73xx_port_disable(struct dsa_switch *ds, int port,
 	return NULL;
 }
 
-void vsc73xx_get_strings(struct dsa_switch *ds, int port, u32 stringset,
-			 uint8_t *data)
+static void vsc73xx_get_strings(struct dsa_switch *ds, int port, u32 stringset,
+				uint8_t *data)
 {
 	const struct vsc73xx_counter *cnt;
 	struct vsc73xx *vsc = ds->priv;
@@ -1110,7 +1110,7 @@ void vsc73xx_get_strings(struct dsa_switch *ds, int port, u32 stringset,
 	}
 }
 
-int vsc73xx_get_sset_count(struct dsa_switch *ds, int port, int sset)
+static int vsc73xx_get_sset_count(struct dsa_switch *ds, int port, int sset)
 {
 	/* We only support SS_STATS */
 	if (sset != ETH_SS_STATS)
@@ -1119,7 +1119,8 @@ int vsc73xx_get_sset_count(struct dsa_switch *ds, int port, int sset)
 	return 8;
 }
 
-void vsc73xx_get_ethtool_stats(struct dsa_switch *ds, int port, uint64_t *data)
+static void vsc73xx_get_ethtool_stats(struct dsa_switch *ds, int port,
+				      uint64_t *data)
 {
 	struct vsc73xx *vsc = ds->priv;
 	u8 regs[] = {

