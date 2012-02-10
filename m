From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 10 Feb 2012 06:59:52 +0000
Subject: Re: [PATCH v2 00/17] Some work on quickstart driver in staging
Message-Id: <20120210070103.GC4204@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="E13BgyNx05feLLmH"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326320574-11220-1-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326320574-11220-1-git-send-email-szymon@janc.net.pl>
To: kernel-janitors@vger.kernel.org


--E13BgyNx05feLLmH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 09, 2012 at 09:14:18PM +0100, Szymon Janc wrote:
> > Also, you just created the following build warning, please send me a
> > patch fixing it up:
> >=20
> > drivers/staging/quickstart/quickstart.c: In function
> > =E2=80=98quickstart_acpi_ghid=E2=80=99: drivers/staging/quickstart/quic=
kstart.c:212:5:
> > warning: format =E2=80=98%u=E2=80=99 expects argument of type =E2=80=98=
unsigned int=E2=80=99, but argument
> > 3 has type =E2=80=98acpi_size=E2=80=99 [-Wformat]
>=20
> acpi_size is u32 or u64 depending on arch, is it ok to just cast it to=20
> unsigned int for printing?

I don't get this warning on linux-next so I haven't looked at the
code, but unsigned long would be more normal I think.

regards,
dan carpenter

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPNMCuAAoJEOnZkXI/YHqRjp4QAKU6vK4saFtqhWSagbYIvDsO
Adx++LzejcaqcOY2ywWQJrfUkechZ039UKAetuPjfMLEPmrUBqFowp/2Oi2jkIdo
iHKF7s+PsbUqGLAwjOxDgxb3yZ3pjfgOAgvE8nn5XVbj3MjC15EgTof4Yi+p1z9L
yMv+bZY3DK8qYmmkUzyjKd+DtX1PyEn69O6dgjZznLaV1jT4tRWye7leQwqnG8L8
uDnnu6jeS0sJd4SbeYtwj9MEC5dprinpXg30PWv6WNU/tYwF57yaNwVKYCdu5fbi
QTjCkiFryZPTD9j0f53RrjtEXyM4qQWsrOd4F+Me3ozlLipKjy5cC49BecgRvIax
UsJqdn7Xqxh6hkcLShQ6xrm/CJjlM1uKErumgFjD4VLJewkxe8cMMtqhw7VMTZH9
UqK1UOivJIpgpZJFab9Ja+IDxu9KJpKlBPuRr/1LcaYBz9SQp441v/m3Jzq8rnvS
UHvNrUCcvIl9MFsHPzx27E/Bw+o0I3Zo6D98k6ou/4iLAoLXzx0+UhkHjar/SzLe
3lN8wlS5430AkJJJpe6ECpA3XnqSQdYEzG+Z+0Y8+5uumf3/Y5VqTJbZA7ODNTFQ
Ykv2LSVDZKu36mxaLKXn1hIWkukGa2iXTnXzbtgehDZARaiH9ox1q/EfrQzOQ5qW
TVC02ugVJYQLp5MUdcjy
=fGNH
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--
