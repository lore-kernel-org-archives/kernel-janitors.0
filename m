From: Eric Anholt <eric@anholt.net>
Date: Fri, 22 Mar 2019 21:30:07 +0000
Subject: Re: [PATCH] drm/v3d: fix a NULL vs error pointer mixup
Message-Id: <87ftre38dc.fsf@anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190321062731.GC21489@kadam>
In-Reply-To: <20190321062731.GC21489@kadam>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

--=-=-=
Content-Type: text/plain

Dan Carpenter <dan.carpenter@oracle.com> writes:

> The drm_gem_shmem_create() returns error pointers and v3d_bo_create() is
> also supposed to return error pointers.
>
> Fixes: 40609d4820b2 ("drm/v3d: Use the new shmem helpers to reduce driver boilerplate.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Sigh, error pointers are the worst.

Reviewed, and applying to drm-misc-next.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlyVU98ACgkQtdYpNtH8
nugzshAArfO6xZd+OAAq2ENQfssmNZK7k2Q/SovgJAPCTQrgfbngXVTosloyAsVD
voiI8Y2E11iLv8qk7XVCYn42HScObPJ+a90an7+fG7DFmiz+d2j+o34ZhUhHqEB1
B7XXIsdnYdydKYHW1USna7fXKXxLE0qp8T6AUnzEojNfgxiUCmTmEvu5OcN6xDzw
/DS5MSe+Ns4OvlN6JJvUehuvmY9NHGgVOCT2CVvYOxtNKSySYOlyDm59qXcLcef6
O8ndNBOP6pIeNuh7k1bmPZAuSAgwf9c9ltChqmGr3DKa3HUMn6NgkTCoUXTy6qT8
/Jz1tbo/zJWto0uEieXZEm6hEcxgMelRwStpx0MQ/xAoW+8RpZAc9Oxp2/pt99Ko
6/J3olHqDch/vhMAVLliPuH8LaYmFK4j1HgrOy1IhgNC6r50Gp7h310tLr9/3jjQ
sRc8fg3JLw8iBB3atYqysE+1Nwag3NhXwek6+6fF+7LXhHJo0DAKMTf7VchtPVgw
9oag5UjqarMuiiih7KbLdH2sc7Jk58A+tfa5IQyjAhNhbfO0s5IDEytMqN4Vv1yi
HLkQPdwza7Xe0CJAFSDowSO/F5r41OgbV4ygk7+xC1hQ9Bf63mjCJop0LVEiStv3
XPiCc82k2OXe8tdM9fsGXKvro+HskOAnILrReEdy4RUVE8iHfKE=
=224e
-----END PGP SIGNATURE-----
--=-=-=--
