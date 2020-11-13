From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Fri, 13 Nov 2020 07:41:53 +0000
Subject: Re: [PATCH][next] drm/ttm: fix spelling mistake "swaput" -> "swapout"
Message-Id: <e83cb79d-0260-aa20-ae51-ac24f2fce719@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201112095013.53619-1-colin.king@canonical.com>
In-Reply-To: <20201112095013.53619-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Am 12.11.20 um 10:50 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a warning message, fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index e6bcbfe530ec..d32ca8734aa7 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1494,7 +1494,7 @@ int ttm_bo_swapout(struct ttm_operation_ctx *ctx)
>  =20
>   		ret =3D ttm_bo_handle_move_mem(bo, &evict_mem, true, &ctx, &hop);
>   		if (unlikely(ret !=3D 0)) {
> -			WARN(ret =3D -EMULTIHOP, "Unexpected multihop in swaput - likely driv=
er bug.\n");
> +			WARN(ret =3D -EMULTIHOP, "Unexpected multihop in swapout - likely dri=
ver bug.\n");
>   			goto out;
>   		}
>   	}
