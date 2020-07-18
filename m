From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Sat, 18 Jul 2020 13:38:32 +0000
Subject: [PATCH] staging: media: atomisp: Replace depracated MSI API.
Message-Id: <20200718132632.GA11527@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ZPt4rx8FFjLCG7dd"
List-Id: <kernel-janitors.vger.kernel.org>
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Replace depracated pci_enable_msi with pci_alloc_irq_vectors.
And as a result modify how the returned value is handled.

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/sta=
ging/media/atomisp/pci/atomisp_v4l2.c
index d36809a0182c..b824c6f78a9c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1735,8 +1735,8 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 	pci_set_master(dev);
 	pci_set_drvdata(dev, isp);
=20
-	err =3D pci_enable_msi(dev);
-	if (err) {
+	err =3D pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);
+	if (err < 0) {
 		dev_err(&dev->dev, "Failed to enable msi (%d)\n", err);
 		goto enable_msi_fail;
 	}
--=20
2.17.1


--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8S+IcACgkQ+gRsbIfe
747Fmg/+Iujb0Dr/xwic1iWp0UM+FI1nN4E28i0EBw7trAm3ocK1bz9awuN2ieqf
7jZKBvoBdYbCVdTkPqPpneXP9JAT/Gwv5JyUtuqk8TUyau5i8MUhjjuBf3LCdSmn
UnoEoszx3VuNXp0n8jXL2TD/Od2CR0TAAG7/iGVdkHsQ5CAOKNk8MLCAz27DK7Zf
NVfF+CqczCzrJDH2D7Ubyrv34bE2i42qt1TTHeSe26kdc3Wc0runexaU5Gzntdtl
yO/5qxkbD6zFqrshu9GGv17Xa8RWi3leuPsoF4UWuKZHHUWxKSFmEy/dvbOlgAB2
kDGDtaJgTo3POGjJ6eb2x2Pexxq2pc5uBtjve2l5FI1xcEOS2tltYjkvApg03Bmm
wjAuEx/VLaHc24uU8CCQWRQCQRxfEBNH/sHgr67ZwZIvnaQmtiL8ufNatfiGY08K
Bzr5XwfoZS4kOeApvomqY9qXOjwn9FQ6HS8lLpFOXgSYn/HV065NzJORNMzM4xGQ
XLpCoq8ae8NQI3H5x/pPLG3jSLlhpNssynTXBgR+3QpDPM85xSIDDgL+JI4fQkti
z0c4bdDppEz3w4+QNQtT6OuTRtVniRdeQLa2QmCAwzGort1stDX9P47cqtZ5k3wz
pRTfmv7w4IcHpnhMiLcwHbrSzaqNmQ6FmFHIaV13kG4W7iUJld8=
=aeBi
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
