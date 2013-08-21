From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 21 Aug 2013 08:40:59 +0000
Subject: Re: [patch] staging: drm/imx: ipu-dc: signedness bug in ipu_dc_init_sync()
Message-Id: <20130821084059.GP31036@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130821083008.GD5240@elgon.mountain>
In-Reply-To: <20130821083008.GD5240@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Aug 21, 2013 at 11:30:08AM +0300, Dan Carpenter wrote:
> "map" needs to be signed for the error handling to work.  In the success
> case then it holds a small non-negative value.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> 
> diff --git a/drivers/staging/imx-drm/ipu-v3/ipu-dc.c b/drivers/staging/imx-drm/ipu-v3/ipu-dc.c
> index 59f03f9..21bf1c8 100644
> --- a/drivers/staging/imx-drm/ipu-v3/ipu-dc.c
> +++ b/drivers/staging/imx-drm/ipu-v3/ipu-dc.c
> @@ -161,14 +161,15 @@ int ipu_dc_init_sync(struct ipu_dc *dc, struct ipu_di *di, bool interlaced,
>  		u32 pixel_fmt, u32 width)
>  {
>  	struct ipu_dc_priv *priv = dc->priv;
> -	u32 reg = 0, map;
> +	u32 reg = 0;
> +	int map;
>  
>  	dc->di = ipu_di_get_num(di);
>  
>  	map = ipu_pixfmt_to_map(pixel_fmt);
>  	if (map < 0) {
>  		dev_dbg(priv->dev, "IPU_DISP: No MAP\n");
> -		return -EINVAL;
> +		return map;
>  	}
>  
>  	if (interlaced) {
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
