From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Fri, 17 Apr 2015 12:56:02 +0000
Subject: Re: [patch] drm/gma500: missing error codes in psb_driver_load()
Message-Id: <CAMeQTsYx5BUFk53haxiqKpf8NKAQUf4YuUZo26i9-kJGsJciww@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150417122408.GA19623@mwanda>
In-Reply-To: <20150417122408.GA19623@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, Benoit Taine <benoit.taine@lip6.fr>, Dave Airlie <airlied@redhat.com>, Thierry Reding <treding@nvidia.com>

On Fri, Apr 17, 2015 at 2:24 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We should return an error code here.  In the current code they can only
> fail if there is an allocation error so -ENOMEM is appropriate.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> index 92e7e57..4eff0d6 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -326,12 +326,16 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
>                 goto out_err;
>
>         dev_priv->mmu = psb_mmu_driver_init(dev, 1, 0, 0);
> -       if (!dev_priv->mmu)
> +       if (!dev_priv->mmu) {
> +               ret = -ENOMEM;
>                 goto out_err;
> +       }
>
>         dev_priv->pf_pd = psb_mmu_alloc_pd(dev_priv->mmu, 1, 0);
> -       if (!dev_priv->pf_pd)
> +       if (!dev_priv->pf_pd) {
> +               ret = -ENOMEM;
>                 goto out_err;
> +       }
>
>         ret = psb_do_init(dev);
>         if (ret)
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
