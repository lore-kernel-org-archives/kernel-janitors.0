From: NeilBrown <neilb@suse.de>
Date: Tue, 03 Feb 2015 09:07:38 +0000
Subject: Re: [PATCH 2/3] md/bitmap: Delete an unnecessary check before the function call "kfree"
Message-Id: <20150203200738.41fa56a2@notabene.brown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/z5KoyMlTXVpbbBjUMsHF1.U"
List-Id: <kernel-janitors.vger.kernel.org>
References: <54CF95CA.90102@users.sourceforge.net>
In-Reply-To: <54CF95CA.90102@users.sourceforge.net>
To: kernel-janitors@vger.kernel.org

--Sig_/z5KoyMlTXVpbbBjUMsHF1.U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 03 Feb 2015 09:48:01 +0100 walter harms <wharms@bfs.de> wrote:

>=20
>=20
> Am 02.02.2015 20:46, schrieb NeilBrown:
> > On Mon, 02 Feb 2015 16:20:42 +0100 SF Markus Elfring
> > <elfring@users.sourceforge.net> wrote:
> >=20
> >> From: Markus Elfring <elfring@users.sourceforge.net>
> >> Date: Mon, 2 Feb 2015 15:10:57 +0100
> >>
> >> The kfree() function tests whether its argument is NULL and then
> >> returns immediately. Thus the test around the call is not needed.
> >>
> >> * This issue was detected by using the Coccinelle software.
> >>
> >> * Let us also move an assignment for the variable "pages" to the place
> >>   directly before it is really needed for a loop.
> >>
> >> * Let us also move another kfree() call into a block which should belo=
ng
> >>   to a previous check for the variable "bp".
> >>
> >> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> >> ---
> >>  drivers/md/bitmap.c | 10 +++++-----
> >>  1 file changed, 5 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/md/bitmap.c b/drivers/md/bitmap.c
> >> index da3604e..47d72df 100644
> >> --- a/drivers/md/bitmap.c
> >> +++ b/drivers/md/bitmap.c
> >> @@ -1586,15 +1586,15 @@ static void bitmap_free(struct bitmap *bitmap)
> >>  	bitmap_file_unmap(&bitmap->storage);
> >> =20
> >>  	bp =3D bitmap->counts.bp;
> >> -	pages =3D bitmap->counts.pages;
> >> =20
> >>  	/* free all allocated memory */
> >> -
> >> -	if (bp) /* deallocate the page memory */
> >> +	if (bp) { /* deallocate the page memory */
> >> +		pages =3D bitmap->counts.pages;
> >>  		for (k =3D 0; k < pages; k++)
> >> -			if (bp[k].map && !bp[k].hijacked)
> >> +			if (!bp[k].hijacked)
> >>  				kfree(bp[k].map);
> >> -	kfree(bp);
> >> +		kfree(bp);
> >> +	}
> >>  	kfree(bitmap);
> >>  }
> >> =20
> >=20
> > Hi,
> >  I'm somewhat amused that you removed a test for one kfree, but imposed=
 a
> >  test on another.  I realised the second test was already there, but wh=
y not
> >  just:
> >=20
> > diff --git a/drivers/md/bitmap.c b/drivers/md/bitmap.c
> > index da3604e73e8a..ad13b2e1bf1f 100644
> > --- a/drivers/md/bitmap.c
> > +++ b/drivers/md/bitmap.c
> > @@ -1592,7 +1592,7 @@ static void bitmap_free(struct bitmap *bitmap)
> > =20
> >  	if (bp) /* deallocate the page memory */
> >  		for (k =3D 0; k < pages; k++)
> > -			if (bp[k].map && !bp[k].hijacked)
> > +			if (!bp[k].hijacked)
> >  				kfree(bp[k].map);
> >  	kfree(bp);
> >  	kfree(bitmap);
> >=20
> >=20
> > It makes the intention of the patch much clearer.
> >=20
> > I'd probably prefer to leave the code as it is.  I don't think either p=
atch
> > is really an improvement in readability, and readability trumps perform=
ance
> > in places like this.
> >=20
>=20
>=20
> hello Neil,
> just for my curiosity.
> is it possible that a bp[k] exists but bp[k].hijacked is 0 ?
> if that case: kfree(bp) would free an object in use.
> otherwise hijacked seems useless here as it is possible to free
> everything.
>=20
> re,
>  wh

If .hijacked is 0, the .map is a pointer (that would need to be freed) or is
NULL.
If .hijacked is 1, then .map has been re-tasked as 2 16-bit counters.  They
are probably bother zero at this point, but I think it is safer to complete=
ly
skip the 'free' if 'hijacked' is set as in that case 'map' isn't a pointer.

NeilBrown

--Sig_/z5KoyMlTXVpbbBjUMsHF1.U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVNCP2jnsnt1WYoG5AQK4uRAArhBmazLKTC5BjiRgg82j4fSZyhnwbEJg
cDyaP1+tXE4S93inZ7SKaJuUz6YSwztRTATN2yvUI6lB3m9Pmp1S+zV0GuxezQWs
SidwAFASPedyPy9toSD3AAouIof4SvQPGSqboXB4+UbPjj0QQsMjEPxSY4AQPvWL
FjELm+54d2tunDRl3eyP4zOCI7hlLL3/wdPVoJ9ndG1quDoRAd3rWmtNb6D/bKz5
XwhzXjie8bPleWTWiLWsDKnVkY7eadVR34NGhmJ6Ei3P62USvau9hloU6ThdaezN
XPFOChz3AQSvC1zfDUU84lbJJighjNMd3lJcw2XKXv8kLnuIOhJ0UiTlh5raoWPw
+juGHV2IID0FPsLM7Rujpj4IL36xJjQKJLzLVieXHmYUM4E2rcavcgmxWmf7TCTs
yGION38RWpZD9IQLtFcCnrENEO/Alq7H8MaaYoX1YABQMhdw1HdwMijhxEDvEwPQ
Qv0UxiXjL3UBnR5WvBTLPjBIPBBqgkBGzt/kwX6hZjQ1URtEL3+fnH8M77EzyJ13
8KXjsLgTrl2Ox7jc2Uls2I1qSgW0jTk0kNmctP/oeNUk+A6praSdYgbnpK+jTVLi
nSzHJZO4PHW4sHzYJ4hfkkNQHQVSTNGLMBe1gxAqWsrzNA13U/l1w2GHo4WlqMnx
5eCDXTjqGzM=
=YKW9
-----END PGP SIGNATURE-----

--Sig_/z5KoyMlTXVpbbBjUMsHF1.U--
