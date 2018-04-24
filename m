From: Felix Kuehling <felix.kuehling@amd.com>
Date: Tue, 24 Apr 2018 18:58:10 +0000
Subject: Re: [PATCH] drm/amdkfd: Integer overflows in ioctl
Message-Id: <e2b7b3c1-cadb-330f-53a8-57568d4bc877@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180424133549.GB10167@mwanda>
In-Reply-To: <20180424133549.GB10167@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Oded Gabbay <oded.gabbay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

We could probably add a sanity check for n_devices to avoid user mode
causing excessive memory allocations in the kernel. There is no good
reason for this to be bigger than the number of GPUs in the system. The
maximum number of GPUs supported due to device minor limit in DRM is 128.

Regards,
=C2=A0 Felix


On 2018-04-24 09:35 AM, Dan Carpenter wrote:
> args->n_devices is a u32 that comes from the user.  The multiplication
> could overflow on 32 bit systems possibly leading to privilege
> escalation.
>
> Fixes: 5ec7e02854b3 ("drm/amdkfd: Add ioctls for GPUVM memory management")
> Signed-off-by: Dan Carpenter dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_chardev.c
> index cd679cf1fd30..ce36e556da38 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -1295,8 +1295,8 @@ static int kfd_ioctl_map_memory_to_gpu(struct file =
*filep,
>  		return -EINVAL;
>  	}
> =20
> -	devices_arr =3D kmalloc(args->n_devices * sizeof(*devices_arr),
> -			      GFP_KERNEL);
> +	devices_arr =3D kmalloc_array(args->n_devices, sizeof(*devices_arr),
> +				    GFP_KERNEL);
>  	if (!devices_arr)
>  		return -ENOMEM;
> =20
> @@ -1404,8 +1404,8 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct f=
ile *filep,
>  		return -EINVAL;
>  	}
> =20
> -	devices_arr =3D kmalloc(args->n_devices * sizeof(*devices_arr),
> -			      GFP_KERNEL);
> +	devices_arr =3D kmalloc_array(args->n_devices, sizeof(*devices_arr),
> +				    GFP_KERNEL);
>  	if (!devices_arr)
>  		return -ENOMEM;
> =20

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
