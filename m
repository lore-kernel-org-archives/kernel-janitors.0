From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Jul 2020 21:01:19 +0000
Subject: Re: [PATCH][next] drm/amdgpu: fix spelling mistake "Falied" -> "Failed"
Message-Id: <CADnq5_MWvu0JDbBMR1_wDqozxMahX6uAJBppTLKwPLOmdtTGSQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200710083758.3304139-1-colin.king@canonical.com>
In-Reply-To: <20200710083758.3304139-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Fri, Jul 10, 2020 at 4:38 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a DRM_ERROR error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> index e20695b44dbe..40706334f7a8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -1984,7 +1984,7 @@ static int psp_suspend(void *handle)
>
>         ret = psp_tmr_terminate(psp);
>         if (ret) {
> -               DRM_ERROR("Falied to terminate tmr\n");
> +               DRM_ERROR("Failed to terminate tmr\n");
>                 return ret;
>         }
>
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
