From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Tue, 14 Jul 2020 19:53:17 +0000
Subject: [PATCH 2/4] e1000e/ethtool.c : Remove unnecessary usages of memset.
Message-Id: <20200714194117.GA21460@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vtzGhvizbBRQ85DL"
List-Id: <kernel-janitors.vger.kernel.org>
To: jeffrey.t.kirsher@intel.com, davem@davemloft.net, kuba@kernel.org
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Replace memsets of 1 byte with simple assignments.
Issue found with checkpatch.pl

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/net/ethernet/intel/e1000e/ethtool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000e/ethtool.c b/drivers/net/ethe=
rnet/intel/e1000e/ethtool.c
index 64f684dc6c7a..a8fc9208382c 100644
--- a/drivers/net/ethernet/intel/e1000e/ethtool.c
+++ b/drivers/net/ethernet/intel/e1000e/ethtool.c
@@ -1608,8 +1608,8 @@ static void e1000_create_lbtest_frame(struct sk_buff =
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
 static int e1000_check_lbtest_frame(struct sk_buff *skb,
--=20
2.17.1


--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8OCl0ACgkQ+gRsbIfe
746ntw//Up63f9QJZQqL9+A+8jZ6A99A9PBee7fkjHVtAiLdaVg/xQMJD3lvbrPS
MtdWfUsVOwvSkPGyGd8+v1XH3Xk/7mj2lFrG28fR4z2BxS8u3Kzu8ufiB0bAJH9n
8F5hGTzwJkplP20bPcsqq6z5ffvZicoIGmIOZra3tHRNM3+3TurVJi7zJw8Xnl03
PL5+EHQm5qbAG3iXsrx1nvUyPCHH6rX6fQH9PegcEt172CisnWx9/6gS2cF/U8Ba
dWMozeK11DnPt1z2bV+oGxsPiFc+L+y/SwhkV46FDmKasHwBCWTBClJW3royGu4u
O7PriCh8HYYqu0vu8CWRBPrwF7Ube5/ZBhnKmyjA7zUTF1LQyaoDSdTHajeaONaa
/uRuaqgI7GGioLkIXUxh4XdZQJE2WuuCl3sDW4bRidMI1VHliUNtqtXJ2ALzhxuH
bkh0cJY7WxYoDBbI1G6HVHcD4a9hxITTku13Dcg21Il5uKZ36WXzzb0a1RG5kuxx
5jAtEpxK4cW4kXipXPOXcEYoKmnKYFmTmY5hc+QLe0AOWsDUJdDP51Q/r7/eKS4X
swVlV0gyubhsZ36BL5sebGiM/IYCYvocv00PA8/9fRebNbw5nsd8nC/glcT2ekgR
+ISpehIiCZo3kmMmOQ/p/3beK4B5ZH0x/VdAWh7+vqIqfMHbzxg=
=eUcI
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
