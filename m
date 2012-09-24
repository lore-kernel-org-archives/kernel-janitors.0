From: Bing Zhao <bzhao@marvell.com>
Date: Mon, 24 Sep 2012 06:20:37 +0000
Subject: RE: [patch] mwifiex: potential corruption in mwifiex_update_uap_custom_ie()
Message-Id: <477F20668A386D41ADCC57781B1F7043083B4C036E@SC-VEXCH1.marvell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120923163300.GB21396@elgon.mountain>
In-Reply-To: <20120923163300.GB21396@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Avinash Patil <patila@marvell.com>, Stone Piao <piaoyun@marvell.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan,

Thanks for the patch.

> ap_custom_ie is a struct mwifiex_ie_list which is quite different and
> also larger than struct mwifiex_ie.  It's a difference between 4196
> bytes and 262.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Tested-by: Stone Piao <piaoyun@marvell.com>
Acked-by: Bing Zhao <bzhao@marvell.com>

Thanks,
Bing

> ---
> This is a static checker fix and I don't have the hardware to test it.
> Please review it carefully.
> 
> diff --git a/drivers/net/wireless/mwifiex/ie.c b/drivers/net/wireless/mwifiex/ie.c
> index 1d8dd00..fa3a80f 100644
> --- a/drivers/net/wireless/mwifiex/ie.c
> +++ b/drivers/net/wireless/mwifiex/ie.c
> @@ -160,7 +160,7 @@ mwifiex_update_uap_custom_ie(struct mwifiex_private *priv,
>  	u16 len;
>  	int ret;
> 
> -	ap_custom_ie = kzalloc(sizeof(struct mwifiex_ie), GFP_KERNEL);
> +	ap_custom_ie = kzalloc(sizeof(*ap_custom_ie), GFP_KERNEL);
>  	if (!ap_custom_ie)
>  		return -ENOMEM;
> 
