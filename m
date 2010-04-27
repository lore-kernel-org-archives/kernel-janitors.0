From: Simon Horman <horms@verge.net.au>
Date: Tue, 27 Apr 2010 08:16:19 +0000
Subject: Re: [PATCH] staging/otus: Add null check and fix coding style issue
Message-Id: <20100427081619.GJ3247@verge.net.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201004270034.49340.PeterHuewe@gmx.de>
In-Reply-To: <201004270034.49340.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Huewe <PeterHuewe@gmx.de>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, David Binderman <dcb314@hotmail.com>, D Pranith Kumar <bobby.prani@gmail.com>, Alexander Beregalov <a.beregalov@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 27, 2010 at 12:34:49AM +0200, Peter Huewe wrote:
> From: Peter Huewe <peterhuewe@gmx.de>
> 
> This patch removes mixing of declarations and code and adds a null-test
> after a kmalloc.
> 
> Patch against linux-next as of 20100427
> 
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
Acked-by: Simon Horman <horms@verge.net.au>

> ---
>  drivers/staging/otus/ioctl.c |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/otus/ioctl.c b/drivers/staging/otus/ioctl.c
> index 84be4b2..cface46 100644
> --- a/drivers/staging/otus/ioctl.c
> +++ b/drivers/staging/otus/ioctl.c
> @@ -867,6 +867,7 @@ int usbdrvwext_giwscan(struct net_device *dev,
>  	char *current_ev = extra;
>  	char *end_buf;
>  	int i;
> +	struct zsBssListV1 *pBssList;
>  	/* BssList = wd->sta.pBssList; */
>  	/* zmw_get_wlan_dev(dev); */
>  
> @@ -874,8 +875,10 @@ int usbdrvwext_giwscan(struct net_device *dev,
>  		return 0;
>  
>  	/* struct zsBssList BssList; */
> -	struct zsBssListV1 *pBssList = kmalloc(sizeof(struct zsBssListV1),
> -								GFP_KERNEL);
> +	pBssList = kmalloc(sizeof(struct zsBssListV1), GFP_KERNEL);
> +	if (pBssList = NULL)
> +		return -ENOMEM;
> +
>  	if (data->length = 0)
>  		end_buf = extra + IW_SCAN_MAX_DATA;
>  	else
> -- 
> 1.6.4.4
