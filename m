From: Eric Anholt <eric@anholt.net>
Date: Mon, 14 Mar 2016 00:10:45 +0000
Subject: Re: [patch] drm/vc4: Return -EFAULT on copy_from_user() failure
Message-Id: <87egbd537e.fsf@eliezer.anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160308120941.GD28684@mwanda>
In-Reply-To: <20160308120941.GD28684@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, "Luis R. Rodriguez" <mcgrof@suse.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>

--=-=-=
Content-Type: text/plain

Dan Carpenter <dan.carpenter@oracle.com> writes:

> The copy_from_user() function returns the number of bytes not copied but
> we want to return a negative error code.
>
> Fixes: 463873d57014 ('drm/vc4: Add an API for creating GPU shaders in GEM BOs.')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pulled.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW5gGFAAoJELXWKTbR/J7o4S8QAKmM81nOWI/Ii32y0ti0r2xt
Eqr5UW1QsIi+JGI+g7lsv0m5z1k5ya7lS4gRxOcB4iwZfAzkVwdxLWwiyzk59jkk
a5FiYmBa/WigZ33wCdpg5Oc07BNRtSNnaYa1l9r2arxYUr8YGks/XnQ0I1XIq0e5
osgMG4WIBHyiYn7e7WIpjpVcD28AoGO+DJQdJH6ssyTBKBMYXRx/S3/YgeVbLe7p
/BGMeTZY6ScSCPNtGA2VY0JufSy8JabmA1Nl6lFSAYDuN/vmB38j/M/gZnjBZgi/
VxpuA/nIpJwWYDyxnPtW2DpD9WZaZHn6+tSGtRHhjVcHj6KJt7OZq9bmY4IM20qB
pOaMxORrU0QRQ82JglyVymI5kRbHM5a5liLnQALsIjg3Zwkt+eJqtk+0Mmfj/9TP
H9D7rQTep/JBxx2Lfvx3R36lhJpg5rJiNoUa61b3cS1pcqI/dLewCzE/ULKXIaHj
wmmCvK2m9L/Dozgqs6M1eU6skZRH5L8VM4YrR7jFxh6ZbNl+CxPrAhBY8BP4Yctf
PKEUwqL5sK/tL63qI8dEOtYNDO7SFJJYYmpMQj3j4ERBeqCB4uoFmmU9uKUJildA
8VUMvRJ+E0ktujnoPoSkRN/t7G4jtoAH0RMlXwXXYpQQzhxrCmzXgj/tt5AXXJFJ
ksQkUDD4Ti+DfJrtFln7
=PMmb
-----END PGP SIGNATURE-----
--=-=-=--
