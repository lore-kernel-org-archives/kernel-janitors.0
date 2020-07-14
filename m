From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Tue, 14 Jul 2020 19:54:13 +0000
Subject: [PATCH 4/4] ixgbe/ixgbe_ethtool.c: Remove unnecessary usages of memset.
Message-Id: <20200714194212.GA21612@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="WIyZ46R2i8wDzkSu"
List-Id: <kernel-janitors.vger.kernel.org>
To: jeffrey.t.kirsher@intel.com, davem@davemloft.net, kuba@kernel.org
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Replace memsets of 1 byte with simple assignment.
Issue found with checkpatch.pl

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c b/drivers/net=
/ethernet/intel/ixgbe/ixgbe_ethtool.c
index 6725d892336e..71ec908266a6 100644
--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c
+++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c
@@ -1951,8 +1951,8 @@ static void ixgbe_create_lbtest_frame(struct sk_buff =
*skb,
 	memset(skb->data, 0xFF, frame_size);
 	frame_size >>=3D 1;
 	memset(&skb->data[frame_size], 0xAA, frame_size / 2 - 1);
-	memset(&skb->data[frame_size + 10], 0xBE, 1);
-	memset(&skb->data[frame_size + 12], 0xAF, 1);
+	skb->data[frame_size + 10] =3D 0xBE;
+	skb->data[frame_size + 12] =3D 0xAF;
 }
=20
 static bool ixgbe_check_lbtest_frame(struct ixgbe_rx_buffer *rx_buffer,
--=20
2.17.1


--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8OCpQACgkQ+gRsbIfe
747X5hAAmO9wn96MNt3fhAqcRyBhBhOvp01FWsT+wzrwjc+1bw4lkhROTDcrOjpf
1efjH5SijYmhpe5WwtmmW82lLLBf8Dz1P3z50LDW/P/Y4LJBJa401d+iUubw8VNI
an0hcZ7RqJuxO9P4LI1HT+xa7OlI5nZB1bYEPToeQRdbutLXZg7KmIP/mlMYK76i
2e4cj0oVCkKtYcsPTK6tMCAmWFhR58uxoiS5OVIqz2r6kyISMplwF0rzv3uUbz8Q
hUBh3dtQfoAENaSTlvcWCb8Bpdgp/DoaQOPgRD97nxbWmaX+byg9elyzElMjtvKv
6oU5D9FuDSnO4Z+qciTkajLE+hq2rBpN44WA55DDBcT2q7wbaVtfu18+GJQyUhqb
4PBKeGLLnVORKGhbEtofmDV1mSt+GjvW60YIkaJlF084Our7850xWdqO7jpd5Wtc
jfGQph7TTC7Myqk6xi7foWRe7kuTZNuProC7DFN9z6idow/q9+PVrO2YKEI8pDwi
xj6g3DLurusKneJR1wMFv4T1iU7/Aafc5q90xwSGAku7/W155CO7LR6OkA6Tv/Wg
AcFMBtKyTrUL+1q0zb3eg36DjpH2Tr7T40mtyK5XPo31Bv4PIx8Q1XjLXbCFaDtD
pST0Sam3+M5Ng88ktcGITfbvLzHQ6bNJhGbDstTbW/tqCRZ9peg=
=mpgA
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
