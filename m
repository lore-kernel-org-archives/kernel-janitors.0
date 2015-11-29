From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Sun, 29 Nov 2015 19:10:51 +0000
Subject: Re: [PATCH] drm/radeon: constify radeon_asic_ring structures
Message-Id: <565B4DBB.8090106@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1448813561-29014-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1448813561-29014-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>, Alex Deucher <alexander.deucher@amd.com>
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

On 29.11.2015 17:12, Julia Lawall wrote:
> The radeon_asic_ring structures are never modified, so declare them as
> const.
>
> Done with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Nice clean, patch is Reviewed-by: Christian K=F6nig <christian.koenig@amd.c=
om>

>
> ---
>   drivers/gpu/drm/radeon/radeon.h      |    2 -
>   drivers/gpu/drm/radeon/radeon_asic.c |   38 +++++++++++++++++----------=
--------
>   2 files changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/rad=
eon.h
> index b6cbd81..cf09102 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -1889,7 +1889,7 @@ struct radeon_asic {
>   		void (*pad_ib)(struct radeon_ib *ib);
>   	} vm;
>   	/* ring specific callbacks */
> -	struct radeon_asic_ring *ring[RADEON_NUM_RINGS];
> +	const struct radeon_asic_ring *ring[RADEON_NUM_RINGS];
>   	/* irqs */
>   	struct {
>   		int (*set)(struct radeon_device *rdev);
> diff --git a/drivers/gpu/drm/radeon/radeon_asic.c b/drivers/gpu/drm/radeo=
n/radeon_asic.c
> index 1d4d452..7d5a36d 100644
> --- a/drivers/gpu/drm/radeon/radeon_asic.c
> +++ b/drivers/gpu/drm/radeon/radeon_asic.c
> @@ -179,7 +179,7 @@ void radeon_agp_disable(struct radeon_device *rdev)
>    * ASIC
>    */
>  =20
> -static struct radeon_asic_ring r100_gfx_ring =3D {
> +static const struct radeon_asic_ring r100_gfx_ring =3D {
>   	.ib_execute =3D &r100_ring_ib_execute,
>   	.emit_fence =3D &r100_fence_ring_emit,
>   	.emit_semaphore =3D &r100_semaphore_ring_emit,
> @@ -329,7 +329,7 @@ static struct radeon_asic r200_asic =3D {
>   	},
>   };
>  =20
> -static struct radeon_asic_ring r300_gfx_ring =3D {
> +static const struct radeon_asic_ring r300_gfx_ring =3D {
>   	.ib_execute =3D &r100_ring_ib_execute,
>   	.emit_fence =3D &r300_fence_ring_emit,
>   	.emit_semaphore =3D &r100_semaphore_ring_emit,
> @@ -343,7 +343,7 @@ static struct radeon_asic_ring r300_gfx_ring =3D {
>   	.set_wptr =3D &r100_gfx_set_wptr,
>   };
>  =20
> -static struct radeon_asic_ring rv515_gfx_ring =3D {
> +static const struct radeon_asic_ring rv515_gfx_ring =3D {
>   	.ib_execute =3D &r100_ring_ib_execute,
>   	.emit_fence =3D &r300_fence_ring_emit,
>   	.emit_semaphore =3D &r100_semaphore_ring_emit,
> @@ -901,7 +901,7 @@ static struct radeon_asic r520_asic =3D {
>   	},
>   };
>  =20
> -static struct radeon_asic_ring r600_gfx_ring =3D {
> +static const struct radeon_asic_ring r600_gfx_ring =3D {
>   	.ib_execute =3D &r600_ring_ib_execute,
>   	.emit_fence =3D &r600_fence_ring_emit,
>   	.emit_semaphore =3D &r600_semaphore_ring_emit,
> @@ -914,7 +914,7 @@ static struct radeon_asic_ring r600_gfx_ring =3D {
>   	.set_wptr =3D &r600_gfx_set_wptr,
>   };
>  =20
> -static struct radeon_asic_ring r600_dma_ring =3D {
> +static const struct radeon_asic_ring r600_dma_ring =3D {
>   	.ib_execute =3D &r600_dma_ring_ib_execute,
>   	.emit_fence =3D &r600_dma_fence_ring_emit,
>   	.emit_semaphore =3D &r600_dma_semaphore_ring_emit,
> @@ -999,7 +999,7 @@ static struct radeon_asic r600_asic =3D {
>   	},
>   };
>  =20
> -static struct radeon_asic_ring rv6xx_uvd_ring =3D {
> +static const struct radeon_asic_ring rv6xx_uvd_ring =3D {
>   	.ib_execute =3D &uvd_v1_0_ib_execute,
>   	.emit_fence =3D &uvd_v1_0_fence_emit,
>   	.emit_semaphore =3D &uvd_v1_0_semaphore_emit,
> @@ -1198,7 +1198,7 @@ static struct radeon_asic rs780_asic =3D {
>   	},
>   };
>  =20
> -static struct radeon_asic_ring rv770_uvd_ring =3D {
> +static const struct radeon_asic_ring rv770_uvd_ring =3D {
>   	.ib_execute =3D &uvd_v1_0_ib_execute,
>   	.emit_fence =3D &uvd_v2_2_fence_emit,
>   	.emit_semaphore =3D &uvd_v2_2_semaphore_emit,
> @@ -1305,7 +1305,7 @@ static struct radeon_asic rv770_asic =3D {
>   	},
>   };
>  =20
> -static struct radeon_asic_ring evergreen_gfx_ring =3D {
> +static const struct radeon_asic_ring evergreen_gfx_ring =3D {
>   	.ib_execute =3D &evergreen_ring_ib_execute,
>   	.emit_fence =3D &r600_fence_ring_emit,
>   	.emit_semaphore =3D &r600_semaphore_ring_emit,
> @@ -1318,7 +1318,7 @@ static struct radeon_asic_ring evergreen_gfx_ring =
=3D {
>   	.set_wptr =3D &r600_gfx_set_wptr,
>   };
>  =20
> -static struct radeon_asic_ring evergreen_dma_ring =3D {
> +static const struct radeon_asic_ring evergreen_dma_ring =3D {
>   	.ib_execute =3D &evergreen_dma_ring_ib_execute,
>   	.emit_fence =3D &evergreen_dma_fence_ring_emit,
>   	.emit_semaphore =3D &r600_dma_semaphore_ring_emit,
> @@ -1612,7 +1612,7 @@ static struct radeon_asic btc_asic =3D {
>   	},
>   };
>  =20
> -static struct radeon_asic_ring cayman_gfx_ring =3D {
> +static const struct radeon_asic_ring cayman_gfx_ring =3D {
>   	.ib_execute =3D &cayman_ring_ib_execute,
>   	.ib_parse =3D &evergreen_ib_parse,
>   	.emit_fence =3D &cayman_fence_ring_emit,
> @@ -1627,7 +1627,7 @@ static struct radeon_asic_ring cayman_gfx_ring =3D {
>   	.set_wptr =3D &cayman_gfx_set_wptr,
>   };
>  =20
> -static struct radeon_asic_ring cayman_dma_ring =3D {
> +static const struct radeon_asic_ring cayman_dma_ring =3D {
>   	.ib_execute =3D &cayman_dma_ring_ib_execute,
>   	.ib_parse =3D &evergreen_dma_ib_parse,
>   	.emit_fence =3D &evergreen_dma_fence_ring_emit,
> @@ -1642,7 +1642,7 @@ static struct radeon_asic_ring cayman_dma_ring =3D {
>   	.set_wptr =3D &cayman_dma_set_wptr
>   };
>  =20
> -static struct radeon_asic_ring cayman_uvd_ring =3D {
> +static const struct radeon_asic_ring cayman_uvd_ring =3D {
>   	.ib_execute =3D &uvd_v1_0_ib_execute,
>   	.emit_fence =3D &uvd_v2_2_fence_emit,
>   	.emit_semaphore =3D &uvd_v3_1_semaphore_emit,
> @@ -1760,7 +1760,7 @@ static struct radeon_asic cayman_asic =3D {
>   	},
>   };
>  =20
> -static struct radeon_asic_ring trinity_vce_ring =3D {
> +static const struct radeon_asic_ring trinity_vce_ring =3D {
>   	.ib_execute =3D &radeon_vce_ib_execute,
>   	.emit_fence =3D &radeon_vce_fence_emit,
>   	.emit_semaphore =3D &radeon_vce_semaphore_emit,
> @@ -1881,7 +1881,7 @@ static struct radeon_asic trinity_asic =3D {
>   	},
>   };
>  =20
> -static struct radeon_asic_ring si_gfx_ring =3D {
> +static const struct radeon_asic_ring si_gfx_ring =3D {
>   	.ib_execute =3D &si_ring_ib_execute,
>   	.ib_parse =3D &si_ib_parse,
>   	.emit_fence =3D &si_fence_ring_emit,
> @@ -1896,7 +1896,7 @@ static struct radeon_asic_ring si_gfx_ring =3D {
>   	.set_wptr =3D &cayman_gfx_set_wptr,
>   };
>  =20
> -static struct radeon_asic_ring si_dma_ring =3D {
> +static const struct radeon_asic_ring si_dma_ring =3D {
>   	.ib_execute =3D &cayman_dma_ring_ib_execute,
>   	.ib_parse =3D &evergreen_dma_ib_parse,
>   	.emit_fence =3D &evergreen_dma_fence_ring_emit,
> @@ -2023,7 +2023,7 @@ static struct radeon_asic si_asic =3D {
>   	},
>   };
>  =20
> -static struct radeon_asic_ring ci_gfx_ring =3D {
> +static const struct radeon_asic_ring ci_gfx_ring =3D {
>   	.ib_execute =3D &cik_ring_ib_execute,
>   	.ib_parse =3D &cik_ib_parse,
>   	.emit_fence =3D &cik_fence_gfx_ring_emit,
> @@ -2038,7 +2038,7 @@ static struct radeon_asic_ring ci_gfx_ring =3D {
>   	.set_wptr =3D &cik_gfx_set_wptr,
>   };
>  =20
> -static struct radeon_asic_ring ci_cp_ring =3D {
> +static const struct radeon_asic_ring ci_cp_ring =3D {
>   	.ib_execute =3D &cik_ring_ib_execute,
>   	.ib_parse =3D &cik_ib_parse,
>   	.emit_fence =3D &cik_fence_compute_ring_emit,
> @@ -2053,7 +2053,7 @@ static struct radeon_asic_ring ci_cp_ring =3D {
>   	.set_wptr =3D &cik_compute_set_wptr,
>   };
>  =20
> -static struct radeon_asic_ring ci_dma_ring =3D {
> +static const struct radeon_asic_ring ci_dma_ring =3D {
>   	.ib_execute =3D &cik_sdma_ring_ib_execute,
>   	.ib_parse =3D &cik_ib_parse,
>   	.emit_fence =3D &cik_sdma_fence_ring_emit,
> @@ -2068,7 +2068,7 @@ static struct radeon_asic_ring ci_dma_ring =3D {
>   	.set_wptr =3D &cik_sdma_set_wptr,
>   };
>  =20
> -static struct radeon_asic_ring ci_vce_ring =3D {
> +static const struct radeon_asic_ring ci_vce_ring =3D {
>   	.ib_execute =3D &radeon_vce_ib_execute,
>   	.emit_fence =3D &radeon_vce_fence_emit,
>   	.emit_semaphore =3D &radeon_vce_semaphore_emit,
>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
