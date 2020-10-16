From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Fri, 16 Oct 2020 07:51:41 +0000
Subject: Re: [PATCH net] can: peak_usb: add range checking in decode operations
Message-Id: <9d961074-5e51-4e90-191e-791f5de8da9f@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="PoV6K5uvyOleD7r5AvPcILSeLJJ1VrlDR"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200813140604.GA456946@mwanda>
 <VI1PR03MB50536300783DBBEAFC7B0367D6050@VI1PR03MB5053.eurprd03.prod.outlook.com>
 <169f62c4-ee2d-6ba2-2a78-640df8edcde0@hartkopp.net>
 <VI1PR03MB5053CAE3ED35D8E9C23063F8D6030@VI1PR03MB5053.eurprd03.prod.outlook.com>
In-Reply-To: <VI1PR03MB5053CAE3ED35D8E9C23063F8D6030@VI1PR03MB5053.eurprd03.prod.outlook.com>
To: =?UTF-8?Q?St=c3=a9phane_Grosjean?= <s.grosjean@peak-system.com>, Oliver Hartkopp <socketcan@hartkopp.net>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Andri Yngvason <andri.yngvason@marel.com>, "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Wolfgang Grandegger <wg@grandegger.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PoV6K5uvyOleD7r5AvPcILSeLJJ1VrlDR
Content-Type: multipart/mixed; boundary="iei3976M3SaOGH3LKPh2BdJySyGItjbZM";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: =?UTF-8?Q?St=c3=a9phane_Grosjean?= <s.grosjean@peak-system.com>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Andri Yngvason <andri.yngvason@marel.com>,
 "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 Wolfgang Grandegger <wg@grandegger.com>
Message-ID: <9d961074-5e51-4e90-191e-791f5de8da9f@pengutronix.de>
Subject: Re: [PATCH net] can: peak_usb: add range checking in decode
 operations
References: <20200813140604.GA456946@mwanda>
 <VI1PR03MB50536300783DBBEAFC7B0367D6050@VI1PR03MB5053.eurprd03.prod.outlook.com>
 <169f62c4-ee2d-6ba2-2a78-640df8edcde0@hartkopp.net>
 <VI1PR03MB5053CAE3ED35D8E9C23063F8D6030@VI1PR03MB5053.eurprd03.prod.outlook.com>
In-Reply-To: <VI1PR03MB5053CAE3ED35D8E9C23063F8D6030@VI1PR03MB5053.eurprd03.prod.outlook.com>

--iei3976M3SaOGH3LKPh2BdJySyGItjbZM
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 10/16/20 9:43 AM, St=C3=A9phane Grosjean wrote:
> Thank you for your detailed answer. And so? AFAIK I saw that this patch=
 is still
> not in mainline. What needs to be done for it to be there? Should I bri=
ng an
> Ack, for example?

If you have reviewed the patch, give an Ack or Reviewed-by.

regards,
Marc
--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |


--iei3976M3SaOGH3LKPh2BdJySyGItjbZM--

--PoV6K5uvyOleD7r5AvPcILSeLJJ1VrlDR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAl+JUQ0ACgkQqclaivrt
76lIgQgArEg6AHJWyInC9Eadqt26bkjdEjmbjThdeMSM4/lh7veZGqwljt+0NpdG
R7ER/nuhkeZ6FRaxyEti60tEvtdvxMHmXjsdoXJcXpZOlxAL21iFftCEsChf0ncT
7j1+3OL36JkLO0ug71pS9xGpxgw8XjMBjX7W7tZPqHc/s5MmVWPhkQDaYiop58TL
7DVmqz1vB/Jnv6sX9nShqMDURTIeyOjtsat86s0Ze4qIq2/q5BrOsuuj3bxbhO1S
C16mLtivf4b3qVLEWQGltGf0+J/cTmuP3NtQOoLAvcXxHvbUO9pH/AzIf7QLXK1R
JmOndByYYczI2S43fO8LKurzHasVxQ==
=v+oh
-----END PGP SIGNATURE-----

--PoV6K5uvyOleD7r5AvPcILSeLJJ1VrlDR--
