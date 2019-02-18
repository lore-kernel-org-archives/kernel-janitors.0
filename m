From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 18 Feb 2019 08:15:46 +0000
Subject: [PATCH net-next] yellowfin: fix remove set but not used variable warning
Message-Id: <20190218081546.189509-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Yang Wei <yang.wei9@zte.com.cn>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/packetengines/yellowfin.c: In function 'yellowfin_rx':
drivers/net/ethernet/packetengines/yellowfin.c:1053:18: warning:
 variable 'yf_size' set but not used [-Wunused-but-set-variable]

This puts the variable declaration into the YF_PROTOTYPE macro.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/packetengines/yellowfin.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/packetengines/yellowfin.c b/drivers/net/ethernet/packetengines/yellowfin.c
index 6f8d6584f809..edc8cc7f0d0d 100644
--- a/drivers/net/ethernet/packetengines/yellowfin.c
+++ b/drivers/net/ethernet/packetengines/yellowfin.c
@@ -1050,8 +1050,11 @@ static int yellowfin_rx(struct net_device *dev)
 		struct sk_buff *rx_skb = yp->rx_skbuff[entry];
 		s16 frame_status;
 		u16 desc_status;
-		int data_size, yf_size;
+		int data_size;
 		u8 *buf_addr;
+#ifdef YF_PROTOTYPE
+		int yf_size = sizeof(struct yellowfin_desc);
+#endif
 
 		if(!desc->result_status)
 			break;
@@ -1068,8 +1071,6 @@ static int yellowfin_rx(struct net_device *dev)
 		if (--boguscnt < 0)
 			break;
 
-		yf_size = sizeof(struct yellowfin_desc);
-
 		if ( ! (desc_status & RX_EOP)) {
 			if (data_size != 0)
 				netdev_warn(dev, "Oversized Ethernet frame spanned multiple buffers, status %04x, data_size %d!\n",
