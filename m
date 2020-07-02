From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Thu, 02 Jul 2020 08:52:22 +0000
Subject: [PATCH] staging: qlge: qlge_ethtool.c: Proper indentation.
Message-Id: <20200702084022.GA1586@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="45Z9DzgjV8m4Oswq"
List-Id: <kernel-janitors.vger.kernel.org>
To: manishc@marvell.com, gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org, netdev@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Remove extra indentations from if-statement.

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/staging/qlge/qlge_ethtool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/qlge/qlge_ethtool.c b/drivers/staging/qlge/qlg=
e_ethtool.c
index 949abd53a7a9..16fcdefa9687 100644
--- a/drivers/staging/qlge/qlge_ethtool.c
+++ b/drivers/staging/qlge/qlge_ethtool.c
@@ -528,8 +528,8 @@ void ql_check_lb_frame(struct ql_adapter *qdev,
 	if ((*(skb->data + 3) =3D=3D 0xFF) &&
 	    (*(skb->data + frame_size / 2 + 10) =3D=3D 0xBE) &&
 	    (*(skb->data + frame_size / 2 + 12) =3D=3D 0xAF)) {
-			atomic_dec(&qdev->lb_count);
-			return;
+		atomic_dec(&qdev->lb_count);
+		return;
 	}
 }
=20
--=20
2.17.1


--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl79nW0ACgkQ+gRsbIfe
746epxAAqhB9h48Tx5kPCpUxqOqszOxrTaar0H8mC+KqZmVXOyjquvNRKpeV6Lg/
D5ImRvLVMkWzMu7hqxFY0S89Mg/CQznGJJeaBaU8WyVfR7UJJOTk5mlRDMPc5IlW
E++xnUQtf786os2G7DZBYoBWGompSWFVb8/aI+nef9yBPaUSJVmxcp3HNM+UW3pb
Sl0h7oiHfHVDSgvV1mWNurUSX9u6sGutK0DXPkeeJEbt33x3GPRNcKbIDTH19mfA
GHYY+aE+xpLim9Jt9oVFjR2d/Q2YGz7bgxoQaEIBmRpHU4xTPKwph31cTmO/e6PJ
ebHHsFaeEQVIEWYoSKZI+1fi1FY2NWk8ySnbclCqG/itFLCDlXomV9rhBeEYT0KY
xEEPZYTtmTuECjPuDAyw5ii7KwTDWE0ja2rqrt515kEr5uV5RCHNucmzUn9kH6+3
HLsk8JfzQU2y1uCwI8QfXSF5nSJSOFp4QWoScF5vHvhpC3u4TSQELzXv7iyunXNV
Cy2OBT9HgdK+HF/XvmyQ/dQUHkAH+UB5sif8Pdjod7z+KKnqjTO1vHR7sCqTjrUO
wB/zIJWiSd4mz4aMoDiLyoHE9HiBLvDFbSwF2ueqGGEEGMQv9nn7EG7FaGN9vQ1P
cSpXrKQ2zwfG2HrLjZ7SB5bAx26rhnd/cCgvwvzveuQlfhOnUIM=
=blIl
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
