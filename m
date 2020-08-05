From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 05 Aug 2020 20:02:25 +0000
Subject: Re: [PATCH][next] drm/amdgpu: fix spelling mistake "paramter" -> "parameter"
Message-Id: <CADnq5_OCQGCEwXN8=74AJck=ctAhbRp_0Hvb1B1hyqA_+3N0ZQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200805121527.19157-1-colin.king@canonical.com>
In-Reply-To: <20200805121527.19157-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Wed, Aug 5, 2020 at 8:15 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a dev_warn message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index b72aeeb0a226..16e23f053361 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1201,7 +1201,7 @@ static int amdgpu_device_check_arguments(struct amdgpu_device *adev)
>
>         if (amdgpu_num_kcq > 8 || amdgpu_num_kcq < 0) {
>                 amdgpu_num_kcq = 8;
> -               dev_warn(adev->dev, "set kernel compute queue number to 8 due to invalid paramter provided by user\n");
> +               dev_warn(adev->dev, "set kernel compute queue number to 8 due to invalid parameter provided by user\n");
>         }
>
>         return 0;
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
