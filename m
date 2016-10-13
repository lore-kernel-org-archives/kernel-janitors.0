From: Eric Anholt <eric@anholt.net>
Date: Thu, 13 Oct 2016 17:33:22 +0000
Subject: Re: [patch] drm/vc4: Fix a couple error codes in vc4_cl_lookup_bos()
Message-Id: <87h98g9msd.fsf@eliezer.anholt.net>
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

Looks good.  Waiting for rc1 to show up to put together a -next.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJX/8ViAAoJELXWKTbR/J7oi2AQAKmO490tvlfUCCpNNe6YMvTf
V1UQMzVc9yWfoTYG5Uy1JNGKiVLUQhY2FlOT8BIzkIFNpyAl3zr2/7DD1cHE6Bpi
LTPUgjT5nwjJKjRryFlakq9ds5PfYtC0M3Ted6XuKi/Mw4T1k4//CRmoTIOzk6Ni
V3pD4eSIpO1o1hOar2uzeoW/1SnC+BtlLsrS2BN6a164h2OmRriBYyS5H7ecRPxm
TKClX4otGg2CsNId7Rm6fbxPZrDEk4m/n9Mq7NzKjHZYHMC2wFvUEiBzHbJzWQ7r
ctM9MbXhNaFQMU2CaYomW4rxj2NyJeZeWhBRiUcS7qBgYtPp03YbH85V9VmU23SB
pNc9ttHBAoYerK7C37V1yxygsHALmYCSbNANCX1m/h9OUj/E/eOO+6bgu8ebXOdl
Lrj1ZNAT75IehloVwl26Jr8e3TZRs7NL7O21QDuYFMXo8zpovZCQVtKa51ZmWcHJ
07O720P9c++nkinjchIM4CfX3KNiqKwbksFTFc3pzKpuasbbjzwGlz6ZY3da9LBV
xRntYnvjeOJcVZwmHrpeN3xiwaRiQqxaHH7uG0Hp0f/ubnyC+LRlRh7tgIIiEWL0
Py9ZRKhjaxDb8d42aQu5t6xj8EkHTsLXiVu2GO5FpLU+pvA5q3QzD3FE89chOg7b
nFsZirBs2yQL5dXTuqNO
=3eS/
-----END PGP SIGNATURE-----
--=-=-=--
