From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 18 Feb 2019 14:31:14 +0000
Subject: Re: [PATCH -next] staging: rtl8192e: Remove set but not used variables 'broad_addr, stype'
Message-Id: <20190218143114.GD17104@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218123359.83746-1-yuehaibing@huawei.com>
In-Reply-To: <20190218123359.83746-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Himadri Pandya <himadri18.07@gmail.com>, "David S. Miller" <davem@davemloft.net>, Colin Ian King <colin.king@canonical.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 18, 2019 at 12:33:59PM +0000, YueHaibing wrote:
> @@ -1747,11 +1747,10 @@ static short _rtl92e_tx(struct net_device *dev, struct sk_buff *skb)
>  	header = (struct rtllib_hdr_1addr *)(((u8 *)skb->data) + fwinfo_size);
>  	fc = le16_to_cpu(header->frame_ctl);
>  	type = WLAN_FC_GET_TYPE(fc);
> -	stype = WLAN_FC_GET_STYPE(fc);
>  	pda_addr = header->addr1;
>  
>  	if (is_broadcast_ether_addr(pda_addr))
> -		broad_addr = true;
> +		;
>  	else if (is_multicast_ether_addr(pda_addr))
>  		multi_addr = true;
>  	else
> 

This is ugly.  Please do it like this:


diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index c145b689175c..29b53e2246b4 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1729,7 +1729,6 @@ static short _rtl92e_tx(struct net_device *dev, struct sk_buff *skb)
 	struct tx_desc *pdesc = NULL;
 	struct rtllib_hdr_1addr *header = NULL;
 	u16 fc = 0, type = 0, stype = 0;
-	bool  multi_addr = false, broad_addr = false, uni_addr = false;
 	u8 *pda_addr = NULL;
 	int   idx;
 	u32 fwinfo_size = 0;
@@ -1751,18 +1750,11 @@ static short _rtl92e_tx(struct net_device *dev, struct sk_buff *skb)
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
