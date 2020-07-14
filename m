From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Tue, 14 Jul 2020 19:52:35 +0000
Subject: [PATCH 1/4] e1000/e1000_ethtool.c: Remove unnecessary usages of memset
Message-Id: <20200714194035.GA21382@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="VS++wcV0S1rZb1Fb"
List-Id: <kernel-janitors.vger.kernel.org>
To: jeffrey.t.kirsher@intel.com, davem@davemloft.net, kuba@kernel.org
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Replace memsets of 1 byte with simple assignments.
Issue reported by checkpatch.pl.

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/net/ethernet/intel/e1000/e1000_ethtool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000/e1000_ethtool.c b/drivers/net=
/ethernet/intel/e1000/e1000_ethtool.c
index 0b4196d2cdd4..f976e9daa3d8 100644
--- a/drivers/net/ethernet/intel/e1000/e1000_ethtool.c
+++ b/drivers/net/ethernet/intel/e1000/e1000_ethtool.c
@@ -1356,8 +1356,8 @@ static void e1000_create_lbtest_frame(struct sk_buff =
*skb,
 	memset(skb->data, 0xFF, frame_size);
 	frame_size &=3D ~1;
 	memset(&skb->data[frame_size / 2], 0xAA, frame_size / 2 - 1);
-	memset(&skb->data[frame_size / 2 + 10], 0xBE, 1);
-	memset(&skb->data[frame_size / 2 + 12], 0xAF, 1);
+	skb->data[frame_size / 2 + 10] =3D 0xBE;
+	skb->data[frame_size / 2 + 12] =3D 0xAF;
 }
=20
 static int e1000_check_lbtest_frame(const unsigned char *data,
--=20
2.17.1


--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8OCjIACgkQ+gRsbIfe
747epg//conbuZWFS5h8Mh9FCzDGo6kg8I5K3s+UtdTWXSIX5OEy34KmJAYx81fw
qGMZaR4CyF4O/0vI8KxgUMTPGxf77keTsSDQhU4fE9IPPfI0MhGzLM+M5gjUiTfW
Ireu76SCme6orWv6Z7+q6CVbLFYMIL7hslLgLTFI9+6MbX/IBqEXKPpa3owthbsR
qHR8u8U2VAR9jEyB9CdND4oCsrF1GabZS/Dx01Uf2+3MQqEe4fdMTwqBkv1v4Nm6
XDE3FCLqWNWzc4cogFPWpDFGu0esbD7WV3X7pUuiGVIs2HNUslNKKOMyWfDwU9Cz
qvp8GHUWKARttcEgNUjgVyjtQuLmSWrpFUHFCrulI+8ZKidk7GF0RLZ0MB43ha5u
/CQWJCSPwuG9mJPrSfekRvv1zd/QvyKqzTY4JHLoCMY5VWM2gZHb7TCZua4ZaAWa
psq4itAML6IRbO7mQn+W2W8plFxAiBeDvcblH2gJwT9QMi1P16mTm3rZUV4e+0bS
9MGF3DmKTUY73oeMfkTuKSpuLFjpdTIaupRwN5vxozSRVJSV3vXhjSlwx/Ie0wd/
t8vO1TIfMYmNmDwxIJ3jnAGaMwDhckg0RjrONCMWZHDkvafftruUDrYvghYDbZDa
HPZ1+0dcgPi9nATBTZrVeW4ucr9Mb0+v0bH/CmC1Gwx1caoGA24=
=53mg
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
