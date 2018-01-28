From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Sun, 28 Jan 2018 13:03:31 +0000
Subject: Re: [PATCH] drm/radeon: adjust tested variable
Message-Id: <f6ee63cc-0d2e-d314-1621-dd9045970ada@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1517063295-16648-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1517063295-16648-1-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Am 27.01.2018 um 15:28 schrieb Julia Lawall:
> Check the variable that was most recently initialized.
>
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> expression x, y, f, g, e, m;
> statement S1,S2,S3,S4;
> @@
>
> x = f(...);
> if (\(<+...x...+>\&e\)) S1 else S2
> (
> x = g(...);
> |
> m = g(...,&x,...);
> |
> y = g(...);
> *if (e)
>   S3 else S4
> )
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Good catch, added my rb and pushed it into our to-be-upstreamed branch.

Thanks,
Christian.

>
> ---
>   drivers/gpu/drm/radeon/radeon_uvd.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
> index d34d1cf..95f4db7 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -995,7 +995,7 @@ int radeon_uvd_calc_upll_dividers(struct radeon_device *rdev,
>   		/* calc dclk divider with current vco freq */
>   		dclk_div = radeon_uvd_calc_upll_post_div(vco_freq, dclk,
>   							 pd_min, pd_even);
> -		if (vclk_div > pd_max)
> +		if (dclk_div > pd_max)
>   			break; /* vco is too big, it has to stop */
>   
>   		/* calc score with current vco freq */
>

