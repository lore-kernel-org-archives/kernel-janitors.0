From: Bing Zhao <bzhao@marvell.com>
Date: Wed, 21 Sep 2011 18:05:14 +0000
Subject: RE: [patch 1/2] mwifiex: add a kfree() to an error path
Message-Id: <477F20668A386D41ADCC57781B1F704308153E17A2@SC-VEXCH1.marvell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110921071329.GF4999@elgon.mountain>
In-Reply-To: <20110921071329.GF4999@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan,

Thanks for the patch.

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Wednesday, September 21, 2011 12:13 AM
> To: Bing Zhao
> Cc: John W. Linville; linux-wireless@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [patch 1/2] mwifiex: add a kfree() to an error path
> 
> We're not likely to hit this small memory leak, but lets fix it
> anyway to keep the static checkers happy.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Bing Zhao <bzhao@marvell.com>

Thanks,
Bing

> 
> diff --git a/drivers/net/wireless/mwifiex/sta_ioctl.c b/drivers/net/wireless/mwifiex/sta_ioctl.c
> index eb569fa..215c65a 100644
> --- a/drivers/net/wireless/mwifiex/sta_ioctl.c
> +++ b/drivers/net/wireless/mwifiex/sta_ioctl.c
> @@ -203,6 +203,7 @@ int mwifiex_bss_start(struct mwifiex_private *priv, struct cfg80211_bss *bss,
>  		beacon_ie = kmemdup(bss->information_elements,
>  					bss->len_beacon_ies, GFP_KERNEL);
>  		if (!beacon_ie) {
> +			kfree(bss_desc);
>  			dev_err(priv->adapter->dev, " failed to alloc beacon_ie\n");
>  			return -ENOMEM;
>  		}
