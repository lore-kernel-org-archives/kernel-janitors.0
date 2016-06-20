From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 Jun 2016 21:06:43 +0000
Subject: Re: [patch] drm/amdgpu: precedence bug in amdgpu_device_init()
Message-Id: <CADnq5_NDP_aXHOZYPzj157WnCNZwAXWaFbb-padWVjgeHLDMxQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160618083844.GA21713@mwanda>
In-Reply-To: <20160618083844.GA21713@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tom St Denis <tom.stdenis@amd.com>, Jammy Zhou <Jammy.Zhou@amd.com>, kernel-janitors@vger.kernel.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Andres Rodriguez <andres.rodriguez@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Flora Cui <Flora.Cui@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Monk Liu <Monk.Liu@amd.com>

On Sat, Jun 18, 2016 at 4:38 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> ! has higher precedence than bitwise & so we need to add parenthesis
> for this to work as intended.
>
> Fixes: 048765ad5af7 ('amdgpu: fix asic initialization for virtualized environments (v2)')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 66482b4..6e92008 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1535,7 +1535,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>         /* Post card if necessary */
>         if (!amdgpu_card_posted(adev) ||
>             (adev->virtualization.is_virtual &&
> -            !adev->virtualization.caps & AMDGPU_VIRT_CAPS_SRIOV_EN)) {
> +            !(adev->virtualization.caps & AMDGPU_VIRT_CAPS_SRIOV_EN))) {
>                 if (!adev->bios) {
>                         dev_err(adev->dev, "Card not posted and no BIOS - ignoring\n");
>                         return -EINVAL;
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
