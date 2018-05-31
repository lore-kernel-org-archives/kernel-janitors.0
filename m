From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 31 May 2018 19:31:11 +0000
Subject: Re: [PATCH][next] drm/amdgpu/df: fix potential array out-of-bounds read
Message-Id: <CADnq5_OHuFW+5w+p3=2=D2Yaevf_hyT1MSdc9Q6dJdMS=WGDcA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180530164144.21526-1-colin.king@canonical.com>
In-Reply-To: <20180530164144.21526-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: David Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Hawking Zhang <Hawking.Zhang-5C7GfCeVMHo@public.gmane.org>

On Wed, May 30, 2018 at 12:41 PM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The comparison with the number of elements in array df_v3_7_channel_number
> is off-by-one and can produce an array out-of-bounds read if
> fb_channel_number is equal to the number of elements of the array. Fix
> this by changing the comparison to >= instead of >.
>
> Detected by CoverityScan, CID#1469489 ("Out-of-bounds read")
>
> Fixes: 13b581502d51 ("drm/amdgpu/df: implement df v3_6 callback functions (v2)")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/df_v3_6.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
> index 60608b3df881..d5ebe566809b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
> +++ b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
> @@ -64,7 +64,7 @@ static u32 df_v3_6_get_hbm_channel_number(struct amdgpu_device *adev)
>         int fb_channel_number;
>
>         fb_channel_number = adev->df_funcs->get_fb_channel_number(adev);
> -       if (fb_channel_number > ARRAY_SIZE(df_v3_6_channel_number))
> +       if (fb_channel_number >= ARRAY_SIZE(df_v3_6_channel_number))
>                 fb_channel_number = 0;
>
>         return df_v3_6_channel_number[fb_channel_number];
> --
> 2.17.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
