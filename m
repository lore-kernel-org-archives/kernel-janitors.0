From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 28 Dec 2018 22:08:23 +0000
Subject: Re: [PATCH] drm/etnaviv: fix some off by one bugs
Message-Id: <CAH9NwWeG7-Wbx46AwA6F8T2kqu8nMVD6PCJRi15HdgKjWfjLUA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180713145631.qxd3pzk72v4bshii@kili.mountain>
In-Reply-To: <20180713145631.qxd3pzk72v4bshii@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, The etnaviv authors <etnaviv@lists.freedesktop.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Russell King <linux+etnaviv@armlinux.org.uk>

Am Fr., 13. Juli 2018 um 17:00 Uhr schrieb Dan Carpenter
<dan.carpenter@oracle.com>:
>
> The ->nr_signal is the supposed to be the number of elements in the
> ->signal array.  There was one place where it was 5 but it was supposed
> to be 4.  That looks like a copy and paste bug.  There were also two
> checks that were off by one.
>
> Fixes: 9e2c2e273012 ("drm/etnaviv: add infrastructure to query perf counter")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>
Tested-by: Christian Gmeiner <christian.gmeiner@gmail.com>

> ---
> Not tested.
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> index 9980d81a26e3..4227a4006c34 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
> @@ -113,7 +113,7 @@ static const struct etnaviv_pm_domain doms_3d[] = {
>                 .name = "PE",
>                 .profile_read = VIVS_MC_PROFILE_PE_READ,
>                 .profile_config = VIVS_MC_PROFILE_CONFIG0,
> -               .nr_signals = 5,
> +               .nr_signals = 4,
>                 .signal = (const struct etnaviv_pm_signal[]) {
>                         {
>                                 "PIXEL_COUNT_KILLED_BY_COLOR_PIPE",
> @@ -435,7 +435,7 @@ int etnaviv_pm_query_sig(struct etnaviv_gpu *gpu,
>
>         dom = meta->domains + signal->domain;
>
> -       if (signal->iter > dom->nr_signals)
> +       if (signal->iter >= dom->nr_signals)
>                 return -EINVAL;
>
>         sig = &dom->signal[signal->iter];
> @@ -461,7 +461,7 @@ int etnaviv_pm_req_validate(const struct drm_etnaviv_gem_submit_pmr *r,
>
>         dom = meta->domains + r->domain;
>
> -       if (r->signal > dom->nr_signals)
> +       if (r->signal >= dom->nr_signals)
>                 return -EINVAL;
>
>         return 0;



-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info
