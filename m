From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Date: Thu, 08 Oct 2020 09:38:04 +0000
Subject: Re: [PATCH v2] staging: vchiq: Fix list_for_each exit tests
Message-Id: <ba10795b535daf1b430db97d3b1388c7407f0058.camel@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-bJZNEHK0zokYDxMMYOJM"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201006134748.GA2076872@mwanda>
In-Reply-To: <20201006134748.GA2076872@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcelo Diop-Gonzalez <marcgonzalez@google.com>, kernel-janitors@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Jamal Shareef <jamal.k.shareef@gmail.com>


--=-bJZNEHK0zokYDxMMYOJM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-10-06 at 16:47 +0300, Dan Carpenter wrote:
> After a list_for_each_entry() loop, the list iterator is always non-NULL
> so these conditions don't work.  If the "waiter" is not found then this
> results in an out of bounds access.
>=20
> I have fixed it by introducing a new "found" variable.  In one case, I
> used an else statement for readability.
>=20
> Fixes: 46e4b9ec4fa4 ("staging: vchiq_arm: use list_for_each_entry when ac=
cessing bulk_waiter_list")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>


--=-bJZNEHK0zokYDxMMYOJM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl9+3fwACgkQlfZmHno8
x/577Qf/daJSMYN1mVGd6kbFmgeUNSamil+eQQmoE3RQSpYvT4Z7pCUFg7RggER3
0aRrcagMt0mZ2qrQdr+CEEMz2Xx9nK9s/bn1HX1QqyTpitm3zDCIDqlpqLBy8bBU
tI8Ba6sFktxj4wS4bahtGG8vQvYQDu9shuip+8jUDNqLj9ufp6rhMpDuiyPfXrKj
4IMs8tohRI6eED/MvLrTqg6hjjZOPYDH7brsszdoJqf4OjPA7Od9VkErR439zkaZ
G5REV/XkIShJo5IOf+toT6IAEl7eDR8xzKr2goe7hN+miLVoKtd22uM05NWINBnI
uavRa8OK57hu/cZVUcEB2PgavmZjBA==
=45fL
-----END PGP SIGNATURE-----

--=-bJZNEHK0zokYDxMMYOJM--
