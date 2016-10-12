From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 11:12:53 +0000
Subject: Re: [patch] drm/savage: dereferencing an error pointer
Message-Id: <1ae72fbd-5dcb-a65d-f348-c162231b9ba0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012062227.GU12841@mwanda>
In-Reply-To: <20161012062227.GU12841@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

> A recent cleanup changed the kmalloc() + copy_from_user() to
> memdup_user() but the error handling wasn't updated so we might call
> kfree(-EFAULT) and crash.
>=20
> Fixes: a6e3918bcdb1 ('GPU-DRM-Savage: Use memdup_user() rather than dupli=
cating')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/gpu/drm/savage/savage_state.c b/drivers/gpu/drm/sava=
ge/savage_state.c
> index 3dc0d8f..2db89be 100644
> --- a/drivers/gpu/drm/savage/savage_state.c
> +++ b/drivers/gpu/drm/savage/savage_state.c
> @@ -1004,6 +1004,7 @@ int savage_bci_cmdbuf(struct drm_device *dev, void =
*data, struct drm_file *file_
>  		kvb_addr =3D memdup_user(cmdbuf->vb_addr, cmdbuf->vb_size);
>  		if (IS_ERR(kvb_addr)) {
>  			ret =3D PTR_ERR(kvb_addr);
> +			kvb_addr =3D NULL;
>  			goto done;
>  		}
>  		cmdbuf->vb_addr =3D kvb_addr;
>=20

Thanks for this update suggestion.

Can it be that I offered an other approach for a corresponding software cor=
rection
by the update step =93[PATCH 2/2] GPU-DRM-Savage: Less function calls in
savage_bci_cmdbuf() after error detection=94 (on 2016-08-18)?

https://patchwork.kernel.org/patch/9289183/
https://lkml.kernel.org/r/<c97563c0-d463-8b15-5956-26d93641a54f@users.sourc=
eforge.net>

Will this one become worth for further development consideratons once more?

Can the shown resetting of an error pointer to a safe null pointer be omitt=
ed
in such use cases when the jump targets will be accordingly configured as i=
t is
desired for efficient exception handling implementations?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
