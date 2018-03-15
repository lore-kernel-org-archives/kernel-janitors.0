From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Thu, 15 Mar 2018 14:54:27 +0000
Subject: Re: [net:master 128/139] drivers/net/can/cc770/cc770.c:712 cc770_tx_interrupt() error: dereferencing
Message-Id: <6cfe7751-988c-e782-2083-67226d597f51@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="NVyYDhWapbjVpOreVpickfrjk1dFoRtdr"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180315133656.a5scx5uizlotiifm@mwanda>
In-Reply-To: <20180315133656.a5scx5uizlotiifm@mwanda>
To: kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NVyYDhWapbjVpOreVpickfrjk1dFoRtdr
Content-Type: multipart/mixed; boundary="OVIb7ifJKV3JTgKpDCrYCqF2OL8ZYM8FF";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dan Carpenter <dan.carpenter@oracle.com>, kbuild@01.org,
 Andri Yngvason <andri.yngvason@marel.com>
Cc: kbuild-all@01.org, kernel-janitors@vger.kernel.org
Message-ID: <6cfe7751-988c-e782-2083-67226d597f51@pengutronix.de>
Subject: Re: [net:master 128/139] drivers/net/can/cc770/cc770.c:712
 cc770_tx_interrupt() error: dereferencing freed memory 'priv->tx_skb'
References: <20180315133656.a5scx5uizlotiifm@mwanda>
In-Reply-To: <20180315133656.a5scx5uizlotiifm@mwanda>

--OVIb7ifJKV3JTgKpDCrYCqF2OL8ZYM8FF
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 03/15/2018 02:36 PM, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git m=
aster
> head:   cf55612a945039476abfd73e39064b2e721c3272
> commit: 746201235b3f876792099079f4c6fea941d76183 [128/139] can: cc770: =
Fix queue stall & dropped RTR reply
>=20
> New smatch warnings:
> drivers/net/can/cc770/cc770.c:712 cc770_tx_interrupt() error: dereferen=
cing freed memory 'priv->tx_skb'
>=20
> # https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git/commit/=
?id=3D746201235b3f876792099079f4c6fea941d76183
> git remote add net https://git.kernel.org/pub/scm/linux/kernel/git/dave=
m/net.git
> git remote update net
> git checkout 746201235b3f876792099079f4c6fea941d76183
> vim +712 drivers/net/can/cc770/cc770.c
>=20
> 2a367c3a Wolfgang Grandegger 2011-11-30  671 =20
> 2a367c3a Wolfgang Grandegger 2011-11-30  672  static void cc770_tx_inte=
rrupt(struct net_device *dev, unsigned int o)
> 2a367c3a Wolfgang Grandegger 2011-11-30  673  {
> 2a367c3a Wolfgang Grandegger 2011-11-30  674  	struct cc770_priv *priv =
=3D netdev_priv(dev);
> 2a367c3a Wolfgang Grandegger 2011-11-30  675  	struct net_device_stats =
*stats =3D &dev->stats;
> 2a367c3a Wolfgang Grandegger 2011-11-30  676  	unsigned int mo =3D obj2=
msgobj(o);
> 74620123 Andri Yngvason      2018-03-14  677  	struct can_frame *cf;
> 74620123 Andri Yngvason      2018-03-14  678  	u8 ctrl1;
> 74620123 Andri Yngvason      2018-03-14  679 =20
> 74620123 Andri Yngvason      2018-03-14  680  	ctrl1 =3D cc770_read_reg=
(priv, msgobj[mo].ctrl1);
> 2a367c3a Wolfgang Grandegger 2011-11-30  681 =20
> 2a367c3a Wolfgang Grandegger 2011-11-30  682  	cc770_write_reg(priv, ms=
gobj[mo].ctrl0,
> 2a367c3a Wolfgang Grandegger 2011-11-30  683  			MSGVAL_RES | TXIE_RES =
| RXIE_RES | INTPND_RES);
> 74620123 Andri Yngvason      2018-03-14  684  	cc770_write_reg(priv, ms=
gobj[mo].ctrl1,
> 74620123 Andri Yngvason      2018-03-14  685  			RMTPND_RES | TXRQST_RE=
S | MSGLST_RES | NEWDAT_RES);
> 2a367c3a Wolfgang Grandegger 2011-11-30  686 =20
> 74620123 Andri Yngvason      2018-03-14  687  	if (unlikely(!priv->tx_s=
kb)) {
> 74620123 Andri Yngvason      2018-03-14  688  		netdev_err(dev, "missin=
g tx skb in tx interrupt\n");
> 74620123 Andri Yngvason      2018-03-14  689  		return;
> 74620123 Andri Yngvason      2018-03-14  690  	}
> 74620123 Andri Yngvason      2018-03-14  691 =20
> 74620123 Andri Yngvason      2018-03-14  692  	if (unlikely(ctrl1 & MSG=
LST_SET)) {
> 74620123 Andri Yngvason      2018-03-14  693  		stats->rx_over_errors++=
;
> 74620123 Andri Yngvason      2018-03-14  694  		stats->rx_errors++;
> 74620123 Andri Yngvason      2018-03-14  695  	}
> 74620123 Andri Yngvason      2018-03-14  696 =20
> 74620123 Andri Yngvason      2018-03-14  697  	/* When the CC770 is sen=
ding an RTR message and it receives a regular
> 74620123 Andri Yngvason      2018-03-14  698  	 * message that matches =
the id of the RTR message, it will overwrite the
> 74620123 Andri Yngvason      2018-03-14  699  	 * outgoing message in t=
he TX register. When this happens we must
> 74620123 Andri Yngvason      2018-03-14  700  	 * process the received =
message and try to transmit the outgoing skb
> 74620123 Andri Yngvason      2018-03-14  701  	 * again.
> 74620123 Andri Yngvason      2018-03-14  702  	 */
> 74620123 Andri Yngvason      2018-03-14  703  	if (unlikely(ctrl1 & NEW=
DAT_SET)) {
> 74620123 Andri Yngvason      2018-03-14  704  		cc770_rx(dev, mo, ctrl1=
);
> 74620123 Andri Yngvason      2018-03-14  705  		cc770_tx(dev, mo);
> 74620123 Andri Yngvason      2018-03-14  706  		return;
> 74620123 Andri Yngvason      2018-03-14  707  	}
> 74620123 Andri Yngvason      2018-03-14  708 =20
> 74620123 Andri Yngvason      2018-03-14  709  	can_put_echo_skb(priv->t=
x_skb, dev, 0);
>                                                 ^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^
> This frees priv->tx_skb on a couple error paths.  We should just do the=

> accounting earlier.
>=20
> 2a367c3a Wolfgang Grandegger 2011-11-30  710  	can_get_echo_skb(dev, 0)=
;

Thanks for catching that, the sequence is IMHO broken. We'll work on an
incremental patch.

> 74620123 Andri Yngvason      2018-03-14  711 =20
> 74620123 Andri Yngvason      2018-03-14 @712  	cf =3D (struct can_frame=
 *)priv->tx_skb->data;
> 74620123 Andri Yngvason      2018-03-14  713  	stats->tx_bytes +=3D cf-=
>can_dlc;
> 74620123 Andri Yngvason      2018-03-14  714  	stats->tx_packets++;
> 74620123 Andri Yngvason      2018-03-14  715 =20
> 74620123 Andri Yngvason      2018-03-14  716  	priv->tx_skb =3D NULL;
> 74620123 Andri Yngvason      2018-03-14  717 =20
> 2a367c3a Wolfgang Grandegger 2011-11-30  718  	netif_wake_queue(dev);
> 2a367c3a Wolfgang Grandegger 2011-11-30  719  }
> 2a367c3a Wolfgang Grandegger 2011-11-30  720 =20

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--OVIb7ifJKV3JTgKpDCrYCqF2OL8ZYM8FF--

--NVyYDhWapbjVpOreVpickfrjk1dFoRtdr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEENrCndlB/VnAEWuH5k9IU1zQoZfEFAlqqiSMACgkQk9IU1zQo
ZfGzwgf9FNMeJs3wchp0gyAomcssfZ+1UEky35k4TT7exk8+LYiDik4MC820Wuo0
IVLXXWttANcMYCwWM32CH1VfAkKESZNjkMHg9LpjBE6HxZ4f1ELyi0vxOglmbFk7
Hr4Z4dHLAk0RSgOgpJ4v4sSSooELNFfPpOKillGIKZMks1wH2zaFXmaqOBgdZMng
BcmTSxtkElDl7n73BLzh4xKgi5TIoT8q9WvcxoGH7T08xpQtGO9K0a12SBssgOu8
tYFqyzfkv8l+FTy6/e8sRo9fuj2jnKtJl7wMKwxIkpUpaBESOYp8EEnl4weeng+J
6k44B6PT9O8lEsQ/4bRGZdwPhBmfmA==
=f1wJ
-----END PGP SIGNATURE-----

--NVyYDhWapbjVpOreVpickfrjk1dFoRtdr--
