From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Mon, 10 Aug 2020 09:36:45 +0000
Subject: Re: [PATCH] drm: amdgpu: Use the correct size when allocating memory
Message-Id: <b4117d15-d563-5e1e-d8ce-edded2db77a1@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200809203406.751971-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200809203406.751971-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org, colton.w.lewis@protonmail.com, Ori.Messinger@amd.com, m.szyprowski@samsung.com, bernard@vivo.com, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org

Am 09.08.20 um 22:34 schrieb Christophe JAILLET:
> When '*sgt' is allocated, we must allocated 'sizeof(**sgt)' bytes instead
> of 'sizeof(*sg)'. 'sg' (i.e. struct scatterlist) is smaller than
> 'sgt' (i.e struct sg_table), so this could lead to memory corruption.
>
> Fixes: f44ffd677fb3 ("drm/amdgpu: add support for exporting VRAM using DM=
A-buf v3")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Good catch, Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_vram_mgr.c
> index 134cc36e30c5..0739e259bf91 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -462,7 +462,7 @@ int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *a=
dev,
>   	unsigned int pages;
>   	int i, r;
>  =20
> -	*sgt =3D kmalloc(sizeof(*sg), GFP_KERNEL);
> +	*sgt =3D kmalloc(sizeof(**sgt), GFP_KERNEL);
>   	if (!*sgt)
>   		return -ENOMEM;
>  =20
