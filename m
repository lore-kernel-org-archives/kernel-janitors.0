From: Wolfram Sang <wsa@the-dreams.de>
Date: Thu, 21 Jul 2016 06:27:26 +0000
Subject: Re: [PATCH 5/9] staging: ks7010: Delete unnecessary uses of the variable "retval"
Message-Id: <20160721062726.GC1664@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="hOcCNbCCxyk/YU74"
List-Id: <kernel-janitors.vger.kernel.org>
References: <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <6a8f4258-188e-36f6-28fa-1626c29cf361@users.sourceforge.net>
 <alpine.DEB.2.10.1607172056220.3177@hadrien>
 <20160720155333.GE1688@katana>
 <b249584b-47b8-ffd9-432e-986d69260ff1@users.sourceforge.net>
In-Reply-To: <b249584b-47b8-ffd9-432e-986d69260ff1@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >>>  	if (atomic_read(&priv->sleepstatus.status) =3D=3D 0) {
> >>>  		rw_data =3D GCR_B_DOZE;
> >>> -		retval =3D
> >>> -		    ks7010_sdio_write(priv, GCR_B, &rw_data, sizeof(rw_data));
> >>> -		if (retval) {
> >>> +		if (ks7010_sdio_write(priv,
> >>> +				      GCR_B,
> >>> +				      &rw_data,
> >>> +				      sizeof(rw_data))) {
> >>
> >> A multi-line function call in an if test does not look nice at all.  T=
he
> >> original code was an easy-to-read expectable pattern.
> >=20
> > I agree. I am not strict on the 80 char limit, especially in cases like
> > the above.
>=20
> Would you try an other source code formatting for the suggested change pa=
ttern?

I don't understand the question?


--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXkGtOAAoJEBQN5MwUoCm2QW0QAIyUqpTjk8rk0C8oTof+yn1+
+y0emZiCi+z2jHkr9tB2vo/X5Upf/uEFL98RIiXBwPxqfpIV+xEAeZlE1r+yh2AT
9Io621ev8cGxLL9NmMQ7AjbUqAhlEbTflWMMN+2XYHdEk9U6fOl+b1eJLZq752tP
cGnysW/LbJG5L6MFkFByGowcwJiEn+hth3MwRn5zg/fmkFZ8GbqEiFAo5adHqeWH
QlZtTOwmLsMDwlc9W/iAeTF7fxp1KiWIHVqr+taPY5iHUwdr6SBkGexMBFWrS4LK
04ZqAw0LP5PDYlaz1CmgkrAZv3DRKXcoezpbDWt5IO6bOlgNluPkZFylrTZhZFRn
Pt/EkNk2JfM3NxG+zjictETrlUYs4O8o6ARnYWJPlF5Uw+avs/X7NLu7uCeXvCYp
EhMu9ynDtKV2r/1BOMOZuNYK01k7+4bWXtUam9Wy2gGSZ1Go8JBvthaxM+7dUPrA
ianVMS/+Bvuaou7pIwIw3qScRyzfIE58tmgJhADsXLbgz1VtJonXquMHWTYvw7k7
GcZeTPwBeIFqKD87HbY3JyLl2fUqsAy6ky6cGvgiE5MgndioAc0SUiMt+SNOdzOW
Gs7/leTqdk8CQSjc5GstLp7A/gToabcRi18hZo3R9Am4gekYmt3jARkXmW/z6jkW
/0740voSlBt9PMdS6/Nq
=NAlf
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--
