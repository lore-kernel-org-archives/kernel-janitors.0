From: Andrzej Hajda <a.hajda@samsung.com>
Date: Thu, 10 Apr 2014 05:48:37 +0000
Subject: Re: [patch] drm/panel: s6e8aa0: silence array overflow warning
Message-Id: <534630B5.2080705@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140409152112.GD24536@mwanda>
In-Reply-To: <20140409152112.GD24536@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

Hi Dan,

Thanks for the patch.

On 04/09/2014 05:21 PM, Dan Carpenter wrote:
> Smatch complains that we are reading beyond the end of the array here:
>
> 	drivers/gpu/drm/panel/panel-s6e8aa0.c:852 s6e8aa0_read_mtp_id()
> 	warn: buffer overflow 's6e8aa0_variants' 4 <= 4
>
> We set the error code, so it's not harmful but it looks like a return
> was intended here so lets add that and silence the warning.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Andrzej Hajda <a.hajda@samsung.com>

> ---
> Compile tested only.
>
> diff --git a/drivers/gpu/drm/panel/panel-s6e8aa0.c b/drivers/gpu/drm/panel/panel-s6e8aa0.c
> index 35941d2..06e57a2 100644
> --- a/drivers/gpu/drm/panel/panel-s6e8aa0.c
> +++ b/drivers/gpu/drm/panel/panel-s6e8aa0.c
> @@ -847,6 +847,7 @@ static void s6e8aa0_read_mtp_id(struct s6e8aa0 *ctx)
>  	if (i >= ARRAY_SIZE(s6e8aa0_variants)) {
>  		dev_err(ctx->dev, "unsupported display version %d\n", id[1]);
>  		ctx->error = -EINVAL;
> +		return;
>  	}
>  
>  	ctx->variant = &s6e8aa0_variants[i];
>

