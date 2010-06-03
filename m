From: Sven Eckelmann <sven.eckelmann@gmx.de>
Date: Thu, 03 Jun 2010 10:22:47 +0000
Subject: Re: [patch] Staging: batman-adv: return -EFAULT on copy_to_user errors
Message-Id: <201006031222.59904.sven.eckelmann@gmx.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nextPart3064175.y5DMKWIHHo"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100603100437.GS5483@bicker>
In-Reply-To: <20100603100437.GS5483@bicker>
To: kernel-janitors@vger.kernel.org

--nextPart3064175.y5DMKWIHHo
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dan Carpenter wrote:
> copy_to_user() returns the number of bites remaining but we want to
> return a negative error code here.
>=20
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>=20
> diff --git a/drivers/staging/batman-adv/device.c
> b/drivers/staging/batman-adv/device.c index ad82ec4..c7f3978 100644
> --- a/drivers/staging/batman-adv/device.c
> +++ b/drivers/staging/batman-adv/device.c
> @@ -196,7 +196,7 @@ ssize_t bat_device_read(struct file *file, char __user
> *buf, size_t count, kfree(device_packet);
>=20
>  	if (error)
> -		return error;
> +		return -EFAULT;
>=20
>  	return sizeof(struct icmp_packet);
>  }

Thanks for your patch, but this collides with a patch currently waiting in=
=20
GregKH's queue. I will port that patch on top of that.

Best regards,
	Sven

--nextPart3064175.y5DMKWIHHo
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAABCgAGBQJMB4J5AAoJEF2HCgfBJntGGDQQAMgvDdhXmCdMEK6/TASvg+pD
djv72t8m1gSyIGJ1OhAoNUhLDsDa8UgX1BAleOzE17lqjNMJyQ9Nz15EkEv0f+lt
3mJYIhrPt0G0HwYq71NfDc225xoFtd97R3kP4tfAGt6wqFj1P+8Eql1qpgNtGfCa
3oSRcdwZzCgVROFE8fd/BNjqukh1aVG/4ULe/nVmnipY+n3mNb+RO83vqCKRF9Xz
0DuWNP9ZjDz3Rxlt0cOnkUzDSPGiSXcgYbTT9zU6acpKHZhHD6wX/DKkHINM5th9
wJyhC2l1c6MJmpqx6q0qBtHd2v8Fbi49bN95maLsC+ZGHOj5JyYvjb2dGeWpDcCt
D1/CgOu4MEPSNG1bfVKTGQvHMae3rhs883oq4jrghoopykPBrt3gkQtUbuBzJbt8
M8LaBEtSMh/UmvXDaWYOiS5cQUN0YHQMoAAmhD4SvoJpI3UHIeJmRlQX95nkO4A2
UPKY9QcTDLPb8xV+hMPVmKl8Mco4Ppc7GKnPqQVsF0UacXDpsl9ejELbKwYFfjBW
nktqJ1mKwC5qV3gBqwKcsH1phVW3MTFQfPNReFqM2GuQdhBTjnXA4JsyJiUM6gew
sG6VBHQWov/JcbQeK2299LR6NukaOop4LO+HfLH3hPSl1vv90J9llafaPo1jXN3f
oABrCScB5L7siqYyy8mH
=AlCD
-----END PGP SIGNATURE-----

--nextPart3064175.y5DMKWIHHo--
