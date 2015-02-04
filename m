From: NeilBrown <neilb@suse.de>
Date: Wed, 04 Feb 2015 06:48:08 +0000
Subject: Re: [PATCH 2/3] md/bitmap: Delete an unnecessary check before the function call "kfree"
Message-Id: <20150204174808.319a1f69@notabene.brown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/DoE8Py4lr++vv+khwY.9gkj"
List-Id: <kernel-janitors.vger.kernel.org>
References: <54CF95CA.90102@users.sourceforge.net>
In-Reply-To: <54CF95CA.90102@users.sourceforge.net>
To: kernel-janitors@vger.kernel.org

--Sig_/DoE8Py4lr++vv+khwY.9gkj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 03 Feb 2015 11:19:58 +0100 walter harms <wharms@bfs.de> wrote:

>=20
>=20
> Am 03.02.2015 10:07, schrieb NeilBrown:
> > On Tue, 03 Feb 2015 09:48:01 +0100 walter harms <wharms@bfs.de> wrote:
> >=20
> >>
> >>
> >> Am 02.02.2015 20:46, schrieb NeilBrown:
> >>> On Mon, 02 Feb 2015 16:20:42 +0100 SF Markus Elfring
> >>> <elfring@users.sourceforge.net> wrote:
> >>>
> >>>> From: Markus Elfring <elfring@users.sourceforge.net>
> >>>> Date: Mon, 2 Feb 2015 15:10:57 +0100
> >>>>
> >>>> The kfree() function tests whether its argument is NULL and then
> >>>> returns immediately. Thus the test around the call is not needed.
> >>>>
> >>>> * This issue was detected by using the Coccinelle software.
> >>>>
> >>>> * Let us also move an assignment for the variable "pages" to the pla=
ce
> >>>>   directly before it is really needed for a loop.
> >>>>
> >>>> * Let us also move another kfree() call into a block which should be=
long
> >>>>   to a previous check for the variable "bp".
> >>>>
> >>>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> >>>> ---
> >>>>  drivers/md/bitmap.c | 10 +++++-----
> >>>>  1 file changed, 5 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/drivers/md/bitmap.c b/drivers/md/bitmap.c
> >>>> index da3604e..47d72df 100644
> >>>> --- a/drivers/md/bitmap.c
> >>>> +++ b/drivers/md/bitmap.c
> >>>> @@ -1586,15 +1586,15 @@ static void bitmap_free(struct bitmap *bitma=
p)
> >>>>  	bitmap_file_unmap(&bitmap->storage);
> >>>> =20
> >>>>  	bp =3D bitmap->counts.bp;
> >>>> -	pages =3D bitmap->counts.pages;
> >>>> =20
> >>>>  	/* free all allocated memory */
> >>>> -
> >>>> -	if (bp) /* deallocate the page memory */
> >>>> +	if (bp) { /* deallocate the page memory */
> >>>> +		pages =3D bitmap->counts.pages;
> >>>>  		for (k =3D 0; k < pages; k++)
> >>>> -			if (bp[k].map && !bp[k].hijacked)
> >>>> +			if (!bp[k].hijacked)
> >>>>  				kfree(bp[k].map);
> >>>> -	kfree(bp);
> >>>> +		kfree(bp);
> >>>> +	}
> >>>>  	kfree(bitmap);
> >>>>  }
> >>>> =20
> >>>
> >>> Hi,
> >>>  I'm somewhat amused that you removed a test for one kfree, but impos=
ed a
> >>>  test on another.  I realised the second test was already there, but =
why not
> >>>  just:
> >>>
> >>> diff --git a/drivers/md/bitmap.c b/drivers/md/bitmap.c
> >>> index da3604e73e8a..ad13b2e1bf1f 100644
> >>> --- a/drivers/md/bitmap.c
> >>> +++ b/drivers/md/bitmap.c
> >>> @@ -1592,7 +1592,7 @@ static void bitmap_free(struct bitmap *bitmap)
> >>> =20
> >>>  	if (bp) /* deallocate the page memory */
> >>>  		for (k =3D 0; k < pages; k++)
> >>> -			if (bp[k].map && !bp[k].hijacked)
> >>> +			if (!bp[k].hijacked)
> >>>  				kfree(bp[k].map);
> >>>  	kfree(bp);
> >>>  	kfree(bitmap);
> >>>
> >>>
> >>> It makes the intention of the patch much clearer.
> >>>
> >>> I'd probably prefer to leave the code as it is.  I don't think either=
 patch
> >>> is really an improvement in readability, and readability trumps perfo=
rmance
> >>> in places like this.
> >>>
> >>
> >>
> >> hello Neil,
> >> just for my curiosity.
> >> is it possible that a bp[k] exists but bp[k].hijacked is 0 ?
> >> if that case: kfree(bp) would free an object in use.
> >> otherwise hijacked seems useless here as it is possible to free
> >> everything.
> >>
> >> re,
> >>  wh
> >=20
> > If .hijacked is 0, the .map is a pointer (that would need to be freed) =
or is
> > NULL.
> > If .hijacked is 1, then .map has been re-tasked as 2 16-bit counters.  =
They
> > are probably bother zero at this point, but I think it is safer to comp=
letely
> > skip the 'free' if 'hijacked' is set as in that case 'map' isn't a poin=
ter.
> >=20
>=20
> It seems i was not clear enough, sorry about that.
>=20
> we have a loop to kfree(bp[k].map), thats fine how it is done.
>=20
> I am wondering about the kfree(bp) after the loop.
> if bp[k].map is not freed for what ever reason how can it be freed later
> after a kfree(bp) ?
>=20
> what is what i am missing ? Is there a hidden copy ?

If bp[k].map is a pointer, it will be freed.
If bp[k].map is not a pointer (because it has been hijacked), then there is
nothing to free.

So after the loop, all bp[k].maps that were allocated will have been freed.

Does that help?

NeilBrown


>=20
> re,
>  wh
>=20
>=20
>=20


--Sig_/DoE8Py4lr++vv+khwY.9gkj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUBVNHAqDnsnt1WYoG5AQJfIw/+NwFQUmLrIsdc1hxZYKIu5y+mCe9p2wFw
B+PG5gRPlbn+aObz2XG4HfTRmE9mL1DqznOms9n2aSUXasKgmeiqm7tib7Geg3Vv
VjrZUq7D16NScFuh9owF7KcgXYCBZa1sVOvMRJRbtpGh96zZZYcHxCnSJ/kQpxoY
U61L4YCXP6LeA+HXJG4sd5AYQZeu0hZZJjvo4f4u/NNgRF6HBAcfXkxN+FHhThbF
SZMV5b4HKc6VoikjixXOPy69CSBeRNt5UjAzFECnRxAroJVBJlMH06kNnwbJs8NV
LgWFjnII9s0HDmP3vQYF0WoARIbosQgydtQgggDu4OBvKed1FWXzUgwFK0STavYx
DtI3HNTybm35H3oF5rCbrITuTqj0TYXrRBzGYBjbYy7at+dbMN4xuG6p/gOyo6O5
tbg5zgwmBP/xlEMQtjPTm1sLwnHmcW2HmyTKfDDcRidvwDtMwc9UbEw5JBs3WrXj
gV6Uq+y5omfM+879287aEaiW9xKt3FFsuaKzhU1Iu+sRcTTMNySvvaJMK4ox02Bq
Z52RUp/r8UgWHacGoEekctIvjiV1sk3n2CY5P91D42/Y2MHoZgh54OychzdkgN/k
lZSxDDhdLqSZ0xlyw0RaJYiLEVGGBkCK5/ymi7BHZZ7E5WdMTMVDIHPvQeCQS5dy
qs58x7ZKdcc=
=u/zb
-----END PGP SIGNATURE-----

--Sig_/DoE8Py4lr++vv+khwY.9gkj--
