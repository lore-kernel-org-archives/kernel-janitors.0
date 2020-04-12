From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 12 Apr 2020 21:20:34 +0000
Subject: [PATCH] net: mvneta: Fix a typo
Message-Id: <20200412212034.4532-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: thomas.petazzoni@bootlin.com, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

s/mvmeta/mvneta/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/marvell/mvneta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index 5be61f73b6ab..51889770958d 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -5383,7 +5383,7 @@ static int __init mvneta_driver_init(void)
 {
 	int ret;
 
-	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "net/mvmeta:online",
+	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "net/mvneta:online",
 				      mvneta_cpu_online,
 				      mvneta_cpu_down_prepare);
 	if (ret < 0)
-- 
2.20.1
