From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Sep 2019 20:28:58 +0000
Subject: Re: [PATCH] drm/amd/display: rename variable eanble -> enable
Message-Id: <CADnq5_P+G9bRLvFAZht+LzjwmquO5guAHFAeWFO2DTi-mTasTw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190913080248.28695-1-colin.king@canonical.com>
In-Reply-To: <20190913080248.28695-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Leo Li <sunpeng.li-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Harry Wentland <harry.wentland-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Fri, Sep 13, 2019 at 4:02 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in the variable name eanble,
> rename it to enable.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
> index 1488ffddf4e3..5944524faab9 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
> @@ -606,11 +606,11 @@ static void dce_mi_allocate_dmif(
>         }
>
>         if (dce_mi->wa.single_head_rdreq_dmif_limit) {
> -               uint32_t eanble =  (total_stream_num > 1) ? 0 :
> +               uint32_t enable =  (total_stream_num > 1) ? 0 :
>                                 dce_mi->wa.single_head_rdreq_dmif_limit;
>
>                 REG_UPDATE(MC_HUB_RDREQ_DMIF_LIMIT,
> -                               ENABLE, eanble);
> +                               ENABLE, enable);
>         }
>  }
>
> @@ -636,11 +636,11 @@ static void dce_mi_free_dmif(
>                         10, 3500);
>
>         if (dce_mi->wa.single_head_rdreq_dmif_limit) {
> -               uint32_t eanble =  (total_stream_num > 1) ? 0 :
> +               uint32_t enable =  (total_stream_num > 1) ? 0 :
>                                 dce_mi->wa.single_head_rdreq_dmif_limit;
>
>                 REG_UPDATE(MC_HUB_RDREQ_DMIF_LIMIT,
> -                               ENABLE, eanble);
> +                               ENABLE, enable);
>         }
>  }
>
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
