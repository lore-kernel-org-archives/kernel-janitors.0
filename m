From: Eric Anholt <eric@anholt.net>
Date: Wed, 10 May 2017 18:15:07 +0000
Subject: Re: [PATCH] drm/vc4: Fix resource leak in 'vc4_get_hang_state_ioctl()' in error handling path
Message-Id: <87mvak1sus.fsf@eliezer.anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170510035356.24415-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170510035356.24415-1-christophe.jaillet@wanadoo.fr>
To: airlied@linux.ie
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:

> If one 'drm_gem_handle_create()' fails, we leak somes handles and some
> memory.
>
> In order to fix it:
>   - move the 'free(bo_state)' at the end of the function in the error
>     handling path. This has the side effect to also try to free it if the
>     first 'kcalloc' fails. This is harmless.
>   - delete already allocated handles
>   - remove the now useless 'err' label
>
> The way the code is now written will also delete the handles if the
> 'copy_to_user()' call fails.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch also add the 'vc4_free_hang_state()' call in the error
> handling path. It sounds logical to me, but I'm not sure of it.
> ---
>  drivers/gpu/drm/vc4/vc4_gem.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index e9c381c42139..891c7a22cf81 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -111,8 +111,8 @@ vc4_get_hang_state_ioctl(struct drm_device *dev, void=
 *data,
>  					    &handle);
>=20=20
>  		if (ret) {
> -			state->bo_count =3D i - 1;
> -			goto err;
> +			state->bo_count =3D i;
> +			goto err_free;
>  		}
>  		bo_state[i].handle =3D handle;
>  		bo_state[i].paddr =3D vc4_bo->base.paddr;
> @@ -124,13 +124,16 @@ vc4_get_hang_state_ioctl(struct drm_device *dev, vo=
id *data,
>  			 state->bo_count * sizeof(*bo_state)))
>  		ret =3D -EFAULT;
>=20=20
> -	kfree(bo_state);
> -
>  err_free:
> -
>  	vc4_free_hang_state(dev, kernel_state);
>=20=20
> -err:
> +	if (ret) {
> +		for (i =3D 0; i < state->bo_count; i++)
> +			drm_gem_handle_delete(file_priv, bo_state[i].handle);
> +	}

vc4_free_hang_state() has freed the state pointer you're using here.
Also, I think you'd have a NULL deref from the goto err_free in the
!bo_state error path.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkTWKsACgkQtdYpNtH8
nujELQ/2KCjK/V+l/cEUTSQGlsvLdaFeAI5S44IQBHm7m3LKHUqjW4DIWh6xl31B
zsjcQs59gbidOvPc9yyvz+bye+JMkRm8kXspv7YKBaXgqgEdWud979Acy9fKNRft
aeLptxw4uXVxEh8tnLe9yyZVvw/vyreJxFRbkr4mv7XqGASz5HEZlaDv2+B8g6vp
JwHPF1FAU3rP/LpNadTtd0rLlXubtvSZelWTuYZFtHc8xtty/XyXJ79oz8FjPfpy
ED9pc4NIbC0xcv1fTx6WbPxJkhYPunH+dIo54gzeWw5KL7jNPFeKNVh7WnJTBAp9
rQVQc0G+smt2VYfnVReT+jHRgtW2SVoX+6nr3bDVW+YMDCPsGBYR3ULdgzp/Jv9u
HO9reamjXVZsSa6dDJfo5UeMvC2VqUY+E3PlHUl6Y3EnAWjb4iiVEL3lWrEG3w3A
IgjZTErJMmuPLc6Ky/9FnPhriAmem21ANHraiD3d1jCH9P013xt+3kSc0oeZsJdT
Qiay7LYFaMnDOIWTPbGyNbhIbi09Kr2lXJTmxJtMRMxbmFpUqJJ8rlCicHpzUh4w
U5hewjsg7XxRz0lSPFrUxnfqxQMtTe+P63oV1RfDTX1cpu0kL1QcLbKSTGMGz9pI
KGFW9pccIwIAx49zH2uunGVeM4UiuF52DLd+aAKTvAmjsmth9w==
=fkfD
-----END PGP SIGNATURE-----
--=-=-=--
