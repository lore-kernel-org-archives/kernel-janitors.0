From: Rob Clark <robdclark@gmail.com>
Date: Thu, 22 Aug 2013 14:08:34 +0000
Subject: Re: [patch] drm/omap: tiler: clear buffer properly
Message-Id: <CAF6AEGvbqc1ja+fFyfY=q4Lfn-nM3P2Oq01Y0+JK+S2y8+9r+g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130822124250.GA2543@elgon.mountain>
In-Reply-To: <20130822124250.GA2543@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Gross <andy.gross@ti.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, kernel-janitors@vger.kernel.org

On Thu, Aug 22, 2013 at 8:42 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We're taking the sizeof() the wrong thing so it doesn't clear the whole
> buffer.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Oh, that was very certainly wrong before!

Acked-by: Rob Clark <robdclark@gmail.com>


> ---
> I can't compile this.
>
> diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
> index 9b794c9..acf6678 100644
> --- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
> +++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
> @@ -871,7 +871,7 @@ int tiler_map_show(struct seq_file *s, void *arg)
>                 goto error;
>
>         for (lut_idx = 0; lut_idx < omap_dmm->num_lut; lut_idx++) {
> -               memset(map, 0, sizeof(h_adj * sizeof(*map)));
> +               memset(map, 0, h_adj * sizeof(*map));
>                 memset(global_map, ' ', (w_adj + 1) * h_adj);
>
>                 for (i = 0; i < omap_dmm->container_height; i++) {
