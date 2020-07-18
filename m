From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Sat, 18 Jul 2020 13:44:38 +0000
Subject: [PATCH] staging: media: ipu3: Replace depracated MSI API.
Message-Id: <20200718133238.GA11982@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="1yeeQ81UyVL57Vl7"
List-Id: <kernel-janitors.vger.kernel.org>
To: sakari.ailus@linux.intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Replace depracated psi_enable_msi with pci_alloc_irq_vectors.
And as a result modify how the returned value is handled.

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/staging/media/ipu3/ipu3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3=
/ipu3.c
index ee1bba6bdcac..54690e7442be 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -602,9 +602,9 @@ static irqreturn_t imgu_isr(int irq, void *imgu_ptr)
 static int imgu_pci_config_setup(struct pci_dev *dev)
 {
 	u16 pci_command;
-	int r =3D pci_enable_msi(dev);
+	int r =3D pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);
=20
-	if (r) {
+	if (r < 0) {
 		dev_err(&dev->dev, "failed to enable MSI (%d)\n", r);
 		return r;
 	}
--=20
2.17.1


--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8S+fYACgkQ+gRsbIfe
746prw/8C/HY3bZaEpdYpHHSDI6ZZC1gsQki6rnqZBb3KYtGG9YXeNOAxs64ddZa
vV+ZFo4WNxCeR0tSIEsFbDb6XnVAg6yFWrnVfOjmjkOYMYMyLLBXLYadmH24TOPb
Ty00ZSy3GXSZ2jTQOkUVXzedF8UuWv9Br9dUfJnF1xky2a2S79HBjFL6MzacKvSF
CsGAqrZyF7Fn5JEcU1fY78E3ma2bdhp8M/didwaixH2w1Ya1ifbwJ44hlYEtrezU
+E6DGUh8dZgx7TVa2dqgTLR6xkrW9gUM3/U4NZ+PsTTKEzD1g+iQZaAViktldXH2
G1qSW6qR9W26MLKEmtGWe+uwM07jnIhKc0z4GZfZv9LRNXUvKJ88fm1fomPeLiEY
CW6vV2V3BSBSXhmrI+jVhJij997QhXFNzdVSAZkkiDOvG7ml3+LnFc4EXRE0jXGV
cxDbjTgS/xj9seOfwzqcEeDANWPPvNCN9SClptNU/XMew5+zfVaVx0BIWwzkZiLM
j7aPMAuya0LKbRBRIqrWrDJEjPphlVQ8PQM1bcDlb/el/IYwYcvmIWcQKQUNihX2
Kpz77+2ww8wbbGW80EORd149V8/Gw40OAQ3T/p8ve4vJL7dhabARwFZ9J7mHP1BF
GFXkTShwUtTqVbivZ011N1mDCUb6YjjSUoYVZP431J2cMb17sos=
=Fu6m
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
