From: Rob Clark <robdclark@gmail.com>
Date: Sun, 26 Feb 2017 13:03:14 +0000
Subject: Re: [PATCH] drm/msm/dsi: Fix the releasing of resources in error path in 'dsi_bus_clk_enable()'
Message-Id: <CAF6AEGugCFQhd5UZ5YZwN=NART+zcwUaTnBWppRGX5x0Z7nrfQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170226075206.25762-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170226075206.25762-1-christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Cc: freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>, Hai Li <hali-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

On Sun, Feb 26, 2017 at 2:52 AM, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> If a 'clk_prepare_enable()' fails, then we need to disable_unprepare the
> clk already handled.
>
> With the current implemenatation, we try to do that on the clk that has
> triggered the error, which is a no-op, and leave 'msm_host->bus_clks[0]'
> untouched.
>
> Shift by one the index array to free resources correctly.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 1fc07ce24686..eac4987f3946 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -438,7 +438,7 @@ static int dsi_bus_clk_enable(struct msm_dsi_host *msm_host)
>         return 0;
>  err:
>         for (; i > 0; i--)
> -               clk_disable_unprepare(msm_host->bus_clks[i]);
> +               clk_disable_unprepare(msm_host->bus_clks[i-1]);
>
>         return ret;
>  }
> --
> 2.9.3
>
