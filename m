From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Sat, 18 Jul 2020 13:30:56 +0000
Subject: [PATCH] staging: rts5208: rtsx: Replace depracated MSI API
Message-Id: <20200718131856.GA10837@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="a8Wt8u1KmwUX3Y2C"
List-Id: <kernel-janitors.vger.kernel.org>
To: gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Replace depracated pci_enable_msi with pci_alloc_irq_vectors.

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/staging/rts5208/rtsx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index e28e162d004e..adc80e766412 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -310,7 +310,7 @@ static int __maybe_unused rtsx_resume(struct device *de=
v_d)
 	pci_set_master(pci);
=20
 	if (chip->msi_en) {
-		if (pci_enable_msi(pci) < 0)
+		if (pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI) < 0)
 			chip->msi_en =3D 0;
 	}
=20
@@ -881,7 +881,7 @@ static int rtsx_probe(struct pci_dev *pci,
 	dev_info(&pci->dev, "pci->irq =3D %d\n", pci->irq);
=20
 	if (dev->chip->msi_en) {
-		if (pci_enable_msi(pci) < 0)
+		if (pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI) < 0)
 			dev->chip->msi_en =3D 0;
 	}
=20
--=20
2.17.1


--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8S9sAACgkQ+gRsbIfe
747zJhAAnYwOribTqVdCoKelWsg/J1bRcpu3igKxafUf9i6Jdyk+XmaL4ZtRFsG4
Gc5EQT8o6bhufzzW+We8doUAjusxMIpEBL4+TzN0vK0YdmNeN/Ebi8Be6JmsGa8U
BEedBfiYtT6jVuRC2AdquNK3XJ3U4+8FXkSfG0NuGhwViwks0TzQHOAZJCxuS5Cq
+XFhBNXpjK8E+IOXOFKEUB1cngLfwYKOZopITObQO182b7NND2yWLR5U7TLJlBHX
rE8Nv3Ie7On89qoXSfDUrYNZ7jHok9FRO3K5D2L7v7Uzdcy9JoarwG9cwN3nsWXy
A1l40jF8ctR+VhukddlrMs6cl/lGoIX3j6oBW/rm7MuW/TgLRnefZLKi9ffAmq5s
29JyX9k2ZuqyWUcuXkSLxri/hzqGzKv66Zg4QeeKjPVdNWc1Lg15zAtiXnkLT2j9
coiA8+9d6FfPonwPsYHxwxtMK+BYxUtnAzfbII3uIBHB0av6GVpjjgSIaMvsPcRZ
R/XnG4XO8zqXyttXxJqzS82BhGvVUvEbtSK/wdqbMeYGrX/4HGjMv6wA4TrCU5wH
2t0J/yEE+timKORy0b00Q7paKNTrKO4fiYE3yEg48AHFNzjOIOmuPOJDffX/9imb
4RkGNUBQLqgvUr8fMvzhqmH2yL39UnGW9j50TBnwfXH0GetHv/o=
=PY3U
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
