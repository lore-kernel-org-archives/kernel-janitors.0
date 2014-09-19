From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Sep 2014 10:40:25 +0000
Subject: [patch -next] r8169: fix an if condition
Message-Id: <20140919104025.GA26391@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Realtek linux nic maintainers <nic_swsd@realtek.com>, hayeswang <hayeswang@realtek.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There is an extra semi-colon so __rtl8169_set_features() is called every
time.

Fixes: 929a031dfd62 ('r8169: adjust __rtl8169_set_features')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/realtek/r8169.c b/drivers/net/ethernet/realtek/r8169.c
index 3027f4a..1d81238 100644
--- a/drivers/net/ethernet/realtek/r8169.c
+++ b/drivers/net/ethernet/realtek/r8169.c
@@ -1882,7 +1882,7 @@ static int rtl8169_set_features(struct net_device *dev,
 	features &= NETIF_F_RXALL | NETIF_F_RXCSUM | NETIF_F_HW_VLAN_CTAG_RX;
 
 	rtl_lock_work(tp);
-	if (features ^ dev->features);
+	if (features ^ dev->features)
 		__rtl8169_set_features(dev, features);
 	rtl_unlock_work(tp);
 
