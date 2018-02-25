From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Sun, 25 Feb 2018 11:10:34 +0000
Subject: Re: [PATCH] drm/amdkfd: Delete an error message for a failed memory allocation in kfd_topology_init(
Message-Id: <CAFCwf131ahZi1VLLzHG189DAGOVm_u8MmLCGAMoALJoBv-2CSg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <94b486c9-92ce-dae8-3d5e-db1943fc0119@users.sourceforge.net>
In-Reply-To: <94b486c9-92ce-dae8-3d5e-db1943fc0119-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

On Thu, Feb 8, 2018 at 11:33 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 8 Feb 2018 22:23:57 +0100
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> index 19ce59028d6b..610e3d4ac575 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> @@ -1019,7 +1019,6 @@ int kfd_topology_init(void)
>                 crat_image = kmalloc(image_size, GFP_KERNEL);
>                 if (!crat_image) {
>                         ret = -ENOMEM;
> -                       pr_err("No memory for allocating CRAT image\n");
>                         goto err;
>                 }
>                 ret = kfd_topology_get_crat_acpi(crat_image, &image_size);
> --
> 2.16.1
>

Hi,
Thanks for the patch but this code block is going to be refactored in
the next merge window and the patch will no longer be relevant.

Oded
