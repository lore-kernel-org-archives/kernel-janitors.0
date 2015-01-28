From: Daniel Kurtz <djkurtz@chromium.org>
Date: Wed, 28 Jan 2015 06:46:46 +0000
Subject: Re: [patch] drm/bridge: checking the wrong variable
Message-Id: <CAGS+omBhW+NRm01zGdZDLjWkO1w7D+ZTRt7_uZpvdQqvy1+gew@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150128064335.GC30893@mwanda>
In-Reply-To: <20150128064335.GC30893@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>

Hi Dan,

nit: this patch is not really for "drm/bridge".

On Wed, Jan 28, 2015 at 2:43 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> We were supposed to check "fmts" here instead of "formats".  I suppose
> it eventually leads to a NULL dereference.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

Otherwise, good catch!

Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>

>
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 98fb640..8ae239f 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -783,7 +783,7 @@ int drm_display_info_set_bus_formats(struct drm_display_info *info,
>         if (formats && num_formats) {
>                 fmts = kmemdup(formats, sizeof(*formats) * num_formats,
>                                GFP_KERNEL);
> -               if (!formats)
> +               if (!fmts)
>                         return -ENOMEM;
>         }
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
