From: Sjur BRENDELAND <sjur.brandeland@stericsson.com>
Date: Mon, 21 Nov 2011 14:36:02 +0000
Subject: RE: [patch] caif: fix endian conversion in cffrml_transmit()
Message-Id: <81C3A93C17462B4BBD7E272753C105791FB0A91AF2@EXDCVYMBSTM005.EQ1STM.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111121061722.GD7354@elgon.mountain>
In-Reply-To: <20111121061722.GD7354@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan,
=20
> The "tmp" variable here is used to store the result of cpu_to_le16()
> so it should be a u16 instead of an int.  We want the high bits set
> and the current code works on little endian systems but not on big
> endian systems.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks OK by me, unless you want to make sparse with __CHECK_ENDIAN__=20
shut up, then you should use __le16 ;-)

Acked-by: Sjur Br=E6ndeland <sjur.brandeland@stericsson.com>

Regards,
Sjur

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
