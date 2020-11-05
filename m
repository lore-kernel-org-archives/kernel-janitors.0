From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Thu, 05 Nov 2020 13:07:26 +0000
Subject: Re: [PATCH][next] can: usb: fix potential integer overflow on shift of a int
Message-Id: <8d13950d-bd89-7184-7ec7-d1b308a51069@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="fKFLKQqxjuHZ7Rc0ZeeosIM82x3wmgzvW"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201105112427.40688-1-colin.king@canonical.com>
In-Reply-To: <20201105112427.40688-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>, Wolfgang Grandegger <wg@grandegger.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Stephane Grosjean <s.grosjean@peak-system.com>, linux-can@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fKFLKQqxjuHZ7Rc0ZeeosIM82x3wmgzvW
Content-Type: multipart/mixed; boundary="UzuUnkocISsTmrvIHSR6pwGpUAdKvcZOK";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Colin King <colin.king@canonical.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Stephane Grosjean <s.grosjean@peak-system.com>, linux-can@vger.kernel.org,
 netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <8d13950d-bd89-7184-7ec7-d1b308a51069@pengutronix.de>
Subject: Re: [PATCH][next] can: usb: fix potential integer overflow on shift
 of a int
References: <20201105112427.40688-1-colin.king@canonical.com>
In-Reply-To: <20201105112427.40688-1-colin.king@canonical.com>

--UzuUnkocISsTmrvIHSR6pwGpUAdKvcZOK
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 11/5/20 12:24 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The left shift of int 32 bit integer constant 1 is evaluated using
> 32 bit arithmetic and then assigned to a signed 64 bit variable. In
> the case where time_ref->adapter->ts_used_bits is 32 or more this
> can lead to an oveflow. Avoid this by shifting using the BIT_ULL macro
> instead.
>=20
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: bb4785551f64 ("can: usb: PEAK-System Technik USB adapters driver=
 core")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to linux-can/testing (not to next).

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |


--UzuUnkocISsTmrvIHSR6pwGpUAdKvcZOK--

--fKFLKQqxjuHZ7Rc0ZeeosIM82x3wmgzvW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAl+j+Q4ACgkQqclaivrt
76lDAAgAmVS/8BHbRxhbJFsf90ZpCLXW2O8xQzYxVfGCDekpKN7zmOJbbUI10JP4
uDteyJfwK6v7VoxdXuS5l4txDmUZJKcrp3GBrU+UBwD0f4zI6DMrX+F1rXLkoMUM
KI1pGjZQmf8QueXO8fsP1MIPh2shRHTbbOb1OL1bQK5/lpjiclnJj8F9Z1mdE1ll
wVSnye1cXHE8r+ojIZYZN59Arw4bjA4t9zeMVry44j1VP4XjwNxvgDrjAsp2dAyf
wqT7lSerPFKEEf2UaTj1EHuUk8SD+VX25FxJrb/BB7LO4DgNoaI1JS7D280IO1lO
yVDmJCfaOR7jN1C2DDyL23EtOKOWYw==
=oerU
-----END PGP SIGNATURE-----

--fKFLKQqxjuHZ7Rc0ZeeosIM82x3wmgzvW--
