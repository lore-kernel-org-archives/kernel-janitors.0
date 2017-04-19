From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Wed, 19 Apr 2017 15:24:55 +0000
Subject: Re: [bug report] net: stmmac: adding multiple buffers for rx
Message-Id: <6eaea136-5b51-b7ea-94b0-0479955e7abd@synopsys.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170412194946.GA28352@mwanda>
In-Reply-To: <20170412194946.GA28352@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Dan,

=C0s 8:49 PM de 4/12/2017, Dan Carpenter escreveu:
> Hello Joao Pinto,
>=20
> The patch 54139cf3bb33: "net: stmmac: adding multiple buffers for rx"
> from Apr 6, 2017, leads to the following static checker warning:
>=20
> 	drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1274 init_dma_rx_desc_=
rings()
> 	warn: always true condition '(queue >=3D 0) =3D> (0-u32max >=3D 0)'
>=20
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>   1270 =20
>   1271          return 0;
>   1272 =20
>   1273  err_init_rx_buffers:
>   1274          while (queue >=3D 0) {
>                        ^^^^^^^^^^
> This is harmless because of the break statement later, but slightly
> annoying because of the static checker warning.
>=20
>   1275                  while (--i >=3D 0)
>   1276                          stmmac_free_rx_buffer(priv, queue, i);
>   1277 =20
>   1278                  if (queue =3D 0)
>   1279                          break;
>   1280 =20
>   1281                  i =3D DMA_RX_SIZE;
>   1282                  queue--;
>   1283          }
>   1284 =20
>   1285          return ret;
>   1286  }
>=20
> regards,
> dan carpenter
>=20

Sorry for delayed answer. I will fix this ASAP. Thanks.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
