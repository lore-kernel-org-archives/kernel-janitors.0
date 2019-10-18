From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Oct 2019 20:28:50 +0000
Subject: Re: [PATCH][next] drm/amdgpu/psp: fix spelling mistake "initliaze" -> "initialize"
Message-Id: <CADnq5_OfwU2yuxrkW0EjqSjxeYBRA4kw1gksDEmE+pcSOuSwAg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191018081508.11028-1-colin.king@canonical.com>
In-Reply-To: <20191018081508.11028-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Fri, Oct 18, 2019 at 4:15 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a DRM_ERROR error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> index b996b5bc5804..fd7a73f4fa70 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -90,7 +90,7 @@ static int psp_sw_init(void *handle)
>
>         ret = psp_mem_training_init(psp);
>         if (ret) {
> -               DRM_ERROR("Failed to initliaze memory training!\n");
> +               DRM_ERROR("Failed to initialize memory training!\n");
>                 return ret;
>         }
>         ret = psp_mem_training(psp, PSP_MEM_TRAIN_COLD_BOOT);
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
