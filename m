From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 Sep 2016 17:25:46 +0000
Subject: Re: [PATCH 1/5] drm/amdgpu: Use kmalloc_array() in amdgpu_debugfs_gca_config_read()
Message-Id: <CADnq5_OpYm_ZzrqhAgdgzLfBPo5+LfqFq1U278JTQHizTx1VPA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <8d614254-1cba-0379-cf84-52ad9bd9f3a7@users.sourceforge.net>
 <976bba66-8e9b-d5ee-a266-d291986e63d7@users.sourceforge.net>
In-Reply-To: <976bba66-8e9b-d5ee-a266-d291986e63d7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Tom St Denis <tom.stdenis@amd.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Julia Lawall <julia.lawall@lip6.fr>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Monk Liu <Monk.Liu@amd.com>

On Sun, Sep 18, 2016 at 12:50 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 18 Sep 2016 17:00:52 +0200
>
> A multiplication for the size determination of a memory allocation
> indicated that an array data structure should be processed.
> Thus use the corresponding function "kmalloc_array".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied.  thanks.

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index df7ab245..2709ebd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2438,7 +2438,7 @@ static ssize_t amdgpu_debugfs_gca_config_read(struct file *f, char __user *buf,
>         if (size & 0x3 || *pos & 0x3)
>                 return -EINVAL;
>
> -       config = kmalloc(256 * sizeof(*config), GFP_KERNEL);
> +       config = kmalloc_array(256, sizeof(*config), GFP_KERNEL);
>         if (!config)
>                 return -ENOMEM;
>
> --
> 2.10.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
