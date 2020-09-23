From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Wed, 23 Sep 2020 11:53:23 +0000
Subject: Re: [PATCH net-next] can: mcp25xxfd: fix a leak in mcp25xxfd_ring_free()
Message-Id: <2688ed6b-e3cf-deaa-bc28-f1d6c75b13cd@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vmHZZpqxCKCTiS4ASsJw5QnsSDzrpHdki"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200923112752.GA1473821@mwanda>
In-Reply-To: <20200923112752.GA1473821@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Thomas Kopp <thomas.kopp@microchip.com>, Wolfgang Grandegger <wg@grandegger.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-can@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vmHZZpqxCKCTiS4ASsJw5QnsSDzrpHdki
Content-Type: multipart/mixed; boundary="dqZJlXdrIUR8xIXR4FPVKU4KVmkUqWs0G";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Thomas Kopp <thomas.kopp@microchip.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-can@vger.kernel.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Message-ID: <2688ed6b-e3cf-deaa-bc28-f1d6c75b13cd@pengutronix.de>
Subject: Re: [PATCH net-next] can: mcp25xxfd: fix a leak in
 mcp25xxfd_ring_free()
References: <20200923112752.GA1473821@mwanda>
In-Reply-To: <20200923112752.GA1473821@mwanda>

--dqZJlXdrIUR8xIXR4FPVKU4KVmkUqWs0G
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 9/23/20 1:27 PM, Dan Carpenter wrote:
> This loop doesn't free the first element of the array.  The "i > 0" has=

> to be changed to "i >=3D 0".
>=20
> Fixes: 55e5b97f003e ("can: mcp25xxfd: add driver for Microchip MCP25xxF=
D SPI CAN")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to linux-can-next

Tnx,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |


--dqZJlXdrIUR8xIXR4FPVKU4KVmkUqWs0G--

--vmHZZpqxCKCTiS4ASsJw5QnsSDzrpHdki
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAl9rNzMACgkQqclaivrt
76m4Tgf9GcSWQWVcfoMu3yPaIhj4eopQl0yP4R3Tzqa4peGGt/jznseUVA+8kXKR
YKbEntZ9E2te42gPNn7RoZ+zYxOIpOSNiLN/DHaiGp4tMYH9D265fVOi2JIaIFin
5FyBykwScIeo9LahPY6W09Rd1DYNOWqjOK1rS0WvDWWOBlTnowmhfrsz7PXHbcXJ
7qpa838y5tFQwtspjSQe1MtKFbK1hO2UJAkykNuP/tuS85zeVPWx6pVkcyTJG2UH
XpaDiuKr7j85Ugk/WiuUJHDP+Ku37W8gKHwiwv9a9pEocDH5VDEzKPOasIjSCoLq
jsEVrNXgJYYHoSUbRvdH9ajRUhDISQ==
=V7cD
-----END PGP SIGNATURE-----

--vmHZZpqxCKCTiS4ASsJw5QnsSDzrpHdki--
