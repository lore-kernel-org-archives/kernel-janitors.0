From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Thu, 15 Mar 2018 15:17:59 +0000
Subject: Re: [net:master 128/139] drivers/net/can/cc770/cc770.c:712 cc770_tx_interrupt() error: dereferencing
Message-Id: <df92a055-7cbe-6436-0936-cea1eada21cd@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="beGKNUx42qYEGI2vTYh69ZVATmW4iYuE4"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180315133656.a5scx5uizlotiifm@mwanda>
In-Reply-To: <20180315133656.a5scx5uizlotiifm@mwanda>
To: kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--beGKNUx42qYEGI2vTYh69ZVATmW4iYuE4
Content-Type: multipart/mixed; boundary="7fZ26Aa5nKTGcITbYJb1WbSuOXeICgBHL";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dan Carpenter <dan.carpenter@oracle.com>, kbuild@01.org,
 Andri Yngvason <andri.yngvason@marel.com>
Cc: kbuild-all@01.org, kernel-janitors@vger.kernel.org,
 linux-can <linux-can@vger.kernel.org>
Message-ID: <df92a055-7cbe-6436-0936-cea1eada21cd@pengutronix.de>
Subject: Re: [net:master 128/139] drivers/net/can/cc770/cc770.c:712
 cc770_tx_interrupt() error: dereferencing freed memory 'priv->tx_skb'
References: <20180315133656.a5scx5uizlotiifm@mwanda>
 <6cfe7751-988c-e782-2083-67226d597f51@pengutronix.de>
In-Reply-To: <6cfe7751-988c-e782-2083-67226d597f51@pengutronix.de>

--7fZ26Aa5nKTGcITbYJb1WbSuOXeICgBHL
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 03/15/2018 03:54 PM, Marc Kleine-Budde wrote:
> On 03/15/2018 02:36 PM, Dan Carpenter wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git =
master
>> head:   cf55612a945039476abfd73e39064b2e721c3272
>> commit: 746201235b3f876792099079f4c6fea941d76183 [128/139] can: cc770:=
 Fix queue stall & dropped RTR reply
>>
>> New smatch warnings:
>> drivers/net/can/cc770/cc770.c:712 cc770_tx_interrupt() error: derefere=
ncing freed memory 'priv->tx_skb'
>>
>> # https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git/commit=
/?id=3D746201235b3f876792099079f4c6fea941d76183
>> git remote add net https://git.kernel.org/pub/scm/linux/kernel/git/dav=
em/net.git
>> git remote update net
>> git checkout 746201235b3f876792099079f4c6fea941d76183
>> vim +712 drivers/net/can/cc770/cc770.c
>>
>> 2a367c3a Wolfgang Grandegger 2011-11-30  671 =20
>> 2a367c3a Wolfgang Grandegger 2011-11-30  672  static void cc770_tx_int=
errupt(struct net_device *dev, unsigned int o)
>> 2a367c3a Wolfgang Grandegger 2011-11-30  673  {
>> 2a367c3a Wolfgang Grandegger 2011-11-30  674  	struct cc770_priv *priv=
 =3D netdev_priv(dev);
>> 2a367c3a Wolfgang Grandegger 2011-11-30  675  	struct net_device_stats=
 *stats =3D &dev->stats;
>> 2a367c3a Wolfgang Grandegger 2011-11-30  676  	unsigned int mo =3D obj=
2msgobj(o);
>> 74620123 Andri Yngvason      2018-03-14  677  	struct can_frame *cf;
>> 74620123 Andri Yngvason      2018-03-14  678  	u8 ctrl1;
>> 74620123 Andri Yngvason      2018-03-14  679 =20
>> 74620123 Andri Yngvason      2018-03-14  680  	ctrl1 =3D cc770_read_re=
g(priv, msgobj[mo].ctrl1);
>> 2a367c3a Wolfgang Grandegger 2011-11-30  681 =20
>> 2a367c3a Wolfgang Grandegger 2011-11-30  682  	cc770_write_reg(priv, m=
sgobj[mo].ctrl0,
>> 2a367c3a Wolfgang Grandegger 2011-11-30  683  			MSGVAL_RES | TXIE_RES=
 | RXIE_RES | INTPND_RES);
>> 74620123 Andri Yngvason      2018-03-14  684  	cc770_write_reg(priv, m=
sgobj[mo].ctrl1,
>> 74620123 Andri Yngvason      2018-03-14  685  			RMTPND_RES | TXRQST_R=
ES | MSGLST_RES | NEWDAT_RES);
>> 2a367c3a Wolfgang Grandegger 2011-11-30  686 =20
>> 74620123 Andri Yngvason      2018-03-14  687  	if (unlikely(!priv->tx_=
skb)) {
>> 74620123 Andri Yngvason      2018-03-14  688  		netdev_err(dev, "missi=
ng tx skb in tx interrupt\n");
>> 74620123 Andri Yngvason      2018-03-14  689  		return;
>> 74620123 Andri Yngvason      2018-03-14  690  	}
>> 74620123 Andri Yngvason      2018-03-14  691 =20
>> 74620123 Andri Yngvason      2018-03-14  692  	if (unlikely(ctrl1 & MS=
GLST_SET)) {
>> 74620123 Andri Yngvason      2018-03-14  693  		stats->rx_over_errors+=
+;
>> 74620123 Andri Yngvason      2018-03-14  694  		stats->rx_errors++;
>> 74620123 Andri Yngvason      2018-03-14  695  	}
>> 74620123 Andri Yngvason      2018-03-14  696 =20
>> 74620123 Andri Yngvason      2018-03-14  697  	/* When the CC770 is se=
nding an RTR message and it receives a regular
>> 74620123 Andri Yngvason      2018-03-14  698  	 * message that matches=
 the id of the RTR message, it will overwrite the
>> 74620123 Andri Yngvason      2018-03-14  699  	 * outgoing message in =
the TX register. When this happens we must
>> 74620123 Andri Yngvason      2018-03-14  700  	 * process the received=
 message and try to transmit the outgoing skb
>> 74620123 Andri Yngvason      2018-03-14  701  	 * again.
>> 74620123 Andri Yngvason      2018-03-14  702  	 */
>> 74620123 Andri Yngvason      2018-03-14  703  	if (unlikely(ctrl1 & NE=
WDAT_SET)) {
>> 74620123 Andri Yngvason      2018-03-14  704  		cc770_rx(dev, mo, ctrl=
1);
>> 74620123 Andri Yngvason      2018-03-14  705  		cc770_tx(dev, mo);
>> 74620123 Andri Yngvason      2018-03-14  706  		return;
>> 74620123 Andri Yngvason      2018-03-14  707  	}
>> 74620123 Andri Yngvason      2018-03-14  708 =20
>> 74620123 Andri Yngvason      2018-03-14  709  	can_put_echo_skb(priv->=
tx_skb, dev, 0);
>>                                                 ^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^
>> This frees priv->tx_skb on a couple error paths.  We should just do th=
e
>> accounting earlier.

=2E..even in a non error path, depending on some other configuration.

>> 2a367c3a Wolfgang Grandegger 2011-11-30  710  	can_get_echo_skb(dev, 0=
);
>=20
> Thanks for catching that, the sequence is IMHO broken. We'll work on an=

> incremental patch.

It looks quite strange, but it needed. And yes the correct fix is to do
the accounting before.

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--7fZ26Aa5nKTGcITbYJb1WbSuOXeICgBHL--

--beGKNUx42qYEGI2vTYh69ZVATmW4iYuE4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEENrCndlB/VnAEWuH5k9IU1zQoZfEFAlqqjqgACgkQk9IU1zQo
ZfErWgf+OjhV+EK0gTIf2KD6/PBPH95A2O0L4j5GxULmXtrAUJqEYNIzibcQdkT0
QugpTUkfc9jXK0gR9pfb6iizbSSnXopQprikHN8kcLx++LC3o7quzbyJl58gkAzh
og2lQvBAcI8yekJ4en49CGLS4Zy8PgCZGMcl4YdTAY5/W1QgZEm34XdDci77F0TE
YiOA/IafH409H07dN4KCz5QQ/VAJWrPkdfvEM0bJtpUBcaFiBspE/dZNfGbH+d5h
2f6zDdIVoSsqPOkAxW6ztOAWMWcTU19a7SU65evcMTPmo/GxeO1uoC1miHyUzPV0
LWSpcFVvK/gOUXNG8pyoIhG1nD5wdA==
=6NvF
-----END PGP SIGNATURE-----

--beGKNUx42qYEGI2vTYh69ZVATmW4iYuE4--
