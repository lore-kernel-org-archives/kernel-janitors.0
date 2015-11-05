From: Eric Anholt <eric@anholt.net>
Date: Thu, 05 Nov 2015 01:40:12 +0000
Subject: Re: [patch] drm/vc4: checking for NULL instead of IS_ERR
Message-Id: <87h9l1441v.fsf@eliezer.anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151104132140.GA20966@mwanda>
In-Reply-To: <20151104132140.GA20966@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

--=-=-=
Content-Type: text/plain

Dan Carpenter <dan.carpenter@oracle.com> writes:

> vc4_plane_init() returns an ERR_PTR on error, it doesn't return NULL.
> This was obviously intended because the next lines call
> PTR_ERR(primary_plane) already.
>
> Fixes: c8b75bca92cb ('Eric Anholt <eric@anholt.net>')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pulled this patch, should get it into 4.4.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWOrN8AAoJELXWKTbR/J7oDdYP/0UAfqfB/gGnC+zKD9zJG605
+ZeYwCBYlcaord9nBXV8j7EuYoZUeu98aKq/sOgD26sKy2cpccSl4Q1+vZhNl3PO
Gy8Quu+kdB1jmkpVDQO9c7Z7WKudLmuzQozeoLphgqx77ppmTj9Sx63LFpbZujeJ
DlSe57cO8ohymwDg4oUJlByKAG/qLBVbzVaK2h8l+Lalt4o/eu3PjHCvnpHb0O1t
pLQYfVbdbAmkReDho7y12OevO384Pw6MLCh86FXELzDfcHdQvZV5yYY4w6Wj/O17
O3pHPOC4LZDvjCNmC4SIjXiBjbG6C/lwVyu3oIT8POz0/l/0kOIlJeplbIlzNqPZ
sfU8fQBVTrPJwlQmq5lGYYTm7Orq9KkMNNJZrmQwZaMeS5O2le30qZZvKvFkbMlc
zHb03V1zMl4jONDI5Nis0Rh2EUk+cI43baH12rHWLeoN1IW+JPW4uTm++YjmNCdp
l7YQyeDfOZM2GNDsDIv5flXhk3d2Fc0AK3wioN/REKsnmhTVyYOdrR1YQDD47ppo
fpYtzFxDQBa1yyY/y/Lu6eCfy8H5BaMwMjp8R/XzYHnHG9hFWlPjiE0hYFdAfRQ3
4cKLNDh2/5asnzvuwEnoyl6c9ifub3ItN5Uxv+RM1NfOO8reNAN0YaFosf0kDl9z
fBugELWwrdVPeJsOtNC7
=W56J
-----END PGP SIGNATURE-----
--=-=-=--
