From: Paul Menzel <paulepanter@users.sourceforge.net>
Date: Tue, 22 Jan 2013 09:42:25 +0000
Subject: Re: [patch] drm/nouveau/disp: sizeof() wrong pointer
Message-Id: <1358847745.17068.7.camel@mattotaupa>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-I9+2ZMRC27aHVtCSgvQN"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130122072022.GB8966@elgon.mountain>
In-Reply-To: <20130122072022.GB8966@elgon.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org


--=-I9+2ZMRC27aHVtCSgvQN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Dan,


Am Dienstag, den 22.01.2013, 10:20 +0300 schrieb Dan Carpenter:
> "data" is a void pointer and "args" is "data" after we have casted it to
> a struct.  We care about the sizeof the struct here.  Btw, sizeof(*data)

s,sizeof the,size of the,

> is 1.

Did you find this by manual inspection or did you use some tool?

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

[=E2=80=A6]


With the typo fixed above,

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-I9+2ZMRC27aHVtCSgvQN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAlD+XwEACgkQPX1aK2wOHVitMwCfUdvpCwPHEwLdyCjWLigsxotP
zxQAn148I2yPUlWonvEyWbIjCpWm6C22
=qaUL
-----END PGP SIGNATURE-----

--=-I9+2ZMRC27aHVtCSgvQN--

