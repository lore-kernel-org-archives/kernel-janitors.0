From: Jaegeuk Kim <jaegeuk.kim@samsung.com>
Date: Mon, 21 Jan 2013 09:20:01 +0000
Subject: Re: [patch] f2fs: use _safe() version of list_for_each
Message-Id: <1358760001.8234.150.camel@kjgkr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-mVzLkufZ6Pn58kDADyt2"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130120150258.GB32551@elgon.mountain>
 <20130121083245.GA11592@core.coreip.homeip.net>
In-Reply-To: <20130121083245.GA11592@core.coreip.homeip.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--=-mVzLkufZ6Pn58kDADyt2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2013-01-21 (=EC=9B=94), 00:32 -0800, Dmitry Torokhov:
> On Sun, Jan 20, 2013 at 06:02:58PM +0300, Dan Carpenter wrote:
> > This is calling list_del() inside a loop which is a problem when we try
> > move to the next item on the list.  I've converted it to use the _safe
> > version.  And also, as a cleanup, I've converted it to use
> > list_for_each_entry instead of list_for_each.
> >=20
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > Static analysis stuff.  Untested.  Please review carefully.
>=20
> Makes sense to me.
>=20
> Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>=20

No doubt, applied.
Thanks,

--=20
Jaegeuk Kim
Samsung

--=-mVzLkufZ6Pn58kDADyt2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJQ/QhBAAoJEEAUqH6CSFDSDloP/396aN54a3isOyAyE7hXuS3N
I7P3ToiW19Fag2w+g1/Xip/XBMUST8FOKKL0A1IHXvmLy6DrXruYt/SmHs8MqtWu
DAGC3ZXnZ1RAqKuqrH76xeonWYkn5QY2IVsUnS4wXYyWN7GfdwEv1Sn1VhOWDLho
qPApZGLkqPmhTgyr8uujIcp/CKtoXLpCzJTYxIfBvn7WxgYC/X082yPJOcDEFpAu
2IN+F8KnZ0wUv9PggdRhEet7qj5WJKd9KSpLtJPhZbNAS9HMjHS8JIWlmc8n0Srk
5Jc4BXceNbBUJETYumA3kr/KyfIerU9uD3okJEZ1lXLZVww6i5vr5LEjkv2BrOUd
LFM6UipSCrjaOprW70Vzs7pFAt3H5JZq2LipT1nsTeAEHJZ4y+khl/Eh4f0Z55NS
gulUYjoi2Qt8jwnaGcLiiUqhgUiYovslVoEUq7UtqJOzyqhQtNUMvbGsCn9n8RAo
ifz8yQ56Uie3z+Jqla+w5XDFLUSZE+mS4cKKkyZcvYxJ2cf34WQyBE14FIUA4s+W
q2z0CWw8heGTQN4cVsRWVHO09FDZ3SA1DdNZD5f6j8sYZTcRFn9/VoC+WnQRWkqD
v0LPAegIdsNPY5pFLARNiP0mLgnLyjGu3kNVyp++4V0tFQFdUAh2n3UEaq0i7bxG
XdkR6uvg9pZoyvbHbQXf
=wF50
-----END PGP SIGNATURE-----

--=-mVzLkufZ6Pn58kDADyt2--

