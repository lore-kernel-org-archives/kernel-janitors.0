From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 13 Jan 2017 17:19:35 +0000
Subject: [PATCH 10/17] spi/ppc4xx: Adjust checks for null pointers in two functions
Message-Id: <d9bd24b0-d4d5-233c-756d-71aaed63c5ef@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1413e173-dbac-7a6e-09cb-2287300a335e@users.sourceforge.net>
In-Reply-To: <1413e173-dbac-7a6e-09cb-2287300a335e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 13 Jan 2017 14:56:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written !=E2=80=A6

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/spi/spi-ppc4xx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-ppc4xx.c b/drivers/spi/spi-ppc4xx.c
index 967d94844b30..048794f043a0 100644
--- a/drivers/spi/spi-ppc4xx.c
+++ b/drivers/spi/spi-ppc4xx.c
@@ -229,7 +229,7 @@ static int spi_ppc4xx_setup(struct spi_device *spi)
 		return -EINVAL;
 	}
=20
-	if (cs =3D NULL) {
+	if (!cs) {
 		cs =3D kzalloc(sizeof *cs, GFP_KERNEL);
 		if (!cs)
 			return -ENOMEM;
@@ -392,7 +392,7 @@ static int spi_ppc4xx_of_probe(struct platform_device *=
op)
 	const unsigned int *clk;
=20
 	master =3D spi_alloc_master(dev, sizeof *hw);
-	if (master =3D NULL)
+	if (!master)
 		return -ENOMEM;
 	master->dev.of_node =3D np;
 	platform_set_drvdata(op, master);
@@ -466,14 +466,14 @@ static int spi_ppc4xx_of_probe(struct platform_device=
 *op)
=20
 	/* Get the clock for the OPB */
 	opbnp =3D of_find_compatible_node(NULL, NULL, "ibm,opb");
-	if (opbnp =3D NULL) {
+	if (!opbnp) {
 		dev_err(dev, "OPB: cannot find node\n");
 		ret =3D -ENODEV;
 		goto free_gpios;
 	}
 	/* Get the clock (Hz) for the OPB */
 	clk =3D of_get_property(opbnp, "clock-frequency", NULL);
-	if (clk =3D NULL) {
+	if (!clk) {
 		dev_err(dev, "OPB: no clock-frequency property set\n");
 		of_node_put(opbnp);
 		ret =3D -ENODEV;
--=20
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
