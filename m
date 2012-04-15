From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Sun, 15 Apr 2012 09:47:21 +0000
Subject: Re: [patch] ASoC: dapm: release lock on error paths
Message-Id: <20120415094721.GA3806@opensource.wolfsonmicro.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ZGiS0Q5IWpPtfppv"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120413192543.GC18505@elgon.mountain>
In-Reply-To: <20120413192543.GC18505@elgon.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Liam Girdwood <lrg@ti.com>


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 13, 2012 at 10:25:43PM +0300, Dan Carpenter wrote:
> We added locking here but there were a couple error paths where we
> forgot to drop the lock before returning.

Applied, thanks.

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPipkQAAoJEBus8iNuMP3dkrcP/RUNludJq6NZ+TcVi7YLG75R
9AlBDoOE48ZSRSf2AsYqFjr1/o4w3iKwvCiBa/+MLzUeRA/Sx9NAbWennRVGBs3b
2IC4rnAz3g6+ozpTzexPzPxJwlCsqKdefs9A5CWNELmVcWV+tuMkIK9zIDZqVpcK
YsMt4NX10ZTYE3/laM/CRO0Fe0lOX06TtMlfi7Q1Q9JrcBCCyQnN/1Lao3P+ZXfv
bNZvKAuFrGSQgNZO/wiXD8wRsyOaj7FzTKvNtLJwiZUsUglpg4hMQlhkF5zlBKQL
e8AtbQbgPooWDMYG0za8qI0YDnCqtbICfVMXrPVVIBGsGHlasFZi+gM4uiSVEkOT
DLBKxB0HFMC4fNLM5+XtAyc7k/JBae4gn9TNjoxeSjdNuMNlkiDCplov8SQ0ho2V
C+VYkWRyf8b/FtCLOoxGLUe96EBIhIKlyCYKD0ArMJkCmSWep3rKNSJ0lm8fkAIC
tpJ5VsBZibq32xfz/CGcpbY3JM0ECtulPtgiIKD0jRRFXK/XjvVvL+jN7ry5RJZO
vEpE3eqhhWiPTwX69/hHapsvDnOraoNUHDlA51/xQYHfN5CfWP73h9HLqgEZFFDC
wrBx7XnOdv7eTRVcQ5osjJPdyBtAekGdr+0onc3dkwePMHSV6unOnrUdNhCGuF+E
UjPiPJxaM8M+Fe3LzG9K
=TMHC
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
