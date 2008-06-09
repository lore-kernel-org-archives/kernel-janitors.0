From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 09 Jun 2008 13:32:01 +0000
Subject: Re: [PATCH 2/4] drivers/macintosh/smu.c: add missing of_node_put
Message-Id: <20080609233201.fc638cc7.sfr@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Signature=_Mon__9_Jun_2008_23_32_01_+1000_Y8+KERnE/P1TbrA4"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0806091420080.16009@ask.diku.dk>
	<20080609230752.f3bba16d.sfr@canb.auug.org.au>
	<Pine.LNX.4.64.0806091521390.16009@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0806091521390.16009@ask.diku.dk>
To: Julia Lawall <julia@diku.dk>
Cc: linuxppc-dev@ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Mon__9_Jun_2008_23_32_01_+1000_Y8+KERnE/P1TbrA4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Julia,

On Mon, 9 Jun 2008 15:22:53 +0200 (CEST) Julia Lawall <julia@diku.dk> wrote:
>
> > However, the error handling in that routine (smu_init) needs much more
> > work.
>=20
> Indeed, the smu =3D NULL at the end of the function seems a bit brutal - =
a=20
> lot of allocated data ends up not getting freed.  I can try to do=20
> something about it.  Did you see something else?

There are paths to fail: where you would need to of_node_put smu->db_node or
smu->msg_node (or both) and undo the smu->db_buf ioremap.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__9_Jun_2008_23_32_01_+1000_Y8+KERnE/P1TbrA4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhNMNEACgkQTgG2atn1QN/gXgCeJZUty5Mov1oSItRv5dVnuAkk
ujAAn2DsIAVH3gRScVMm4Ilk/13E8Iwx
=sPVg
-----END PGP SIGNATURE-----

--Signature=_Mon__9_Jun_2008_23_32_01_+1000_Y8+KERnE/P1TbrA4--
