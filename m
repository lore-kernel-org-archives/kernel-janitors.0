From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Jul 2015 01:41:49 +0000
Subject: Re: [patch] drm/amdgpu: information leak in amdgpu_info_ioctl()
Message-Id: <CADnq5_OqLj4jq_+n-U34fxvRwspT4Kybp1E4oYXdzzkQQq_eSA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150728155129.GC25739@mwanda>
In-Reply-To: <20150728155129.GC25739@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Leo Liu <leo.liu@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, yanyang1 <young.yang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Ken Wang <Qingqing.Wang@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Tue, Jul 28, 2015 at 11:51 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> We recently changed the drm_amdgpu_info_device struct so now there is
> a 4 byte hole at the end.  We need to initialize it so we don't disclose
> secret information from the stack.
>
> Fixes: fa92754e9c47 ('drm/amdgpu: add VCE harvesting instance query')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index d9de73a..81d60a9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -423,7 +423,7 @@ static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file
>                 return n ? -EFAULT : 0;
>         }
>         case AMDGPU_INFO_DEV_INFO: {
> -               struct drm_amdgpu_info_device dev_info;
> +               struct drm_amdgpu_info_device dev_info = {};
>                 struct amdgpu_cu_info cu_info;
>
>                 dev_info.device_id = dev->pdev->device;
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
