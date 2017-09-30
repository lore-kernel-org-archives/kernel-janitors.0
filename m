From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Sat, 30 Sep 2017 08:25:59 +0000
Subject: Re: [PATCH 1/2] drm/amdgpu: potential uninitialized variable in amdgpu_vce_ring_parse_cs()
Message-Id: <0b5a4cef-085d-bbeb-e673-79f8163a2e34@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170930081328.kher7yumqzi2vsrg@mwanda>
In-Reply-To: <20170930081328.kher7yumqzi2vsrg@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Frank Min <Frank.Min-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org>, Xiangliang Yu <Xiangliang.Yu-5C7GfCeVMHo@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Junwei Zhang <Jerry.Zhang-5C7GfCeVMHo@public.gmane.org>, Leo Liu <leo.liu-5C7GfCeVMHo@public.gmane.org>

Am 30.09.2017 um 10:13 schrieb Dan Carpenter:
> We shifted some code around in commit 9cca0b8e5df0 ("drm/amdgpu: move
> amdgpu_cs_sysvm_access_required into find_mapping") and now my static
> checker complains that "r" might not be initialized at the end of the
> function.  I've reviewed the code, and that seems possible, but it's
> also possible I may have missed something.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catches, Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> =

for both patches.

>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_vce.c
> index b46280c1279f..2918de2f39ec 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -648,7 +648,7 @@ int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parser =
*p, uint32_t ib_idx)
>   	uint32_t allocated =3D 0;
>   	uint32_t tmp, handle =3D 0;
>   	uint32_t *size =3D &tmp;
> -	int i, r, idx =3D 0;
> +	int i, r =3D 0, idx =3D 0;
>  =20
>   	p->job->vm =3D NULL;
>   	ib->gpu_addr =3D amdgpu_sa_bo_gpu_addr(ib->sa_bo);


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
