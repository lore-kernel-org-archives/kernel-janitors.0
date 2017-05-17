From: Michael =?UTF-8?B?QsO8c2No?= <m@bues.ch>
Date: Wed, 17 May 2017 20:46:24 +0000
Subject: Re: [PATCH] ssb: Delete an error message for a failed memory allocation in ssb_devices_register()
Message-Id: <20170517224624.6c0ababc@wiggum>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/3NKyh0L4FCB7DavzxlEmnj3"
List-Id: <kernel-janitors.vger.kernel.org>
References: <b8db3326-5f45-04c0-a6c3-d5183d602e8d@users.sourceforge.net>
In-Reply-To: <b8db3326-5f45-04c0-a6c3-d5183d602e8d@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

--Sig_/3NKyh0L4FCB7DavzxlEmnj3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 17 May 2017 18:22:49 +0200
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 17 May 2017 18:12:16 +0200
>=20
> Omit an extra message for a memory allocation failure in this function.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-R=
efactor_Strings-WSang_0.pdf
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/ssb/main.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/ssb/main.c b/drivers/ssb/main.c
> index d1a750760cf3..65420a9f0e82 100644
> --- a/drivers/ssb/main.c
> +++ b/drivers/ssb/main.c
> @@ -480,7 +480,6 @@ static int ssb_devices_register(struct ssb_bus *bus)
> =20
>  		devwrap =3D kzalloc(sizeof(*devwrap), GFP_KERNEL);
>  		if (!devwrap) {
> -			ssb_err("Could not allocate device\n");
>  			err =3D -ENOMEM;
>  			goto error;
>  		}


This looks good.

Acked-by: Michael B=C3=BCsch <m@bues.ch>


--=20
Michael

--Sig_/3NKyh0L4FCB7DavzxlEmnj3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEihRzkKVZOnT2ipsS9TK+HZCNiw4FAlkctqAACgkQ9TK+HZCN
iw5Yqg/6AoY516vC7dll5a5fLtmYr1x+2K/VmsgB8AXRmH41O8SLxPWULs5qwt8z
0gbKjjNYLpDmtd2ccDJLdTSbVoXFqWoioo/ZmL5OpYTemnwQUykqcEVoDaxxov9d
QsC7XB+hjYRtpqTWOcgg+s64claX5rpXrbqBDj/szZCpdrC0dis6I1E02eYOT4z2
/RcK4OzYM8Tze3JZboUBV/IyMpsfk2kakpFuXMDHWz8+R26478ry3E0Gkm214vKl
NPc9Bq2vZPPB1eS8v1IPeYPU5fo9BHkuwrVfOTCTKs2s0vGXvn39QmPcRdjh5ebt
Ozg7ciI6sKQq9x+RCfaq1huPMH/TYIZiCRC6MqsW4s9OMTdK4NVgmpbDu2MWgWNd
WXBNaMaKmVXsxSo2FiIbwP+g4K39k4TRB5N/hMMv3aMLoEFy2w6AJ2iPk9h6GgWi
EVwQEYPL17rvzrxNS+FmAsBp44founfigDDNt/F6Jn/XkbKHW9x1ZHQmr0XDsbx7
NwqhLcs8wL0eFVZJPihPI+Fk2pF/JwrxXcYbUTtjbsPBV7YjlnEfMzmP2ctuSjTF
iicvp55063ZSeIXFhrfA1pZHNufdeHO6asgSZqIFONEO7FWjGOzlmSh4sSBIMqVb
YlSqgqJuV1KCYmhS9vAcDaWfpoRsFTvgTjA4s86LcL5r90I1rEo=
=yfrG
-----END PGP SIGNATURE-----

--Sig_/3NKyh0L4FCB7DavzxlEmnj3--
