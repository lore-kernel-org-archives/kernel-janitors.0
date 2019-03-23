From: Pavel Machek <pavel@ucw.cz>
Date: Sat, 23 Mar 2019 10:51:52 +0000
Subject: Re: [PATCH -next] leds: lt3593: remove set but not used variable 'flags'
Message-Id: <20190323105151.GD24127@amd>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="2iBwrppp/7QCDedR"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190323024523.162210-1-yuehaibing@huawei.com>
In-Reply-To: <20190323024523.162210-1-yuehaibing@huawei.com>
To: kernel-janitors@vger.kernel.org


--2iBwrppp/7QCDedR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2019-03-23 11:38:04, Daniel Mack wrote:
> On 23/3/2019 11:34 AM, YueHaibing wrote:
> > On 2019/3/23 18:25, Daniel Mack wrote:
> >> On 23/3/2019 11:15 AM, Pavel Machek wrote:
>=20
> >>> If I look at code below, there's no difference between DEFSTATE_KEEP
> >>> and DEFSTATE_ON, right? I can't see how it works.
> >>
> >> Ah, you're right. Yes, the "keep" branch needs to go away entirely.
> >>
> >> As the chip can't be queried for it's current state, the "keep" option
> >> doesn't make sense. The only option in DT should be turn the LED on or
> >> off at probe time. YueHaibing, can you add that to your patch?
> >=20
> > Ok. I will send v2 with this.
>=20
> Note that Jacek just applied a patch of mine that removes all pdata
> handling from this driver. In order to avoid merge conflicts, you might
> want to base your patch on top of that.
>=20

Actually, Daniel, at this point I'd prefer you to take over this
patch. You have the hardware and you are already working on the
code...

									Pavel

>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.g=
it/commit/?h=3Dfor-next&id=3Dbd7a59173aea
>=20
>=20
> Thanks,
> Daniel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2iBwrppp/7QCDedR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlyWD8cACgkQMOfwapXb+vL09QCfT6PQO+9yd7559BBDUBUWvx2K
BL0An1Sfx9d7DIwsK89sDHanQ2avkXE7
=tJ0h
-----END PGP SIGNATURE-----

--2iBwrppp/7QCDedR--
