From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Sun, 07 Dec 2008 05:43:33 +0000
Subject: Re: [PATCH linux-next] powerpc/powermac: Add missing of_node_put
Message-Id: <20081207164333.78b69d16.sfr@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Signature=_Sun__7_Dec_2008_16_43_33_+1100_9cAgL=Z0Rx4qNG1v"
List-Id: <kernel-janitors.vger.kernel.org>
References: <200812021445.18670.npalix@diku.dk>
	<20081206163449.60757c4a.akpm@linux-foundation.org>
	<18747.13668.304923.709761@cargo.ozlabs.ibm.com>
In-Reply-To: <18747.13668.304923.709761@cargo.ozlabs.ibm.com>
To: Paul Mackerras <paulus@samba.org>
Cc: Nicolas Palix <npalix@diku.dk>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, Julia Lawall <julia@diku.dk>, Andrew Morton <akpm@linux-foundation.org>

--Signature=_Sun__7_Dec_2008_16_43_33_+1100_9cAgL=Z0Rx4qNG1v
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Sun, 7 Dec 2008 13:31:00 +1100 Paul Mackerras <paulus@samba.org> wrote:
>
> I'm really in two minds about applying any of the of_node_put patches
> that only affect powermacs.  The reference counts only matter on
> platforms where we update the OF device tree at runtime, which is
> currently only IBM pSeries machines.  Since we don't have any hotplug
> on powermacs, and never will have, the OF device tree is completely
> static and we don't actually need refcounts on the nodes at all, so
> who cares if they're a bit higher than they might be?
>=20
> In particular, the VIA whose node we're looking for here is built-in
> on the motherboard, and there can never be more than one, and it can
> never be removed.

I my mind it is about consistent use of the API and good examples for
people to copy.  Also, in about a year you will be presented with the
same set of patches when a new pair of eyes looks at the same code and
notices the discrepancy ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Sun__7_Dec_2008_16_43_33_+1100_9cAgL=Z0Rx4qNG1v
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk7YoUACgkQjjKRsyhoI8yITgCgqhiy2EiAy7rT/UeREir6DnDl
DFQAoJazqJL2ZCW+NMAj8s8iWyhmdOPV
=p+Ht
-----END PGP SIGNATURE-----

--Signature=_Sun__7_Dec_2008_16_43_33_+1100_9cAgL=Z0Rx4qNG1v--
