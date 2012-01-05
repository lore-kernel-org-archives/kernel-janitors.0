From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Jan 2012 17:56:20 +0000
Subject: Re: [patch -longterm v2] V4L/DVB: v4l2-ioctl: integer overflow in
Message-Id: <20120105175620.GB3644@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ZfOjI3PrQbgiZnxM"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111215063445.GA2424@elgon.mountain>
 <4EE9BC25.7020303@infradead.org>
 <201112151033.35153.hverkuil@xs4all.nl>
 <4EE9C2E6.1060304@infradead.org>
 <20120103205539.GC17131@kroah.com>
 <20120105062822.GB10230@mwanda>
 <20120105164358.GA26153@kroah.com>
In-Reply-To: <20120105164358.GA26153@kroah.com>
To: Greg KH <greg@kroah.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, stable@vger.kernel.org


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 05, 2012 at 08:43:58AM -0800, Greg KH wrote:
> On Thu, Jan 05, 2012 at 09:28:22AM +0300, Dan Carpenter wrote:
> > If p->count is too high the multiplication could overflow and
> > array_size would be lower than expected.  Mauro and Hans Verkuil
> > suggested that we cap it at 1024.  That comes from the maximum
> > number of controls with lots of room for expantion.
> >=20
> > $ grep V4L2_CID include/linux/videodev2.h | wc -l
> > 211
> >=20
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> So this patch is only for 2.6.32?  But the original needs to get into
> Linus's tree first (which is what I'm guessing the other patch you sent
> is, right?)

Yep.

regards,
dan carpenter


--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPBeRDAAoJEOnZkXI/YHqRxrQP/iRWbNxcOGz7m8vMij8GL9i4
H60w8ouuvSXJyjY8cDxDPQRJsF3ziutY7wuz/7kMO1bFpHWQ5XZPQOgCKgiy+YIN
Eo0WRd9ZNOdyf9l1oYB0Q505dT8Wn4yfHVdB5QHEAiHZUieH1MTx2dJ3GjDp7t+X
msOp4AohjrrXIkP1QkUfHNnMv283FytrjtBgt6Zdy+7jME8CVLI6YORZT9c0Rcxz
jJ8sHdDIxvUtFdqoll3kD2gUz31pMDC8qtHlbCNIHfFHvl6UnGsbNT7Wg/A2r4W8
9xZLn1+/CsbKGN+1aLhTJfRGFfe5tSaQQnRE5xzo8AIW9q+g/BSdrjbwCp/ypvPW
Tbt2yKomZFNeXEikydgYOSYQbSmCt4ItbeW+8RZVmop+9wrwt87ZkS1Cqh1qHojb
wP7jEJZPAU+OTY5CkZBK7VjwWtcyMzpGEHk3n+hWnq3hxzbD+gWAlVV8QCVNjevA
pkKfZCSVoqY/NakQ8uKNdjxsZ8XjhAC7s4dISlaRc0x3BAWDlu0KhBLztEyMQcz0
pKRfAla7lx6UHkbMy7jxoi9PUzQ3JdagyljFsIyXK8PINER5YAwaZeVBzDA80AV3
hZKlEHyHklmkC6WVDWnDOUlNv45q+fBHzVKLEibUTulEmMdRhdL/FYlN1huHy2a1
f1FVJcrh0B8EQHSh1v7j
=B1XB
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
