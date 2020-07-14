From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Tue, 14 Jul 2020 19:53:47 +0000
Subject: [PATCH 3/4] igb/igb_ethtool.c : Remove unnecessary usages of memset.
Message-Id: <20200714194147.GA21537@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="NzB8fVQJ5HfG6fxh"
List-Id: <kernel-janitors.vger.kernel.org>
To: jeffrey.t.kirsher@intel.com, davem@davemloft.net, kuba@kernel.org
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Replace memsets of 1 byte with simple assignment.
Issue found with checkpatch.pl

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/net/ethernet/intel/igb/igb_ethtool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/igb/igb_ethtool.c b/drivers/net/eth=
ernet/intel/igb/igb_ethtool.c
index c2cf414d126b..6e8231c1ddf0 100644
--- a/drivers/net/ethernet/intel/igb/igb_ethtool.c
+++ b/drivers/net/ethernet/intel/igb/igb_ethtool.c
@@ -1782,8 +1782,8 @@ static void igb_create_lbtest_frame(struct sk_buff *s=
kb,
 	memset(skb->data, 0xFF, frame_size);
 	frame_size /=3D 2;
 	memset(&skb->data[frame_size], 0xAA, frame_size - 1);
-	memset(&skb->data[frame_size + 10], 0xBE, 1);
-	memset(&skb->data[frame_size + 12], 0xAF, 1);
+	skb->data[frame_size + 10] =3D 0xBE;
+	skb->data[frame_size + 12] =3D 0xAF;
 }
=20
 static int igb_check_lbtest_frame(struct igb_rx_buffer *rx_buffer,
--=20
2.17.1


--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8OCnsACgkQ+gRsbIfe
7475jQ/5AdsAUEVRQdc0hTq29NBB9KUt2H2J6niOmK0ZE2cvKvt2rxRQ76d4r6pt
rWTD6v4FckiDuyoazjH5tZUlIVxVCFoybnpsS4a0aq6rQZyjZXKpTVwCwQH1tqDf
QxojbKNVKORdyI/u3x7hsxSKdKALPVQVYpUvNKGE2hSIm2+/jWIjXnyPlyCBmZOn
VesYzQ1PA2rPDccWHCXp3ijtGOXXqEu+hDOZbmzgtn8yc2KPSmb0zutbObL2Nl/m
OYTLUtDzNOMGeksmqzX+4EZ2ZrwaZ397zqGuKdxDKHKup5LWVf0qLaWWIYZiLdhD
mzWAbSWOKzVd6jOn/e2WKKin1TTN0wC4qgN84XXkyfrSE3ufpGAQsW2zhfgqA8jD
XPPfu+SHRXuqLhYApiNuhZh3ePOQjmcwCZ9TA7/YOMLrgIRNpwqRDY0PeFpWjjr3
OUbsPnCrRx3w1JkmslRaFwSE98wGDTmWZovT5bf6jdkl5i0xyHtXNWF4d/gg3Sre
0+EFSerViO1nMFW/w1qizuuSgwJBP0jFSxoM6RAl28gTH+Bj3g9TKC9YO49RM41G
tO1GrK/JksnXEkjQf3Orjv4hdqB7efDfYKG8kha6wchPfIbNM/N9yEenvZjUi9PN
NIw2hW64PEoYg4CDPDHISme5YPt4j20Sb3XhWU+lzUCvaNFY1+k=
=cAMq
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
