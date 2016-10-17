From: Eric Anholt <eric@anholt.net>
Date: Mon, 17 Oct 2016 17:09:00 +0000
Subject: Re: [patch] drm/vc4: Fix a couple error codes in vc4_cl_lookup_bos()
Message-Id: <87oa2ikimr.fsf@eliezer.anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161013085431.GI16198@mwanda>
In-Reply-To: <20161013085431.GI16198@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

--=-=-=
Content-Type: text/plain

Dan Carpenter <dan.carpenter@oracle.com> writes:

> If the allocation fails the current code returns success.  If
> copy_from_user() fails it returns the number of bytes remaining instead
> of -EFAULT.
>
> Fixes: d5b1a78a772f ("drm/vc4: Add support for drawing 3D frames.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed and applied to drm-vc4-next.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJYBQWsAAoJELXWKTbR/J7oykUQALn2psB7nSVwK4WJk8I6j2jS
jqKJexVwwNQUFgocmK9NkIkyER/yDIuqKcVoIu6rKJJTeYs3s2ASQ5E8LVaNuld9
sEJtpjIf/cxxyE1n7csG6j/GgW75VibOrPoyuCVXr7pljMHLo/l9jmKI0rrNIObj
WQ9kqkQA7GUirMFezNSErpm7DADkV1LPwzhKOPSsU3JVLqpLNd9nQ+CAFj1YM5a7
GWICvg5YfwN5/4rIDPldjggKWsIMioYVtPCU6koWc0N9k/BxJiB9cCdmKGD5W6bo
rRl7pnCLZZZ+U9PtMmI4uLzlFIGzJMG4nxvj1R07mp0yXBXeKsABhSmg4CMoaBqg
KhFGpexR1KmClh4lTv37wtQJHVN2uvt/kWW+18DpALSHjOCM0f4iQVqtw2btV79D
uanz3W7LaMdBb8L2YCCR3cal6HL/fg3zOA3XNXMZSpymWMtP0IsSZuBsJi8q480s
+Aoix37uH2RSjl+KBAhF/PeesJ4oPbRUUcd1kuSlgdNNqnrDomlCcIhN6nSzsmLk
z5I96DLWEeY7Jq2IaeqLBJceF8Az+6AKx5+Nu6p6HBCm+WPTbCMxzjTshF0WzTda
r7gmwN0jOylQsu0N8N07m9SQtdWZjvgOnaDZUyroXqAYi3PzkA+1SzwHkqkZgrAC
2DwTH/ygZyyUhMtWLB3S
=AK+j
-----END PGP SIGNATURE-----
--=-=-=--
