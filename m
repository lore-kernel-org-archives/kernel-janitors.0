From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Mon, 26 Oct 2020 13:41:09 +0000
Subject: Re: [PATCH net] can: peak_usb: add range checking in decode operations
Message-Id: <22a213df-5033-70da-0797-1d0727520d9e@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="snynCzNzqxKniaos0OyWXShiO7DNDMXkF"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200813140604.GA456946@mwanda>
 <VI1PR03MB5053AC24D22445459C5FAF0CD6190@VI1PR03MB5053.eurprd03.prod.outlook.com>
In-Reply-To: <VI1PR03MB5053AC24D22445459C5FAF0CD6190@VI1PR03MB5053.eurprd03.prod.outlook.com>
To: =?UTF-8?Q?St=c3=a9phane_Grosjean?= <s.grosjean@peak-system.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Andri Yngvason <andri.yngvason@marel.com>, Oliver Hartkopp <socketcan@hartkopp.net>, "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Wolfgang Grandegger <wg@grandegger.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--snynCzNzqxKniaos0OyWXShiO7DNDMXkF
Content-Type: multipart/mixed; boundary="6kn5cEE0GiTmDVO5IhFz1trl0OXKiBaal";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: =?UTF-8?Q?St=c3=a9phane_Grosjean?= <s.grosjean@peak-system.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Andri Yngvason <andri.yngvason@marel.com>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 Wolfgang Grandegger <wg@grandegger.com>
Message-ID: <22a213df-5033-70da-0797-1d0727520d9e@pengutronix.de>
Subject: Re: [PATCH net] can: peak_usb: add range checking in decode
 operations
References: <20200813140604.GA456946@mwanda>
 <VI1PR03MB5053AC24D22445459C5FAF0CD6190@VI1PR03MB5053.eurprd03.prod.outlook.com>
In-Reply-To: <VI1PR03MB5053AC24D22445459C5FAF0CD6190@VI1PR03MB5053.eurprd03.prod.outlook.com>

--6kn5cEE0GiTmDVO5IhFz1trl0OXKiBaal
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 10/26/20 2:28 PM, St=C3=A9phane Grosjean wrote:
> =E2=80=8B=E2=80=8BHello Dan,
>=20
> You have my Ack.
>=20
> Acked-by: Stephane Grosjean <s.grosjean@peak-system.com>

Applied to linux-can/testing.

Tnx,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |


--6kn5cEE0GiTmDVO5IhFz1trl0OXKiBaal--

--snynCzNzqxKniaos0OyWXShiO7DNDMXkF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAl+W0fUACgkQqclaivrt
76nnhQgAl6+Fb5/ZrCTi01YRbiLyOBNunHKJQ26DhzVt5pSidGdvrj2aSVVfPj5N
1bX0qYIekwYbAt4Mt2VrERaYD+K9cTalVCHTAgDwD0jY5PHzwNSF6V5NHnoGKrlh
e0Bftf7aXi/N/wYxQlviOAwUZRBykH9duA6GceylGBO/6DUWwWkIZxWXAZttjA9Q
Dfypihooj/pyLZZOItOvPFk0emKJYueZLRRAimXwxGPXu/dz5C/WvlYaErW+WzqC
/rdTcac+82N0Zqs3fMp+VJYxvi0+yf+FifaR9bqT6mSn6oBWNy8LkoAKHoJJsdwK
eTckJZ7qdtG3/OcTsnoHVTx03cXVjw==
=zpgy
-----END PGP SIGNATURE-----

--snynCzNzqxKniaos0OyWXShiO7DNDMXkF--
