From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Date: Mon, 01 May 2017 09:07:14 +0000
Subject: Re: [PATCH 0/3] HSI: omap_ssi: Fine-tuning for two function implementations
Message-Id: <20170501090714.soham2yhk6h4fgt6@earth>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vlajayfncj7ax7kz"
List-Id: <kernel-janitors.vger.kernel.org>
References: <2fa2c33a-dc43-7e03-03d7-7ca04931e6c7@users.sourceforge.net>
In-Reply-To: <2fa2c33a-dc43-7e03-03d7-7ca04931e6c7@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, Tony Lindgren <tony@atomide.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--vlajayfncj7ax7kz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 25, 2017 at 01:12:42PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 25 Apr 2017 12:52:10 +0200
>=20
> Three update suggestions were taken into account
> from static source code analysis.
>=20
> Markus Elfring (3):
>   Use devm_kcalloc() in ssi_add_controller()
>   Fix a typo in a comment line
>   Delete an error message for a failed memory allocation in ssi_add_contr=
oller()
>=20
>  drivers/hsi/controllers/omap_ssi_core.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Thanks for your patchset. We are currently in the merge
window and your patch will appear in linux-next once
4.12-rc1 has been tagged by Linus Torvalds.

Until then I queued it into this branch:

https://git.kernel.org/cgit/linux/kernel/git/sre/linux-hsi.git/log/?h=3Dfor=
-next-next

-- Sebastian

--vlajayfncj7ax7kz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlkG+sIACgkQ2O7X88g7
+prKuw/8C0NXPoY9sYfvqOytYT7UgiQYEcIiMVQic6o6sLpkhydTPDFQvJ9600l+
QL24fNE4/c87fRmjtFErePfuEp2iZXyErREEEYGUsr4o+DjmDunUN5pqr5CYTs3z
Y8Iq7L4MQIyn+vL84Sr8e+0YIaThpAOL3XJB7vAZxFEwmJBkjj6DW2CISDzzIBRZ
ZrAW0l8PSwT6M5/vcv/7gP7BxLtr8ZndecHochN8+65WJJ1VpF97ktPPRK8nvBMR
ws08NRDVj/nOWKWi13sswE6/Tp2volNTDHqN9rh4DJ0puHdiGmOYSRNiwzy3yhvP
Z2vGU8oTd18E0gTef3mCuycDtRcjQH2VAYLNfdRr+ntq7JBoVRz+eAL0Dc5LtMko
1Ku9g6TGcbSXPdLuWokP47WfK0gnLKtjhFCyW3k7DHOyIRNi3hs3ugb5IUuCzIJt
4ZFI+rfC0tdD/5YwAoM1eCMCS/N/ANUDsYSru671rj/3HjjnEhKeqRcE1injFX8e
RyiQ2OX1MIJ9vIcvip+6QENQp+5Daxmfqeo+PVPDBBw3GDI6ay6Vo4O3h0OsgBiH
xOXhs0YZRmcSz2apRRWvk465JvCNC7Ki595GyHDyyeGDhGIDJpUhdESrHImZhPij
A4/hlIfwTz1Vxb2PAciTDxVFb9izgftFG4aUC92/D06ppZwLf88=
=FYP2
-----END PGP SIGNATURE-----

--vlajayfncj7ax7kz--
