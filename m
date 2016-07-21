From: Wolfram Sang <wsa@the-dreams.de>
Date: Thu, 21 Jul 2016 16:37:14 +0000
Subject: Re: staging: ks7010: Delete unnecessary uses of the variable "retval"
Message-Id: <20160721163714.GB1616@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nVMJ2NtxeReIH9PS"
List-Id: <kernel-janitors.vger.kernel.org>
References: <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <6a8f4258-188e-36f6-28fa-1626c29cf361@users.sourceforge.net>
 <alpine.DEB.2.10.1607172056220.3177@hadrien>
 <20160720155333.GE1688@katana>
 <b249584b-47b8-ffd9-432e-986d69260ff1@users.sourceforge.net>
 <20160721062726.GC1664@katana>
 <b221aadb-2af7-8d0f-ce8e-99b1efa31edd@users.sourceforge.net>
In-Reply-To: <b221aadb-2af7-8d0f-ce8e-99b1efa31edd@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2016 at 03:35:03PM +0200, SF Markus Elfring wrote:
> >>>>>  	if (atomic_read(&priv->sleepstatus.status) =3D=3D 0) {
> >>>>>  		rw_data =3D GCR_B_DOZE;
> >>>>> -		retval =3D
> >>>>> -		    ks7010_sdio_write(priv, GCR_B, &rw_data, sizeof(rw_data));
> >>>>> -		if (retval) {
> >>>>> +		if (ks7010_sdio_write(priv,
> >>>>> +				      GCR_B,
> >>>>> +				      &rw_data,
> >>>>> +				      sizeof(rw_data))) {
> >>>>
> >>>> A multi-line function call in an if test does not look nice at all. =
 The
> >>>> original code was an easy-to-read expectable pattern.
> >>>
> >>> I agree. I am not strict on the 80 char limit, especially in cases li=
ke
> >>> the above.
>=20
> Will this line length limitation trigger any more collateral evolution
> in the discussed software module?
>=20
>=20
> >> Would you try an other source code formatting for the suggested change=
 pattern?
> >=20
> > I don't understand the question?
>=20
> Can you follow expectations around the proposed refactoring of any
> function implementations?

I don't understand both questions. Maybe you need to give examples?


--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXkPo6AAoJEBQN5MwUoCm2n4UP/0z1RddW9PiPqj8MkIEczAt9
wf3efhP8pQ822KN7TRU081C/jKex7bQ1BxhXCIhBVDca1ZJz2igDtZUbYCBbK/cT
uJhL531XbhLDmD3sXplKJbXZqHaGwAjFzkf931P3sSwajQGsQNLE+8SANElcYdjl
37hz1RRYMS7CAkmO1JgVyMIiTLsnpDtKr95x6V+bm63/fAzAz087OupTeL4GPnTu
j6uj99iSVerXPPlyAowtLET5bb+u08mupCFUf2EXtOh0zMlA2V5vag3Lj9jaD4Ut
d0K3oiabGgo+SqpAJch1H9o0Aa3Ihru903YoytgyaNSj/I2jtLMzI4P1JNtDBE2e
lt2+U8jUNr6ObwROOIZMDgPcVviDVmI4X61XLxcGqWHJwI7Wue4eOtcaCeG8XVVN
/2qXQa6oFuDpzSNlID4xAdtKwMqsW/Y4mgpcLrF6E90dBD2yar77bwB+Hy1icni5
yVlbxOtbLGPtjoq+Bb5DcH2p7+h9VX3VIcVxqPWaFD7U1+SQS3DRF72Qhn8CtNpC
YK3f30IMjD6NusGG3KbwWCC02irJpPWM1PBfZnI70skZhNuVyowfTrXtquFdgxeo
B/+jVqKst19sOvJjp21AebbDiQvQA49UHxXeRnxFOJISiWA0ecOxKAiQJN3F2syz
b6dWxL6Ksd9aXGe74B3F
=nX/e
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
