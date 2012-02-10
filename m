From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Fri, 10 Feb 2012 18:38:41 +0000
Subject: Re: [Cocci] Re: [PATCH] scripts/coccinelle/misc/boolinit.cocci: semantic patch for bool issues
Message-Id: <1328899121.22240.89.camel@sauron.fi.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-R6rioU4jrIJt9pj5UXJG"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1328893887-28932-1-git-send-email-Julia.Lawall@lip6.fr>
	 <1328895943.14197.1.camel@joe2Laptop>
In-Reply-To: <1328895943.14197.1.camel@joe2Laptop>
To: Joe Perches <joe@perches.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Michal Marek <mmarek@suse.cz>, Gilles Muller <Gilles.Muller@lip6.fr>, bruce.w.allan@intel.com, rusty@rustcorp.com.au, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@diku.dk, Julia Lawall <julia@diku.dk>


--=-R6rioU4jrIJt9pj5UXJG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-02-10 at 09:45 -0800, Joe Perches wrote:
> On Fri, 2012-02-10 at 18:11 +0100, Julia Lawall wrote:
> > From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> Thanks Julia.  It seems to work well.
>=20
> Someone could run this with:
>=20
> $ make coccicheck COCCI=3Dscripts/coccinelle/misc/boolinit.cocci

I've executed it for ARCH=3Di386 and i386_defconfig, I can send the patch
tomorrow, but it going to be big AFAICS.

--=20
Best Regards,
Artem Bityutskiy

--=-R6rioU4jrIJt9pj5UXJG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPNWQxAAoJECmIfjd9wqK0HLMP/A8oS3TQo3MkpqjSVMhoy5PF
JvggH1FR6h/IEV5cB32z0M2volNHmyO1VTRFzvvClHU0XMqqbPWhKQqR+CaUF5Wd
5NItHEptDyaQ6Yh1LNyyCF+GIw28qkttOk2kos6EQLTCYB2eVjWPd1fEhnORqbVB
OH0j3fuvYf9kTx/LEBAOcVpskzSICxnZqdDiQUxG4jXme+Jt8eJxsMHhJ40Ql+NQ
mbPWonDYmpIl+nS0v4ldbRw5gO9ZAk7mt+16THCguDlw9wFcoYYILxfzcAaSeFvy
a4J5XVbKHZZUaGoQ4BHLcBrqOMj4b3bEo/7QdKGgNxYM9HUeQoUbJbtCDHq5eMsj
PLnT1RiPqXY9oq05TBPlaYd8oXoPGX9Yo03Aiu8Bc5YRumKSkHm14kMy/VDX6PJx
olUPq2YCbb8o6QVHeEelNR2elVAAmxThjO6EG4JgQGSUl8drUFPq6lnBtV2ZiWMy
/ksVLEUzsknaRqMhXo3uwR1jy1UchsmAK/pTANWBIqwHAAcZ6EkjUdvtZyOsZ6Ac
yqcn4iQ0LJcofTXvSb8liqKaRaOSdlDDsvmzCG1T9z6vTETk60+BlU+3AGa/7znP
gEAPJE+nxtQN1NuehJ/HTywDwLtL+ToURpLurGsIMXYlXN1Cp1lMS1+fZyA6qO4Y
/dqoo3QUg0yYlgNfN9gz
=yTLr
-----END PGP SIGNATURE-----

--=-R6rioU4jrIJt9pj5UXJG--

