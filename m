From: Ricardo Martins <ricardo@scarybox.net>
Date: Fri, 02 May 2008 16:42:19 +0000
Subject: Re: warning: ???pci_find_device??? is deprecated
Message-Id: <20080502164219.GA6237@macbookpro>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vkogqOf2sHV7VnPd"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080502162539.GG14976@parisc-linux.org>
In-Reply-To: <20080502162539.GG14976@parisc-linux.org>
To: kernel-janitors@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 02 May 2008 18:28, Julia Lawall wrote:
> On Fri, 2 May 2008, Matthew Wilcox wrote:
>=20
> > On Fri, May 02, 2008 at 05:19:40PM +0100, Ricardo Martins wrote:
> > > There are 14 drivers in drivers/isdn/hisax/ still using calls to
> > > pci_find_device() instead of the pci_get_device(). From what I gather=
, a
> > > simple sed 's|pci_find_device|pci_get_device|' is enough to fix this,
> > > since both functions use the same input and give the same output.
> > > Is this correct?
> >
> > It's never correct.  If it were that easy (a) there wouldn't be a rename
> > in the first place and (b) it would have been done with a shell-script
> > already.
> >
> > pci_get_device increments a refcount on the pci_dev.  pci_find_device
> > does not.  Your patch must include calls to pci_dev_put() *when
> > appropriate*.  Note, for example, that pci_get_device decrements the
> > refcount on the device passed in.
>=20
> I looked at this briefly at one point.  To my recollection, many of the
> files that use pci_find_device store the result in a global variable.  So
> one would have to think carefully about the useful lifetime of the value
> of that variable to know where to put the puts.
>=20
> julia

I see. Thank you both for shedding some light on this.

--=20
 Ricardo Martins  *  scarybox.net  *  GPG key: 0x1308F1B4

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkgbRGsACgkQkH81LRMI8bQhKwCffGNhf5u8gwKrcj1ynKGaMwXs
UMwAoJodpb5Ol/yJ9YAHgfJescDws9Tp
=PLrv
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
