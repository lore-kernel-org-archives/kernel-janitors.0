From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 01 Nov 2016 09:07:24 +0000
Subject: Re: [PATCH] drm/imx: Fix error handling
Message-Id: <1477991244.2475.26.camel@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161031175917.4053-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161031175917.4053-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>

Hi Christophe,

Am Montag, den 31.10.2016, 18:59 +0100 schrieb Christophe JAILLET:
> 'drm_dev_alloc()' returns an error pointer in case of error, not NULL
> So test it with IS_ERR.
> 
> This behavior has been introduced recently in	0f2886057be3. For some
> reason, this file has not been updated.
> 
> Fixes: 0f2886057be3 ("drm: Don't swallow error codes in drm_dev_alloc()")
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/imx/imx-drm-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
> index 98df09c2b388..3acc976cc04e 100644
> --- a/drivers/gpu/drm/imx/imx-drm-core.c
> +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> @@ -357,8 +357,8 @@ static int imx_drm_bind(struct device *dev)
>  	int ret;
>  
>  	drm = drm_dev_alloc(&imx_drm_driver, dev);
> -	if (!drm)
> -		return -ENOMEM;
> +	if (IS_ERR(drm))
> +		return PTR_ERR(drm);
>  
>  	imxdrm = devm_kzalloc(dev, sizeof(*imxdrm), GFP_KERNEL);
>  	if (!imxdrm) {

Thank you for the patch. The same fix is in the queue already:
8cca354816ad ("drm/imx: drm_dev_alloc() returns error pointers"). Only
Dan selected commit 54db5decce17 ("drm/imx: drop deprecated load/unload
drm_driver ops") as the culprit.

regards
Philipp

