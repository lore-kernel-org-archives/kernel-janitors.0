From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Mar 2012 11:06:48 +0000
Subject: Re: [PATCH] [SCSI] pm8001: Add error handler in pm8001_init_sas_add() if kzalloc fails.
Message-Id: <20120321110647.GC7848@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="TiqCXmo5T1hvSQQg"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1332319785.2909.11.camel@dabdike.int.hansenpartnership.com>
In-Reply-To: <1332319785.2909.11.camel@dabdike.int.hansenpartnership.com>
To: kernel-janitors@vger.kernel.org


--TiqCXmo5T1hvSQQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 11:50:00AM +0100, walter harms wrote:
>=20
>=20
> Am 21.03.2012 11:11, schrieb James Bottomley:
> > On Wed, 2012-03-21 at 11:58 +0300, Dan Carpenter wrote:
> >> On Wed, Mar 21, 2012 at 08:49:45AM +0000, James Bottomley wrote:
> >>> On Wed, 2012-03-21 at 14:08 +0530, santosh nayak wrote:
> >>>> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> >>>>
> >>>> We need to add error handler if kzalloc fails to allocate and initia=
lize.
> >>>> Otherwise it may lead to Null derefernce error in=20
> >>>> 'pm8001_chip_get_nvmd_req()'.
> >>>
> >>> It's a GFP_KERNEL allocation.  They sleep until memory is available
> >>> (__GFP_WAIT).  It's GFP_ATOMIC that can return NULL.
> >>>
> >>
> >> That's not right at all.  Only __GFP_NOFAIL allocations don't need
> >> to be checked.
> >=20
> > Ah, right, that's the option I was thinking of.  __GFP_WAIT may fail if
> > we're in direct reclaim or the oom killer gets activated.
> >=20
>=20
> I think it is ok to do it anytime. It is useles in the __GFP_NOFAIL case,
> but it is more easy to check: avoid exceptions from the rule !

That's nonsense.  Code deliberately.  I feel like I spend too much
time removing bogus NULL checks already.  Don't encourage people to
add them.

regards,
dan carpenter

--TiqCXmo5T1hvSQQg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPabZHAAoJEOnZkXI/YHqRdhUQAJUfQUN6Rkr57k0VQ0RXhTJI
tnJD34Sgyc7ByoXk+6GhJTLTdX2jaMVTnhwNs9X4iENA/jYQaFhGuaGJv/k6RfoS
J9zbZR9cfEqWzs/ULEBREy609+/7IIWSSCooZDByPxEPRxI4ive8lX8WuNAfxIId
QigoWzMqhBTSVw7En+pw15NhuX9c2x99j6h8W/QcaShmdoRVkwNDZ91CMxKf8qDf
1yP5KczFKlN1cCWz8IVbJGHevOTa/yB2spshm7R14l7gI80QSNuM3fvKnaLQkXZG
hQojCESy+FID5ESN/5hW2BZA4fsC2LUvLoR0Ae9lUzdOdVkjSyYpy4qAf/wYKMYS
guE37cHQ/HZysCz60WTYITr2LrOo2VVe7IZo9z/5GdjgNVRbQWT/z0okNQPD8asz
AJy/kL/yh83DA2p3EjqplsI2ylQuZ9HE8VbYZO3WGAS9QAaLWqQatADWoGVuuOjZ
AX40AjHecVdDZdSPljPVNY1UPbwMWGk2E6eDKpNrEse6NInrLzAMij4t82hfmBMA
4eh0QTliqgUGxVR8mo2uSCtQGppSFiDnwB2sJQAKkQ9uzhRj9ZLoJ1e9usuujRmN
61SFcKltiZPAtJ8yDfjMb/zORicMLsjs60KK/i7WOADPirTcY5W1thUYRDAB7VkL
K2LtT2ZA4jqcSA1iHFHB
=XYJj
-----END PGP SIGNATURE-----

--TiqCXmo5T1hvSQQg--
