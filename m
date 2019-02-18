From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 18 Feb 2019 15:15:43 +0000
Subject: [PATCH v2 -next] staging: rtl8192e: Remove set but not used variables 'broad_addr, stype'
Message-Id: <20190218151543.145958-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218123359.83746-1-yuehaibing@huawei.com>
In-Reply-To: <20190218123359.83746-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Himadri Pandya <himadri18.07@gmail.com>, "David S. Miller" <davem@davemloft.net>, Colin Ian King <colin.king@canonical.com>
Cc: YueHaibing <yuehaibing@huawei.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/staging/rtl8192e/rtl8192e/rtl_core.c: In function '_rtl92e_tx':
drivers/staging/rtl8192e/rtl8192e/rtl_core.c:1732:28: warning:
 variable 'broad_addr' set but not used [-Wunused-but-set-variable]

drivers/staging/rtl8192e/rtl8192e/rtl_core.c:1731:24: warning:
 variable 'stype' set but not used [-Wunused-but-set-variable]

This remove unnessesary bool variable 'multi_addr, broad_addr, uni_addr'
Also 'stype' never used and  can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: remove unnessesary bool variable 'multi_addr,uni_addr'
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index c145b689175c..253f1911a3f4 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1728,8 +1728,7 @@ static short _rtl92e_tx(struct net_device *dev, struct sk_buff *skb)
 				    MAX_DEV_ADDR_SIZE);
 	struct tx_desc *pdesc = NULL;
 	struct rtllib_hdr_1addr *header = NULL;
-	u16 fc = 0, type = 0, stype = 0;
-	bool  multi_addr = false, broad_addr = false, uni_addr = false;
+	u16 fc = 0, type = 0;
 	u8 *pda_addr = NULL;
 	int   idx;
 	u32 fwinfo_size = 0;
@@ -1747,22 +1746,14 @@ static short _rtl92e_tx(struct net_device *dev, struct sk_buff *skb)
 	header = (struct rtllib_hdr_1addr *)(((u8 *)skb->data) + fwinfo_size);
 	fc = le16_to_cpu(header->frame_ctl);
 	type = WLAN_FC_GET_TYPE(fc);
-	stype = WLAN_FC_GET_STYPE(fc);
 	pda_addr = header->addr1;
 
 	if (is_broadcast_ether_addr(pda_addr))
-		broad_addr = true;
+		priv->stats.txbytesbroadcast += skb->len - fwinfo_size;
 	else if (is_multicast_ether_addr(pda_addr))
-		multi_addr = true;
-	else
-		uni_addr = true;
-
-	if (uni_addr)
-		priv->stats.txbytesunicast += skb->len - fwinfo_size;
-	else if (multi_addr)
 		priv->stats.txbytesmulticast += skb->len - fwinfo_size;
 	else
-		priv->stats.txbytesbroadcast += skb->len - fwinfo_size;
+		priv->stats.txbytesunicast += skb->len - fwinfo_size;
 
 	spin_lock_irqsave(&priv->irq_th_lock, flags);
 	ring = &priv->tx_ring[tcb_desc->queue_index];
