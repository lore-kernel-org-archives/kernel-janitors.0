From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Nov 2011 08:32:54 +0000
Subject: Re: [patch -next] 6LoWPAN: double free in lowpan_fragment_xmit()
Message-Id: <20111116083254.GB4349@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="EuxKj2iCbKjpUGkD"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111116082138.GA10264@elgon.mountain>
In-Reply-To: <20111116082138.GA10264@elgon.mountain>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
Cc: Sergey Lapin <slapin@ossfans.org>, "David S. Miller" <davem@davemloft.net>, linux-zigbee-devel@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 16, 2011 at 11:21:38AM +0300, Dan Carpenter wrote:
> dev_queue_xmit() consumes its own skb, so the call to dev_kfree_skb()
> ieee802154/6lowpan.clowpan_fragment_xmits a double free.
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Dur...  I messed up my commit message right before sending.  Will
resend.

regards,
dan carpenter



--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJOw3U2AAoJEOnZkXI/YHqRwEcP/36IBMZs8ZWVBFFVqKzFGBB2
wwOdOBIpVrHyI7r/5fRb7HweAwVPItQKd8Ob6JyW0S1XHqe22LkfGDz7sZyAmVzL
aMfHpX6n3uZgosSfOgMNMyI2pR3qzZD1KJKPwJgBvYmEmu4SUfJ0CiD/HE/2PVFn
qKJNsxR9adFZOil9kFxfYzCaLkBrgFYSXzeWKLY3ooQpXbqtluT56uFgDKMLo7F7
nSFfr2Y/svqhcOjtBKzRTx1CHUZj9MWPY3jYd6k5LaNHeqs7h4ex+CiqQEH2o43D
PbAxPDo/ZxusTJsIPnAeFfu7ckeJsFeGcKZjwLnzUA1vYGOjAOLv3jPvvXJOkRwF
NtSffwo5+lZrUO5mZIkzejndq+JZX0BGGrz28cdJM+hUiy5SNgns88ioZeL2oiGM
g9jDtIo8ZJNumtxEWx3eIixT0Wxn1mWrg6Wr+IJbwITvuXpQi2/AWYxGZrPu9fJN
Bca0yfP1C3isJ53Mt9P4ro4ngZzxRfIDC99NlNQJAc63Vhy7YYc5lPb3NZa4D3G5
6hLCshwcN6LN/u6/WtyPf+zthxvddaMNrYrUcMdRSka0dI0+y3zw+1V3qN9nXA3P
Uq0HQ6DtSyX5jPPpfUSXzBFYmGJEJwQ7eUpI5/CthyjDbX1EZzZ91YK3gsWgXPEq
I5TCWp6pBrCIovqu5Vsy
=WdKc
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--
