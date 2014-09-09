From: Felipe Balbi <balbi@ti.com>
Date: Tue, 09 Sep 2014 16:40:05 +0000
Subject: Re: [patch] usb: gadget: f_fs: signedness bug in __ffs_func_bind_do_descs()
Message-Id: <20140909164004.GQ6151@saruman.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="N+qDRRsDvMgizTft"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140909120609.GB19760@mwanda>
In-Reply-To: <20140909120609.GB19760@mwanda>
To: kernel-janitors@vger.kernel.org

--N+qDRRsDvMgizTft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 09, 2014 at 06:37:02PM +0200, Michal Nazarewicz wrote:
> On Tue, Sep 09 2014, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > On Tue, Sep 09, 2014 at 03:57:26PM +0200, Michal Nazarewicz wrote:
> >> On Tue, Sep 09 2014, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >> > Btw, there is a sparse warning:
> >> >
> >> > drivers/usb/gadget/function/f_fs.c:401:44: warning: Variable length =
array is used.
> >> >
> >> > The risk here is that the array would be too large.  I don't know the
> >> > code well enough to say if it can be triggered, but from an outsider
> >> > perspective it looks scary (security implications).  There should be=
 a
> >> > comment explaining why it can't be used to overflow the 8k stack.
> >>=20
> >> n in that function can be at most 4
> >
> > I looked for where this limit is set but couldn't figure it out.  Which
> > function is it?
>=20
> The limit is never explicitly set, but logic in this function guarantees
> it:
>=20
> static void __ffs_event_add(struct ffs_data *ffs,
> 			    enum usb_functionfs_event_type type)
> {
> 	enum usb_functionfs_event_type rem_type1, rem_type2 =3D type;
> 	int neg =3D 0;
>=20
> 	/*
> 	 * Abort any unhandled setup
> 	 *
> 	 * We do not need to worry about some cmpxchg() changing value
> 	 * of ffs->setup_state without holding the lock because when
> 	 * state is FFS_SETUP_PENDING cmpxchg() in several places in
> 	 * the source does nothing.
> 	 */
> 	if (ffs->setup_state =3D=3D FFS_SETUP_PENDING)
> 		ffs->setup_state =3D FFS_SETUP_CANCELLED;
>=20
> 	switch (type) {
> 	case FUNCTIONFS_RESUME:
> 		rem_type2 =3D FUNCTIONFS_SUSPEND;
> 		/* FALL THROUGH */
> 	case FUNCTIONFS_SUSPEND:
> 	case FUNCTIONFS_SETUP:
> 		rem_type1 =3D type;
> 		/* Discard all similar events */
> 		break;
>=20
> 	case FUNCTIONFS_BIND:
> 	case FUNCTIONFS_UNBIND:
> 	case FUNCTIONFS_DISABLE:
> 	case FUNCTIONFS_ENABLE:
> 		/* Discard everything other then power management. */
> 		rem_type1 =3D FUNCTIONFS_SUSPEND;
> 		rem_type2 =3D FUNCTIONFS_RESUME;
> 		neg =3D 1;
> 		break;
>=20
> 	default:
> 		BUG();

[off topic]

not sure a BUG() is the right way to go here. I'd rather see a WARN()
instead, with early return. We really don't want to crash the entire
system because someone passed an invalid type as argument.

--=20
balbi

--N+qDRRsDvMgizTft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUDy1kAAoJEIaOsuA1yqREV9wP/2UaiGWbUOhO2/5eEQ1BOGYF
7rrZxueM+6QMUL2rMef1pEtpGiRi5anyiHtdA/NR+CA7yaUTnwxU+5dvOthVpxIL
3/i766lJL8IxjMa8iTxXLmQvWioAbHz41vUoOBDKQveiA+fec0kfVA/UCKMSCrBv
jfkSX2U2uX35lhAlIHUoG0PsNRtCQBfmvLnTvzepHO5I2OFZMr5VvKXb1ElnSvDU
lLjAgN3doX7al9z9gxNdORGvzVhwOSEsM4HRU0FetAKJqr4pxINj2GXmjhCcbzN0
Cp+wu77qJ7VcNIRRmsqkpIKEvCGedL2pd+6rjH4ZTUzzXwEuGdKGLcQQ74E0dK8B
D9RFoWNiC/R/4NW8/rG16i1+q10AoGWWnrg6+ZT8jEU3Atgj2x170iEK/H8cbOvD
Vqdqxjxvd3KOs6/FF8nGQnvXtpANqgUdSCI5ohvmNSs+zeoq0XFWz4PrLpcN33gD
CKofxWfMJeD8LFARXmpx8vnn9Ar3nhtfMkIA1xHqJq2i5gezj4CLCROh5cnKovFe
gUjoXgE//hn2HlFrPYvgNdNd/mBHddnikZ0RgmnOP0Nxee/tK1HCEnDW8t6yuell
8rhiRA1shNh225wvztevWF+9m7S8DA5Z/nNvFXz81OGpbnPNBhrDkkeCCGOtMKJ+
HtAa3RG5nj9cbSPp04Im
=Ctin
-----END PGP SIGNATURE-----

--N+qDRRsDvMgizTft--
