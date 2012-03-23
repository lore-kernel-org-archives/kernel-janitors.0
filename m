From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Mar 2012 10:40:29 +0000
Subject: Re: [PATCH] staging: wlags49_h2: Replace kmalloc+memset by kzalloc and add error handling.
Message-Id: <20120323104029.GF3232@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0hHDr/TIsw4o3iPK"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120323095158.GB3181@mwanda>
In-Reply-To: <20120323095158.GB3181@mwanda>
To: kernel-janitors@vger.kernel.org


--0hHDr/TIsw4o3iPK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 03:27:10PM +0530, santosh prasad nayak wrote:
> On Fri, Mar 23, 2012 at 3:21 PM, Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
> > On Fri, Mar 23, 2012 at 03:11:45PM +0530, santosh nayak wrote:
> >> - =A0 =A0 =A0 =A0dev_wds =3D kmalloc( sizeof( struct net_device ), GFP=
_KERNEL );
> >> - =A0 =A0 =A0 =A0memset( dev_wds, 0, sizeof( struct net_device ));
> >> + =A0 =A0 dev_wds =3D kzalloc(sizeof(struct net_device), GFP_KERNEL);
> >> + =A0 =A0 if (unlikely(!dev_wds)) {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "%s: failed to alloc memory\=
n", __func__);
> >
> > Don't resend, but kmalloc() already prints out way more extensive
> > and useful error messages than this. =A0No need to print an error
> > message yourself normally.
> >
>=20
> Do you mean in the following format ?
>=20
> +       if (unlikely(!dev_wds)) {
> +               DBG_LEAVE(DbgInfo);
> +               return;
> +       }

No need to resend.  It's just for next time something to consider.

regards,
dan carpenter


--0hHDr/TIsw4o3iPK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPbFMcAAoJEOnZkXI/YHqRkjYP/3YkyiLRQd6qlacWR5uLjDvw
hMaMnCHSPfT2cUcobkcAMToYk4wWC9rpkActqcYbfRVjCWOBL4SqP6ch+JdS1Cmb
mauRDMU/WcAgZGignwEmWprwwFR9Mf2XCg+5gmWhut+axn90RZN6NggHjBoyklc8
x1tMOhKaZ5YtajItI7DiJc6KCuFuo405hvLLbg0tw8Z2mfaMWz07isacMjCVHTmn
3I1atwdC5G2hxI4jvAr8/z1g9d6Yx07BFDWE7P5wz5QCKrupNsSNkgvS9RloBVhB
DLEnRiQGVQC2WnNwA3ic57VcUTcI1M8Xi9LpVHSuyRkUyAvQOrqMW2LhDSi1JvWa
nw9qAkt0oLwbr04nn+xTn+NylWtYBhloMsIeSTcND8s0/nykzVOr7gYpZzYFmOXo
KKwGg2aTFNqddztF1w5mbbXJfY+K+QRXHFCMOru6l4e9trpOD8DxhnFzEsT7PTjm
U0akKUNdHXFGaDQQMFqTQ0rr4T3EsTSTIisTK39aMUcdZneFrRW8uvTT2FuTnN3n
RTt/kdB3DQebrl5Fl3EeSFvPvUzTn7oZiEc2GScFZnyNr2+ZA+XrLX+dLtGgM3tC
wlf5pNU84J7+EGubDiDgWhYse1erZ74EF/Q2JGBh9nkDee/pejRszpY549FOZiYM
2rRZAHAe4Qa5aRN9FXZB
=mGSA
-----END PGP SIGNATURE-----

--0hHDr/TIsw4o3iPK--
