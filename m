From: Rob Clark <robdclark@gmail.com>
Date: Sun, 26 Feb 2017 15:25:03 +0000
Subject: Re: [PATCH v2] drm/msm/dsi: Fix the releasing of resources in error path in 'dsi_bus_clk_enable()'
Message-Id: <CAF6AEGuJkGxc8Ssu2ERiLir=EqgMDqM+ez3m46fBQVi7EOaYRw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170226121057.9717-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170226121057.9717-1-christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Cc: freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>, Hai Li <hali-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

On Sun, Feb 26, 2017 at 7:10 AM, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> If a 'clk_prepare_enable()' fails, then we need to disable_unprepare the
> clk already handled.
>
> With the current implemenatation, we try to do that on the clk that has
> triggered the error, which is a no-op and leave msm_host->bus_clks[0]
> untouched.
>
> Count forward in order to fix it and be more future proof.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v2: change the for loop from a backward to a forward one, to ease reading.

fwiw, I prefer your v1, for reasons discussed on a similar patch
fixing the same issue:

https://lists.freedesktop.org/archives/dri-devel/2017-February/133097.html

(although your v1 is a better solution than the original, since we
probably don't want to clk_disable_unprepare() the clk that failed to
enable.)

BR,
-R

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 1fc07ce24686..e6f56cd8ce08 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -422,7 +422,7 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
>  static int dsi_bus_clk_enable(struct msm_dsi_host *msm_host)
>  {
>         const struct msm_dsi_config *cfg = msm_host->cfg_hnd->cfg;
> -       int i, ret;
> +       int i, j, ret;
>
>         DBG("id=%d", msm_host->id);
>
> @@ -437,8 +437,8 @@ static int dsi_bus_clk_enable(struct msm_dsi_host *msm_host)
>
>         return 0;
>  err:
> -       for (; i > 0; i--)
> -               clk_disable_unprepare(msm_host->bus_clks[i]);
> +       for (j = 0; j < i; j++)
> +               clk_disable_unprepare(msm_host->bus_clks[j]);
>
>         return ret;
>  }
> --
> 2.9.3
>
