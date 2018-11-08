From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 08 Nov 2018 02:08:43 +0000
Subject: [PATCH net-next] net: bcmgenet: return correct value 'ret' from bcmgenet_power_down
Message-Id: <1541642923-81463-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Berger <opendmb@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, davem@davemloft.net
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/broadcom/genet/bcmgenet.c: In function 'bcmgenet_power_down':
drivers/net/ethernet/broadcom/genet/bcmgenet.c:1136:6: warning:
 variable 'ret' set but not used [-Wunused-but-set-variable]

bcmgenet_power_down should return 'ret' instead of 0.

Fixes: ca8cf341903f ("net: bcmgenet: propagate errors from bcmgenet_power_down")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 2d6f090..bf88749 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -1169,7 +1169,7 @@ static int bcmgenet_power_down(struct bcmgenet_priv *priv,
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static void bcmgenet_power_up(struct bcmgenet_priv *priv,
