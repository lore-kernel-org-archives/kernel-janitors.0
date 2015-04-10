From: Simon Guinot <simon.guinot@sequanux.org>
Date: Fri, 10 Apr 2015 00:25:07 +0000
Subject: Re: [patch 2/2] leds: netxbig: clean up a data type issue
Message-Id: <20150410002507.GF1509@kw.sim.vm.gnt>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="4Ldzc4wBVbTTlpZt"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150409090712.GF17605@mwanda>
 <20150409192557.GD1509@kw.sim.vm.gnt>
 <20150409195426.GP10964@mwanda>
In-Reply-To: <20150409195426.GP10964@mwanda>
To: linux-arm-kernel@lists.infradead.org


--4Ldzc4wBVbTTlpZt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2015 at 10:54:26PM +0300, Dan Carpenter wrote:
> On Thu, Apr 09, 2015 at 09:25:57PM +0200, Simon Guinot wrote:
> > On Thu, Apr 09, 2015 at 12:07:12PM +0300, Dan Carpenter wrote:
> > > This driver is pretty hardware specific so it's unlikely that we're
> > > going to be using it on 64 big endian systems.  Still, the current co=
de
> > > causes a static checker warning so we may as well change the type from
> > > "unsigned long" to "u32" and remove the casting.
> >=20
> > Hi Dan,
> >=20
> > Thanks for the patch.
> >=20
> > Why do you think it would be an issue to use the u32 type for this
> > variables on a 64-bit big-endian machine ? Note that this LED mechanism
> > is actually used on ARM 32-bits and x86-64 NAS platforms. The latter are
> > not mainlined yet. But indeed, for now, there is no plan to use it on a
> > 64-bit big-endian machine.
> >=20
> > Since the whole LED code uses the unsigned long type to hold the delay
> > values, if possible, I would prefer to keep the delay_{on,off} variables
> > consistent with that.
> >=20
> > Is there an another way to make the "static checker" happy ?
>=20
> We're writing over 32 bits of a long.  It's a dangerous habbit.
>=20
> If long is u32 then of_property_read_u32_index() works, obviously.  If
> it is a little endian and the last 32 bits have been zeroed out (as they
> have been here) then that also works.
>=20
> If it's big endian and 64 bit then it doesn't work because we're writing
> to the wrong 32 bits.

Sorry, I misunderstood your commit message.

But still, rather than changing the type from unsigned long to u32 for
the delay_{on,off} variables, I think we should use a temporary u32
variable for the of_property_read_u32_index calls. This way we can keep
the type of the delay_{on,off} variables consistent with the LED core
code.

Regards,

Simon

--4Ldzc4wBVbTTlpZt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlUnGGMACgkQgtp0PDeOcDq/ZwCfcQd+4f+TZ2/BPDW531tlu7IG
Yr8AoJoQe4vmDp7i8nucQmdfvOPCf7RM
=VOfZ
-----END PGP SIGNATURE-----

--4Ldzc4wBVbTTlpZt--
