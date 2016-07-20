From: Wolfram Sang <wsa@the-dreams.de>
Date: Wed, 20 Jul 2016 15:54:08 +0000
Subject: Re: [PATCH 6/9] staging: ks7010: Delete unnecessary braces
Message-Id: <20160720155408.GF1688@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="IvGM3kKqwtniy32b"
List-Id: <kernel-janitors.vger.kernel.org>
References: <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <8b446c29-e32d-b2f8-1fb0-ae79888ca135@users.sourceforge.net>
 <alpine.DEB.2.10.1607172054060.3177@hadrien>
In-Reply-To: <alpine.DEB.2.10.1607172054060.3177@hadrien>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--IvGM3kKqwtniy32b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 17, 2016 at 08:55:41PM +0200, Julia Lawall wrote:
>=20
>=20
> On Sun, 17 Jul 2016, SF Markus Elfring wrote:
>=20
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sun, 17 Jul 2016 18:39:03 +0200
> >
> > Do not use curly brackets at some source code places
> > where a single statement should be sufficient.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  drivers/staging/ks7010/ks7010_sdio.c | 48 ++++++++++++----------------=
--------
> >  1 file changed, 16 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7=
010/ks7010_sdio.c
> > index b3ca8e2..1e072e3 100644
> > --- a/drivers/staging/ks7010/ks7010_sdio.c
> > +++ b/drivers/staging/ks7010/ks7010_sdio.c
> > @@ -109,9 +109,8 @@ void ks_wlan_hw_sleep_doze_request(struct ks_wlan_p=
rivate *priv)
> >  		DPRINTK(3, "sleep_mode=3DSLP_SLEEP\n");
> >  		atomic_set(&priv->sleepstatus.status, 1);
> >  		priv->last_doze =3D jiffies;
> > -	} else {
> > +	} else
> >  		DPRINTK(1, "sleep_mode=3D%d\n", priv->sleep_mode);
> > -	}
>=20
> This is a violation of CodingStyle:

Julia is right again, I agree.


--IvGM3kKqwtniy32b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXj56gAAoJEBQN5MwUoCm27FEQAJnH3wZw4IOTAu/yk8WJog86
UdLvVAz59qSIt12IYLb1z4l0YKWMIRoEnNMAjcCLiXkzXBPJSOG/iIKHsdihFLsy
Q0dehcpKEAA407ekbnzVQ/4cgPu65eb+cw3lTkazNwcpSC6D0EypMmgpBFsUsObp
WKhpk7Gjp3xnGm/7O1wprQI/BBEvxvh3+EY7ZtBE61Qyb8z+Rnp4SYOD0ca9kvjb
l9WGwSzLlPNCnJGmhXmR7dzFkyKzORB0r1JqYhjUfaU1uCEOGKxisShLga92/1ep
oSWRlD9agrRM0VRlccrvujoXF8bNfhZo+iJsOxBu4jpZYX4z73aSnfWQ+yvSF5dD
BARE+U7lI8D8Trxja1tmCFfFJ6p+0QZ1Cn0pyjngUtbTiDy+1Ud3o7iXrT1ARlaI
iTCd6MkByNVmLXsneFokrf7uGwGwAxUvPl+aPfqHaCs+JUM2XAr7p1MqKrTtjVMA
nA9TVeVDVHqG5I1hfuPV+pmDHr3u7fp172ZSppbOGvnhP61PxpRbNvB4gUPOzl1r
g8zsONZ4DxyImq89i+AE7VpTyJh9mq47hoYnhAJHbB0GsTrZteyGS0qT7PggNVqg
Qq1ffuM/3P3OsLuRIpAJ9Qvv1mJE3+6FVCoyDqSkMvRizF9V14tBd04+wHYsZk/x
mI7ri5Szz6/ZRAFfRU+Y
=3R6b
-----END PGP SIGNATURE-----

--IvGM3kKqwtniy32b--
