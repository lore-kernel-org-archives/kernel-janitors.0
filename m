From: Ricardo Martins <ricardo@scarybox.net>
Date: Sun, 11 May 2008 16:08:32 +0000
Subject: Re: [PATCH 1/4] sound/isa: use unsigned for loop index
Message-Id: <20080511160832.GA4709@macbookpro>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="liOOAslEiF7prFVr"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0805111450000.29620@ask.diku.dk> <20080511164335.GA19745@martell.zuzino.mipt.ru>
In-Reply-To: <20080511164335.GA19745@martell.zuzino.mipt.ru>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: julia@diku.dk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, perex@perex.cz


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 11 May 2008 20:43, Alexey Dobriyan wrote:
> On Sun, May 11, 2008 at 02:50:33PM +0200, Julia Lawall wrote:
> > A few more cases in the spirit of the patch "Trivial: Replacement of al=
ways
> > >0 ints with unsigned ints" submitted by Ricardo Martins <ricardo@scary=
box.net>
>=20
> And rationale for those would be ...?

Acccording to the kernel-janitors TODO [1], Jeff Garzik suggested the follo=
wing:

  2) "unsigned int" is preferred to "int", it generates better asm code
  on all platforms except sh5. This replacement needs to be done manually,
  because often 'int' is required due to negative values -Exxx commonly
  passed as error values.

Since (most) loop counters such as "int i" are always either zero or a posi=
tive
number, they are perfect candidates for using unsigned int instead, imho.
It goes without saying, that each case must be considered separately in
case a negative value is indeed needed.

[1] http://kernelnewbies.org/KernelJanitors/Todo

Regards,
--=20
 Ricardo Martins  *  scarybox.net  *  GPG key: 0x1308F1B4

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkgnGgAACgkQkH81LRMI8bQveQCeODXoXvWmBuC7O1eUT0U1KYSt
Jy8An2UKw1kePvGuejlyesIHOQr/4eE5
=BYjF
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
