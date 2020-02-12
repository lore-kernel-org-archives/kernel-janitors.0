From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Wed, 12 Feb 2020 12:12:17 +0000
Subject: Re: [PATCH] drm/amdgpu: return -EFAULT if copy_to_user() fails
Message-Id: <577d76db-3c2d-545d-6237-1c66f17ec178@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200212120759.dokjxbk4cqln55sc@kili.mountain>
In-Reply-To: <20200212120759.dokjxbk4cqln55sc@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Alex Deucher <alexander.deucher@amd.com>
Cc: "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Jonathan Kim <Jonathan.Kim@amd.com>, Philip Yang <Philip.Yang@amd.com>, David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>, "Tianci.Yin" <tianci.yin@amd.com>, kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>

Am 12.02.20 um 13:07 schrieb Dan Carpenter:
> The copy_to_user() function returns the number of bytes remaining to be
> copied, but we want to return a negative error code to the user.
>
> Fixes: 030d5b97a54b ("drm/amdgpu: use amdgpu_device_vram_access in amdgpu=
_ttm_vram_read")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Alex do you want to pick that up or should I do this?

Thanks,
Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 15f5451d312d..660867cf2597 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2280,7 +2280,6 @@ static ssize_t amdgpu_ttm_vram_read(struct file *f,=
 char __user *buf,
>   {
>   	struct amdgpu_device *adev =3D file_inode(f)->i_private;
>   	ssize_t result =3D 0;
> -	int r;
>  =20
>   	if (size & 0x3 || *pos & 0x3)
>   		return -EINVAL;
> @@ -2294,9 +2293,8 @@ static ssize_t amdgpu_ttm_vram_read(struct file *f,=
 char __user *buf,
>   		uint32_t value[AMDGPU_TTM_VRAM_MAX_DW_READ];
>  =20
>   		amdgpu_device_vram_access(adev, *pos, value, bytes, false);
> -		r =3D copy_to_user(buf, value, bytes);
> -		if (r)
> -			return r;
> +		if (copy_to_user(buf, value, bytes))
> +			return -EFAULT;
>  =20
>   		result +=3D bytes;
>   		buf +=3D bytes;
