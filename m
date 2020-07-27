From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Date: Mon, 27 Jul 2020 13:41:20 +0000
Subject: Re: [PATCH 2/2] drm/radeon: avoid a useless memset
Message-Id: <898acaf6-9975-40b1-1104-586b64689ccd@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727103436.50793-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200727103436.50793-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch
Cc: kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

Am 27.07.20 um 12:34 schrieb Christophe JAILLET:
> Avoid a memset after a call to 'dma_alloc_coherent()'.
> This is useless since
> commit 518a2f1925c3 ("dma-mapping: zero memory returned from dma_alloc_*")
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/radeon/radeon_gart.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_gart.c b/drivers/gpu/drm/radeo=
n/radeon_gart.c
> index b7ce254e5663..3808a753127b 100644
> --- a/drivers/gpu/drm/radeon/radeon_gart.c
> +++ b/drivers/gpu/drm/radeon/radeon_gart.c
> @@ -85,7 +85,6 @@ int radeon_gart_table_ram_alloc(struct radeon_device *r=
dev)
>   	}
>   #endif
>   	rdev->gart.ptr =3D ptr;
> -	memset((void *)rdev->gart.ptr, 0, rdev->gart.table_size);
>   	return 0;
>   }
>  =20
