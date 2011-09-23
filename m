From: Sjur BRENDELAND <sjur.brandeland@stericsson.com>
Date: Fri, 23 Sep 2011 10:38:45 +0000
Subject: RE: [patch v2] caif: add error handling for allocation
Message-Id: <81C3A93C17462B4BBD7E272753C105791D2BC1882D@EXDCVYMBSTM005.EQ1STM.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAJK669Yb6V=xr9ZvQGOKGEvmzO1JGhrHD+sR69b04EQxUjOOrQ@mail.gmail.com>
 <20110921072159.GJ4999@elgon.mountain>
In-Reply-To: <20110921072159.GJ4999@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

[Dan]:=20
> The allocation of "phyinfo" wasn't checked, and also the allocation
> wasn't freed on error paths.  Sjur Br=E6ndeland pointed out as well
> that "phy_driver" should be freed on the error path too.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good, thank you Dan.
Acked-by: Sjur Br=E6ndeland <sjur.brandeland@stericsson.com>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
