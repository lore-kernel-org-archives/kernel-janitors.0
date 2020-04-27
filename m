From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Mon, 27 Apr 2020 11:58:56 +0000
Subject: Re: [PATCH v4] staging: wfx: cleanup long lines in data_tx.c
Message-Id: <20200427115827.GA3214@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vtzGhvizbBRQ85DL"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200425113234.GA14492@blackclown>
 <8518467.FNpd3NTrYF@pc-42>
In-Reply-To: <8518467.FNpd3NTrYF@pc-42>
To: Jerome Pouiller <Jerome.Pouiller@silabs.com>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 11:50:23AM +0000, Jerome Pouiller wrote:
> On Saturday 25 April 2020 13:32:34 CEST Suraj Upadhyay wrote:
> > Break lines with length over 80 characters to
> > conform to the linux coding style and refactor
> > wherever necessary.
> >=20
> > Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> > ---
> >=20
> > Changes in v4:
> > 	- Added a space after declaration in wfx_get_hw_rate().
> > 	- A checkpatch warning for this commit is retained at line 75,
> > 	  to maintain uniformity in function declarations. (Reviewer
> > 	  jerome suggested).
> >=20
> > Changes in v3:
> >         - Changed the temporary variable name for the memzcmp statement
> >           to is_used. (as suggested).
> >         - Added a temporary ieee80211_supported_band variable to address
> >           the problem in wfx_get_hw_rate() more efficiently. (not
> >           suggested, but still).
> >=20
> > Changes in v2:
> >         - Introduced a temporary variable for the memzcmp statement.
> >         - Addressed the checkpatch problem with wfx_get_hw_rate().
> >         - Restored the function definition of wfx_tx_get_tx_parms
> >           as suggested by the reviewer.
> >         - Added suggested changes for req->packet_id statement.
> >=20
> >  drivers/staging/wfx/data_tx.c | 40 +++++++++++++++++++++++------------
> >  1 file changed, 26 insertions(+), 14 deletions(-)
>=20
> This patch does not contain the suggestions from Dan. However, it is
> sufficient from my personal point of view.

Yes, I considered them but thought it would be bad to introduce a new
variable at every iteration of the for-loop.

> Reviewed-by: J=E9r=F4me Pouiller <jerome.pouiller@silabs.com>

Thanks Jerome, This was my first patch to the linux kernel.

>=20
> --=20
> J=E9r=F4me Pouiller
>=20

Regards,

Suraj Upadhyay.

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl6myNsACgkQ+gRsbIfe
746u7w/+PohUp9jD+xMXnW5e8Q49hUyz1vbxWWtc0XF6GlWb8Ki/KOY1kcU6+/Um
ipSXRDD0hcN8sKalisIVY0PWOAnRerg1GUa7mQWZYw58EGNSDEK4oiiKBXBOtEd+
P+p4xXjq5tdNXN767/fK7Qy59tWDvT3Wz5yIudvV5EEq68ZTcCFwt15Q65yhQSCU
vpsqwTTz5ztnYPNLb0aBKOgnvM4W5QHNhOhtBh9QRYeh1EDHPTAMuel38EFCE3tr
B74zOcqgLCGj8nE6pDdXfHx2remYfO7AKfeDk9w9T3Uxo31wwlUEGS8JzX2VaArp
xPJfmcPdx0GIjwvSha9XzUpThD4beXGtETTk+Qmfc9mdC9Vsy9ORA6TVSMglvtCW
VZPT+sQo7M0m7PNU/DdAZiGd9z+/lonv5uP7YgmohkSUiRM/c2e8D3qXcd68tlxJ
LGSm0kHRPdib6QjzsUdmIyGgm12dV1PO1Sc4Vgfa9G/Mlpg9x0Z1Pjf1FZbZEMra
6rrftGxAiOnr7U3gjGhdBruNqfrxvHGIy3712YFqKoT7Yi5haRGg0J8SFTzb+bEy
iEqNsqaxTLn2UDMg54W9qcuXu/U/zDl5pniYoELjANVrB4JuCRUaLpb2f1vp4Gy2
dFBjsbrCAJ3r808r6AzAOSiJCTJhdg6wIsj9E4c6RVUfPY7JbMI=
=eJ/o
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
