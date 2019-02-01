From: Pierre Moreau <pierre.morrow@free.fr>
Date: Fri, 01 Feb 2019 14:51:43 +0000
Subject: Re: [Nouveau] [PATCH -next] drm/nouveau: fix copy-paste error in nouveau_fence_wait_uevent_handler
Message-Id: <20190201145143.vwiljlpfa5waqyr7@pmoreau.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1542284042-153903-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1542284042-153903-1-git-send-email-yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Friendly ping, Ben.
I see that in `nouveau_fence_done()` there is a check on `chan` not being N=
ULL
prior to passing it to `nouveau_fence_update()`. Would something similar be
needed here?

Pierre

On 2018-11-15 =E2=80=94 12:14, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>=20
> drivers/gpu/drm/nouveau/nouveau_fence.c: In function 'nouveau_fence_wait_=
uevent_handler':
> drivers/gpu/drm/nouveau/nouveau_fence.c:156:27: warning:
>  variable 'chan' set but not used [-Wunused-but-set-variable]
>=20
> nouveau_fence_update should use rcu protected 'chan'
> rather than 'fence->channel'
>=20
> Fixes: 0ec5f02f0e2c ("drm/nouveau: prevent stale fence->channel pointers,=
 and protect with rcu")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/no=
uveau/nouveau_fence.c
> index d4964f3..91286d0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -157,7 +157,7 @@
> =20
>  		fence =3D list_entry(fctx->pending.next, typeof(*fence), head);
>  		chan =3D rcu_dereference_protected(fence->channel, lockdep_is_held(&fc=
tx->lock));
> -		if (nouveau_fence_update(fence->channel, fctx))
> +		if (nouveau_fence_update(chan, fctx))
>  			ret =3D NVIF_NOTIFY_DROP;
>  	}
>  	spin_unlock_irqrestore(&fctx->lock, flags);
>=20
>=20
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
