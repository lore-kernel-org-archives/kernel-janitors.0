From: Ricardo Martins <ricardo@scarybox.net>
Date: Sun, 11 May 2008 17:33:57 +0000
Subject: [ricardo@scarybox.net: Re: [PATCH 1/4] sound/isa: use unsigned for
Message-Id: <20080511173357.GA5422@macbookpro>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="k+w/mQv8wyuph6w0"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org
Cc: julia@diku.dk, perex@perex.cz, linux-kernel@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Sorry, I forgot to CC the list.

----- Forwarded message from Ricardo Martins <ricardo@scarybox.net> -----

Date: Sun, 11 May 2008 18:16:52 +0100
=46rom: Ricardo Martins <ricardo@scarybox.net>
To: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH 1/4] sound/isa: use unsigned for loop index
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sun, 11 May 2008 21:22, Alexey Dobriyan wrote:
> On Sun, May 11, 2008 at 05:08:32PM +0100, Ricardo Martins wrote:
> > On Sun, 11 May 2008 20:43, Alexey Dobriyan wrote:
> > > On Sun, May 11, 2008 at 02:50:33PM +0200, Julia Lawall wrote:
> > > > A few more cases in the spirit of the patch "Trivial: Replacement o=
f always
> > > > >0 ints with unsigned ints" submitted by Ricardo Martins <ricardo@s=
carybox.net>
> > >=20
> > > And rationale for those would be ...?
> >=20
> > Acccording to the kernel-janitors TODO [1], Jeff Garzik suggested the f=
ollowing:
> >=20
> >   2) "unsigned int" is preferred to "int", it generates better asm code
> >   on all platforms except sh5. This replacement needs to be done manual=
ly,
> >   because often 'int' is required due to negative values -Exxx commonly
> >   passed as error values.
> >=20
> > Since (most) loop counters such as "int i" are always either zero or a =
positive
> > number, they are perfect candidates for using unsigned int instead, imh=
o.
> > It goes without saying, that each case must be considered separately in
> > case a negative value is indeed needed.
> >=20
> > [1] http://kernelnewbies.org/KernelJanitors/Todo
>=20
> So you've checked disassembly in both cases and saw it's better?

The generated assembly code in a very simple test case (two 'for' loops,
one using an int and another using an unsigned int as the counter
variable) is exactly the same in both cases.

However, since this was a very very simple test case, I supposed that Jeff
Garzik's claim would hold true in more complex cases.

Comparing the output of "objdump -M intel -d drivers/video/nvidia/nvidia.o"
before and after my patch, I reach the same conclusion: at least in my
arch (x86_64), both versions are approximately the same. If anyone is
interested, I can email or upload those dumps somewhere.

Now I feel like a fool. That teaches me to always doubt each and every claim
I am exposed to.

Regards,
--=20
 Ricardo Martins  *  scarybox.net  *  GPG key: 0x1308F1B4

----- End forwarded message -----

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkgnLgUACgkQkH81LRMI8bRh8gCdGG1mUCTMEFZk2SZkrCwMXfTV
xbQAni1Ix3NREcFlTGiXUhT0tCrSJngZ
=sjCg
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
