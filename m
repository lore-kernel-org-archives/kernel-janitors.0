From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 09 Feb 2017 02:11:20 +0000
Subject: Re: [patch] drm/radeon: remove some dead code
Message-Id: <CADnq5_OvqFPsS8HMiC4zKBZGvtb4ALD8zc0eE2Q7A+JxhwC+6g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207131604.GA27416@mwanda>
In-Reply-To: <20170207131604.GA27416@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>

On Tue, Feb 7, 2017 at 8:16 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> If "rdev->bios" is NULL then we don't need to free it.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

applied.  thanks!

>
> diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
> index 00cfb5d2875f..04c0ed41374f 100644
> --- a/drivers/gpu/drm/radeon/radeon_bios.c
> +++ b/drivers/gpu/drm/radeon/radeon_bios.c
> @@ -638,10 +638,8 @@ static bool radeon_acpi_vfct_bios(struct radeon_device *rdev)
>                                              vhdr->ImageLength,
>                                              GFP_KERNEL);
>
> -                       if (!rdev->bios) {
> -                               kfree(rdev->bios);
> +                       if (!rdev->bios)
>                                 return false;
> -                       }
>                         return true;
>                 }
>         }
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
