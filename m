From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Date: Thu, 16 Oct 2014 16:29:01 +0000
Subject: Re: [patch] i40e: _MASK vs _SHIFT typo in i40e_handle_mdd_event()
Message-Id: <1413476941.2412.60.camel@jtkirshe-mobl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-DhaguruI0qbn5XqTy8ry"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141016123820.GA30053@mwanda>
In-Reply-To: <20141016123820.GA30053@mwanda>
To: kernel-janitors@vger.kernel.org


--=-DhaguruI0qbn5XqTy8ry
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2014-10-16 at 15:38 +0300, Dan Carpenter wrote:
> We accidentally mask by the _SHIFT variable.  It means that "event" is
> always zero.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Not tested.

Thanks Dan, I have added your patch to my queue.

--=-DhaguruI0qbn5XqTy8ry
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJUP/JNAAoJEOVv75VaS+3Oop0P/R/OvyLvM4xaOVQmp/ZwqxJ9
e3FzWhHtNlVhS/DYGpoMYFy17es1wLd61ltRDI+N1P0zUQlTnJKeWyD2bxEYoIgi
6839H+SX3MhQW9Ai9oiSgt3xDGc+8oBzi8DR6Tma8IaEoXA/nJr2QxNo9+2GB9iv
hLtTECiAW/IrCSMXm+L9nUQz2RPG/yEZYsQZ+Rpr+Ntcvm3M7isFTz20bYxSD/K+
AJNXwUV2WwXtdsRfRXuHDUta25TXhQLwhTGhbO4s1385Xe5ANoLtGxc9yMm0dsh6
IokYLTYtY0jryeHDFhW7N/WxOuIYv0SX64fwXtqzFou0mim9b3wFYoB2YUqoabbw
DGjWbwKKudTMX8EstST8MbXyrwSQssUAPvl0Tw+tJkaNXUaBgkH9fsOIrTFNHTSS
4CXhBolue9BHkmCCSm9WVN/hJ4GS7M/uHvNsyVoCLXPxZwcEg/w6Q0xShHPBYwuB
oYgs5S2MYMkSCXvckmJN6vW2NDJQI4raag91hWwQpJock+TQi9PoZNEoehwkfOhF
SaY/kjHo8fe+Qvr+mq7p25cp189SsR2c7nZ6U4vx3Bzh5AnxM8Cxqiugu5aSG7eR
geW8pbZD15g54VW4sXkGEHyWXNsbHACqzKTFJoVhrxtPKzd/Z0XwWremPkbWtX0g
CA4S2TinJkhw4KlyP3Tv
=JSWD
-----END PGP SIGNATURE-----

--=-DhaguruI0qbn5XqTy8ry--

