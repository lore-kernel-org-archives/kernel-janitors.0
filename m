From: Tonnerre <tonnerre@thundrix.ch>
Date: Wed, 29 Sep 2004 22:23:53 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2-mm4 bttv-driver.c][4/8]
Message-Id: <20040929222353.GF21770@thundrix.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87616865805574484=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <15470000.1096491322@w-hlinder.beaverton.ibm.com> <20040929220344.A17872@infradead.org>
In-Reply-To: <20040929220344.A17872@infradead.org>
To: Christoph Hellwig <hch@infradead.org>, Hanna Linder <hannal@us.ibm.com>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, greg@kroah.com, kraxel@bytesex.org


--===============87616865805574484==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Ow488MNN9B9o/ov"
Content-Disposition: inline


--1Ow488MNN9B9o/ov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Salut,

On Wed, Sep 29, 2004 at 10:03:44PM +0100, Christoph Hellwig wrote:
> I think this check should just go away completely. =20
>=20
> We don't have such silly warnings in any other driver.

Kraxel introduced this  check because of the confusion  with the "old"
and "new" WinTV cards. The older one had a bt848 chip, the newer one a
connexant 878, and only the older one was supported by Linux.

Now that we support both, this printk is rather counterproductive.

			    Tonnerre


--1Ow488MNN9B9o/ov
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.2 (GNU/Linux)

iD8DBQFBWzX4/4bL7ovhw40RAo00AJ9NVg8hMY88u9kAggyCQEx9um0kTQCaAp2a
SQmVtsH4jYfFpBGDzPQvyVI=
=Y0BQ
-----END PGP SIGNATURE-----

--1Ow488MNN9B9o/ov--

--===============87616865805574484==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87616865805574484==--
