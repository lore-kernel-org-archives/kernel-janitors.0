From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 18 Jun 2020 15:15:29 +0000
Subject: Re: [PATCH] drm/amdgpu: remove redundant initialization of variable ret
Message-Id: <CADnq5_OeVaKbr46WDQ0GcnLd1CE2EbwmRxyVOVqJcqwkJN5qNg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200618102622.12256-1-colin.king@canonical.com>
In-Reply-To: <20200618102622.12256-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Thu, Jun 18, 2020 at 6:26 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable ret is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> index b2cdc8a1268f..58b76d3d7365 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> @@ -1609,7 +1609,7 @@ static ssize_t amdgpu_set_pp_power_profile_mode(struct device *dev,
>                 const char *buf,
>                 size_t count)
>  {
> -       int ret = 0xff;
> +       int ret;
>         struct drm_device *ddev = dev_get_drvdata(dev);
>         struct amdgpu_device *adev = ddev->dev_private;
>         uint32_t parameter_size = 0;
> --
> 2.27.0.rc0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
