From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 29 Jan 2021 19:28:42 +0000
Subject: Re: [PATCH][next] drm/amdgpu: Fix memory leak of object caps on error return paths
Message-Id: <CADnq5_O2MKy7jPc2o7u8H-VsDxweumxGHc7oBprg7ZyP_BMu2w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210129120759.375725-1-colin.king@canonical.com>
In-Reply-To: <20210129120759.375725-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Fri, Jan 29, 2021 at 7:08 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently there are three error return paths that don't kfree object
> caps.  Fix this by performing the allocation of caps after the checks
> and error return paths to avoid the premature allocation and memory
> leaking.
>
> Addresses-Coverity: ("Resource leak")
> Fixes: 555fc7fbb2a2 ("drm/amdgpu: add INFO ioctl support for querying video caps")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 84b666fcfaf6..730f4ac7487b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -988,10 +988,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>                 struct drm_amdgpu_info_video_caps *caps;
>                 int r;
>
> -               caps = kzalloc(sizeof(*caps), GFP_KERNEL);
> -               if (!caps)
> -                       return -ENOMEM;
> -
>                 switch (info->video_cap.type) {
>                 case AMDGPU_INFO_VIDEO_CAPS_DECODE:
>                         r = amdgpu_asic_query_video_codecs(adev, false, &codecs);
> @@ -1009,6 +1005,11 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>                                       info->video_cap.type);
>                         return -EINVAL;
>                 }
> +
> +               caps = kzalloc(sizeof(*caps), GFP_KERNEL);
> +               if (!caps)
> +                       return -ENOMEM;
> +
>                 for (i = 0; i < codecs->codec_count; i++) {
>                         int idx = codecs->codec_array[i].codec_type;
>
> --
> 2.29.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
