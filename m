From: Eric Anholt <eric@anholt.net>
Date: Mon, 21 May 2018 17:49:52 +0000
Subject: Re: [PATCH] drm/v3d: Checking for NULL vs IS_ERR()
Message-Id: <871se4ew5b.fsf@anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180518081041.GC28335@mwanda>
In-Reply-To: <20180518081041.GC28335@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

--=-=-=
Content-Type: text/plain

Dan Carpenter <dan.carpenter@oracle.com> writes:

> The v3d_fence_create() only returns error pointers on error.  It never
> returns NULL.
>
> Fixes: 57692c94dcbe ("drm/v3d: Introduce a new DRM driver for Broadcom V3D V3.x+")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to drm-misc-next.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlsDBsAACgkQtdYpNtH8
nug4jA//UOkxnJFP3HNK3x5GTClC0bpiN5ccqR19lHiVr+K1UEHBcJ4tWi4HIDP7
o8YoQcq0oNh95Xx+ACvOsRNHUnWud/T5jYfiE/6B4ZCBtr0k5zFoRzlISYlSFYbD
asWX03wetCZaiYVYQF18iaLPA/1PQfaeG8QmScLsTQ2UFS2mUTXpISlbqiMl1upO
ScjpgxxlTw2+OFg5kg77NtO6bEZMmWdhbGJ7Zk0w4WhWJPj9j+pn3HfCg8vP6jG0
wI+h7i5FliTmwx1+WaQvK+0fawVtb7eFYrjNL772+B7Bk/pa3O/BaEg1J1f1RLKq
LeJc46RXOv+h9KNGhmdxwN3JH9PvZadRUTjZ5yNmOEx0wvH1hXMs8kRFtq4QKy1a
bOFNqDKgM20Odlz8F23IV5/aup7BT3GHKQjpZKv/kws5FfFeTwMn0g2MDWBdd/Uq
H0Dejb1aDgrUkuNUvHnA8QhyLlq7WDw6pv0t5QzThCfw7FDmJw/Wv3RueofOfeoA
6/YS121kHpHFqNi4ADwb2JDsJrn3Vos6ebFKtSYMEnFFZ+JFPdmELaeepJAINQlE
EAM1fzHGL9GXVbPmqa61xlrUVjfdG8OI+uGZFO7RQIEw/16PMzrJkHXvwrXAVeYd
4yDRAJL6ZwBHcVXm2ialQuLe3zjFmAZTTAB/q4YzEOrwC2JpGZE=
=Uqdc
-----END PGP SIGNATURE-----
--=-=-=--
