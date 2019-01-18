From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 18 Jan 2019 02:06:49 +0000
Subject: [PATCH net-next] net: usb: rtl8150: remove set but not used variable 'rx_stat'
Message-Id: <1547777209-92367-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petko Manolov <petkan@nucleusys.com>, "David S. Miller" <davem@davemloft.net>
Cc: Yue Haibing <yuehaibing@huawei.com>, linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Yue Haibing <yuehaibing@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/usb/rtl8150.c: In function 'read_bulk_callback':
drivers/net/usb/rtl8150.c:391:6: warning:
 variable 'rx_stat' set but not used [-Wunused-but-set-variable]

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/net/usb/rtl8150.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 80373a9..3f145e4 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -388,7 +388,6 @@ static void read_bulk_callback(struct urb *urb)
 	unsigned pkt_len, res;
 	struct sk_buff *skb;
 	struct net_device *netdev;
-	u16 rx_stat;
 	int status = urb->status;
 	int result;
 	unsigned long flags;
@@ -424,7 +423,6 @@ static void read_bulk_callback(struct urb *urb)
 		goto goon;
 
 	res = urb->actual_length;
-	rx_stat = le16_to_cpu(*(__le16 *)(urb->transfer_buffer + res - 4));
 	pkt_len = res - 4;
 
 	skb_put(dev->rx_skb, pkt_len);
