From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 20 Sep 2018 02:41:30 +0000
Subject: [PATCH net-next] atl1: remove set but not used variable 'advertising'
Message-Id: <1537411290-5132-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>, "David S. Miller" <davem@davemloft.net>, Kees Cook <keescook@chromium.org>, zhong jiang <zhongjiang@huawei.com>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/atheros/atlx/atl1.c: In function 'atl1_set_link_ksettings':
drivers/net/ethernet/atheros/atlx/atl1.c:3280:6: warning:
 variable 'advertising' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/atheros/atlx/atl1.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/net/ethernet/atheros/atlx/atl1.c
index 72e7fa7..63edc57 100644
--- a/drivers/net/ethernet/atheros/atlx/atl1.c
+++ b/drivers/net/ethernet/atheros/atlx/atl1.c
@@ -3277,7 +3277,6 @@ static int atl1_set_link_ksettings(struct net_device *netdev,
 	u16 phy_data;
 	int ret_val = 0;
 	u16 old_media_type = hw->media_type;
-	u32 advertising;
 
 	if (netif_running(adapter->netdev)) {
 		if (netif_msg_link(adapter))
@@ -3311,25 +3310,7 @@ static int atl1_set_link_ksettings(struct net_device *netdev,
 				hw->media_type = MEDIA_TYPE_10M_HALF;
 		}
 	}
-	switch (hw->media_type) {
-	case MEDIA_TYPE_AUTO_SENSOR:
-		advertising -		    ADVERTISED_10baseT_Half |
-		    ADVERTISED_10baseT_Full |
-		    ADVERTISED_100baseT_Half |
-		    ADVERTISED_100baseT_Full |
-		    ADVERTISED_1000baseT_Full |
-		    ADVERTISED_Autoneg | ADVERTISED_TP;
-		break;
-	case MEDIA_TYPE_1000M_FULL:
-		advertising -		    ADVERTISED_1000baseT_Full |
-		    ADVERTISED_Autoneg | ADVERTISED_TP;
-		break;
-	default:
-		advertising = 0;
-		break;
-	}
+
 	if (atl1_phy_setup_autoneg_adv(hw)) {
 		ret_val = -EINVAL;
 		if (netif_msg_link(adapter))
