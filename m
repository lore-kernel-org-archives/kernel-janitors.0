From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 18 Feb 2012 16:52:05 +0000
Subject: Re: newbie question
Message-Id: <20120218165205.GE2912@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="MZf7D3rAEoQgPanC"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAOD=uF4kGtMrHi4NOm=kntUzZWuoEOvHV+bB3RWuyDfkx46iZw@mail.gmail.com>
In-Reply-To: <CAOD=uF4kGtMrHi4NOm=kntUzZWuoEOvHV+bB3RWuyDfkx46iZw@mail.gmail.com>
To: kernel-janitors@vger.kernel.org


--MZf7D3rAEoQgPanC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 18, 2012 at 09:13:39PM +0530, santosh prasad nayak wrote:
> Thanks Dan for your quick response.
>=20
> Where to submit the changes ?  linux-kernel mailing thread ? or
> kernel-janitors mailing thread ?
>=20

Use the ./scripts/get_maintainer.pl script.  Mostly we don't CC lkml
unless there is no other devel list for the driver.

You may want to CC the first patch to kernel janitor list.
Everyone's first patch is always rejected and the kernel janitor
list is newbie friendly place to find out what you did wrong.  ;)

Btw.  Always CC the list.  I've added it back since there was
nothing private in this email.

regards,
dan carpenter


--MZf7D3rAEoQgPanC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPP9c1AAoJEOnZkXI/YHqRAXoQAKB8etW8rKK8cEFhjUxjh7Wa
c2oeIbcUG0bVFMKpaKROvyqrR0zt59+vm68QdOwvPurUgilI0MCbHm95s/AU4w7V
R5UcIZ2mx31mphq+MUvTkefRuMm1BSQVJ2p09aWfbTN0UPutQWYO1KM//JYz7T39
LnrLqn+thRYIMpeatbX+XwTVscaxJTB/6EDf0c+sNhFLAouaDw94ffBi+h/zJwmN
FlyiiuNwSzvU9mis4ix6obizurvULZyzUrhx7BYBqMTKUsTSibn1+7zzhXIYnSgg
Thq9ft655YOd+tAyYFg9tMxoo51iYRf8516qCImODkmiYnOppjhxShN7ZAsuTngb
52VjtTVDWKpxu2ZbFg0wtTxnW63j7FlE1vrAXRo8voX1FUTQgkRNvNPjgEeGGMXf
CSjjUOCi7lrntjGXmfuGcFV26fcS2X2gmWMFxyfKPaA95GVs22t5e7N4YRA2Tpe5
MsgYtD/BEd3k1A2bNSBqZSrAoFL5kEUUM15WR2N1j87wqjxxp+ylgw/jP31meHXe
toPVgrLvlMs2gEvWPLCDb2e0nFrYeuGbTAwCPKzfZMsViMeTGz+7lDAqFBr1Vovy
ILA57g2uOa9Bkhblr5Tyy5111WqocYfne86pfpFxDJrIrA/h4WpS5ZnAue85OAlT
n0fe6Rfq5SKoy55BkzPQ
=vTIk
-----END PGP SIGNATURE-----

--MZf7D3rAEoQgPanC--
