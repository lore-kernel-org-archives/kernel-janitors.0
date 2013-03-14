From: Felipe Balbi <balbi@ti.com>
Date: Thu, 14 Mar 2013 14:18:05 +0000
Subject: Re: [patch] usb gadget: uvc: use capped length value
Message-Id: <20130314141804.GJ26080@arwen.pp.htv.fi>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="/qIPZgKzMPM+y5U5"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130314080105.GA30808@longonot.mountain>
In-Reply-To: <20130314080105.GA30808@longonot.mountain>
To: kernel-janitors@vger.kernel.org

--/qIPZgKzMPM+y5U5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2013 at 03:09:46PM +0100, Laurent Pinchart wrote:
> Hi Dan,
>=20
> Thanks for the patch.
>=20
> On Thursday 14 March 2013 11:01:05 Dan Carpenter wrote:
> > "req->length" is a capped version of "data->length".
> >=20
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Good catch.
>=20
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> Felipe, could you please pick this one up (I can of course send you a pul=
l=20
> request if preferred) ?

sure thing, no need to worry with building a branch ;-)

--=20
balbi

--/qIPZgKzMPM+y5U5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRQdwcAAoJEIaOsuA1yqRE0hsP/jZ+pkq7VPU+cjjRlP064Xzb
IRtcAtGjBxnallcIooCdLOp46VAHsjiqiNZQb7mHRKD+7J/MfsK/RAsll2QpOJ5Y
raWUfkTQvfnEJ/rBc0T5N/CJfNy7RaETvpN13QsZOxZAbXZ+CRtXH/UrS3hKIHZv
NK7+AeSHM9CWpbNwMgq8Z30ZMxgcK0GKdaGDU+u2WXon9KU79VdPDJ3qj2X/miv2
RI693CPNvkVocP2pMIcmyCR4zCcR1cj/uBYT9KLLCHU+M2AL5MEDBqcaMGx6a24p
OEDvqILsQxDuhe2NynRmdIatp3nRsYY7SuHlF/jlCb9P5ksH/rW6Te4KOFxDJeyW
GAxUZrSm0RSPWqiILGqgFHAG3GJ3jY3ujBMvph9wnbkB6EvzKBrkfR9xEkzDYbtQ
tP4qtDbNbMRl1Jt8KnmIOy7cJd6OMlQWXrsISKVyeK93i+V4D1CoTkTqfUlDwKa3
iweNZbXcbVSFdqeOaeN0eeUG7BhcrzD+TWMBgkga67FzlHborJ9pCJ4L/SpyrTnU
seBimASBrU54MhEn9qLAdsa9bfdSqv/RpByQ8Xlfv8OwOM65cnrKqHCvEqaf+zZa
x1PWmXip0kSOB8McSCOkSlM85syKlTIuU1bMYMpdXAkpGaJ0SIEV/Wn2Kf4rmrL9
MtkleqZvd3e8k+dtICaj
=yHcR
-----END PGP SIGNATURE-----

--/qIPZgKzMPM+y5U5--
