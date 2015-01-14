From: Felipe Balbi <balbi@ti.com>
Date: Wed, 14 Jan 2015 22:45:25 +0000
Subject: Re: [patch 5/6] usb: gadget: uvc: make a bunch of stuff static
Message-Id: <20150114224525.GX16533@saruman>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="EqJFqkXZidocywul"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150114210352.GE23203@mwanda>
In-Reply-To: <20150114210352.GE23203@mwanda>
To: kernel-janitors@vger.kernel.org

--EqJFqkXZidocywul
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2015 at 12:03:52AM +0300, Dan Carpenter wrote:
> Sparse rightly complains that these things should be static since they
> are only used in the one .c file.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

fails to apply on top of my testing/next

checking file drivers/usb/gadget/function/uvc_configfs.c
Hunk #1 FAILED at 43.
Hunk #2 FAILED at 135.
Hunk #3 FAILED at 161.
Hunk #4 FAILED at 718.
Hunk #5 FAILED at 795.
Hunk #6 FAILED at 947.
Hunk #7 FAILED at 973.
Hunk #8 FAILED at 1017.
Hunk #9 FAILED at 1260.
Hunk #10 FAILED at 1311.
Hunk #11 FAILED at 1334.
Hunk #12 FAILED at 1544.
Hunk #13 FAILED at 1582.
Hunk #14 FAILED at 1606.
Hunk #15 FAILED at 1757.
Hunk #16 FAILED at 1789.
16 out of 16 hunks FAILED

please rebase on that branch.

--=20
balbi

--EqJFqkXZidocywul
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUtvGFAAoJEIaOsuA1yqREYrkP/1TcaJUspfGwFZ6+jNFFp+Z5
8EhNY0H8QHMUdpNfEaAE/eReNneQNTYXKbc1xBgbL/VhF4f7jfC6GxpRusyLB/ay
7ykqdELc0iqilgRo6AAIzoYkwGkRK/D/oz6aMMmzWGbXtsmEXXMjMavGxRO9dXp5
fdN5hum0cPrEwNBlSt+G7kCLVgGMdpc7o6XgpvNEz8XokdS8U0eHi8G8OUN4eCsQ
+OaCEg+Kq6tKMvqhkPZnBmrhTtpp20pcDVGikunZzefHx2xFkOtDvppW3RCg1HOf
GE4mulYWSTimWCgHduNmsWuITBi/MLRQQ95euhY73QZGqo6DviOXVnTCNSDqhWTU
IkKemVgfb/96cM3M7HDSkqM46KRb1klxXl+gAk6DJkF243Wx1hzYFwezsNIaKD0X
0e7Zqmfb0mO94oVe2BGle9Hcsl8mQWQ5HMXefM+yV8kXjyWh3KltHoXsV+aYnZbv
PotSAsG9v+y375z6eHRKTf4Mg7pHnMZ5bkWm0Whht24vs7yntXESS2wZ5uba9g9F
+VebFGVS+rO+s9/0fKNM8TLI3QmyNG0nD5tNcayrU8U8wIVhUvetXQJOtBa6o8IG
Tln2t27tte5vYiqhVhoPepuNltfUlruJoIrtmPU0x6icl1OzAQ6S7Re8Fcyc5d4E
lLJpCMAA/m4sy+ut4Qhx
=pqh2
-----END PGP SIGNATURE-----

--EqJFqkXZidocywul--
