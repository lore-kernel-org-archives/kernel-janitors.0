From: Bing Zhao <bzhao@marvell.com>
Date: Thu, 09 Aug 2012 18:19:36 +0000
Subject: RE: [patch] mwifiex: use GFP_ATOMIC under spin lock
Message-Id: <477F20668A386D41ADCC57781B1F7043083AF361C0@SC-VEXCH1.marvell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120809065757.GB7925@elgon.mountain>
In-Reply-To: <20120809065757.GB7925@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan,

Thanks for the patch.

> We're holding the sta_list_spinlock here so we can't sleep.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Bing Zhao <bzhao@marvell.com>

Regards,
Bing

> 
> diff --git a/drivers/net/wireless/mwifiex/uap_event.c b/drivers/net/wireless/mwifiex/uap_event.c
> index 14d4f04..ca4a1f3 100644
> --- a/drivers/net/wireless/mwifiex/uap_event.c
> +++ b/drivers/net/wireless/mwifiex/uap_event.c
> @@ -63,7 +63,7 @@ mwifiex_add_sta_entry(struct mwifiex_private *priv, u8 *mac)
>  	if (node)
>  		goto done;
> 
> -	node = kzalloc(sizeof(struct mwifiex_sta_node), GFP_KERNEL);
> +	node = kzalloc(sizeof(struct mwifiex_sta_node), GFP_ATOMIC);
>  	if (!node)
>  		goto done;
> 
