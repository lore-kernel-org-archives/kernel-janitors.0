From: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Tue, 18 Apr 2017 08:00:59 +0000
Subject: Re: [PATCH] drm: atmel-hlcdc: Uninitialized return in atmel_hlcdc_create_outputs()
Message-Id: <20170418100059.790c5d0f@bbrezillon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170415192142.GA6416@mwanda>
In-Reply-To: <20170415192142.GA6416@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Sat, 15 Apr 2017 22:21:42 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> It's not possible for endpoint to be zero so the test doesn't work.  If
> we break on the first iteration through the loop then endpoint is 1 and
> "ret" is uninitialized.
> 
> Fixes: ebc944613567 ("drm: convert drivers to use drm_of_find_panel_or_bridge")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Daniel, should I directly apply this patch to drm-misc-next-fixes or
should I wait for someone else to take it?

> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
> index f987b4572d4a..65a3bd7a0c00 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
> @@ -221,7 +221,8 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev,
>  int atmel_hlcdc_create_outputs(struct drm_device *dev)
>  {
>  	struct device_node *remote;
> -	int ret, endpoint = 0;
> +	int ret = -ENODEV;
> +	int endpoint = 0;
>  
>  	while (true) {
>  		/* Loop thru possible multiple connections to the output */
> @@ -236,7 +237,5 @@ int atmel_hlcdc_create_outputs(struct drm_device *dev)
>  			return ret;
>  	}
>  
> -	if (!endpoint)
> -		return -ENODEV;
>  	return ret;
>  }

