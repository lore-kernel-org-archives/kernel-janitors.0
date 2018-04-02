From: Felix Kuehling <felix.kuehling@amd.com>
Date: Mon, 02 Apr 2018 18:02:53 +0000
Subject: Re: [PATCH -next] drm/amdkfd: Fix the error return code in kfd_ioctl_unmap_memory_from_gpu()
Message-Id: <4aac97a5-4efa-8667-3a87-d6f4182dd1e7@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522376717-136486-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1522376717-136486-1-git-send-email-weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Wei Yongjun <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, oded.gabbay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org, David1.Zhou-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Thanks for catching that. I'd use -ENODEV to match what is done a few
lines below for peer_pdd. With that fixed, this patch is Reviewed-by:
Felix Kuehling <Felix.Kuehling@amd.com>

Regards,
=C2=A0 Felix


On 2018-03-29 10:25 PM, Wei Yongjun wrote:
> Passing NULL pointer to PTR_ERR will result in return value of 0
> indicating success which is clearly not what it is intended here.
> This patch returns -EINVAL instead.
>
> Fixes: 5ec7e02854b3 ("drm/amdkfd: Add ioctls for GPUVM memory management")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_chardev.c
> index cd679cf..c32a341 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -1421,7 +1421,7 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct f=
ile *filep,
> =20
>  	pdd =3D kfd_get_process_device_data(dev, p);
>  	if (!pdd) {
> -		err =3D PTR_ERR(pdd);
> +		err =3D -EINVAL;
>  		goto bind_process_to_device_failed;
>  	}
>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
