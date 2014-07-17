From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Thu, 17 Jul 2014 13:53:54 +0000
Subject: [PATCH 1/4] drivers/hsi/controllers/omap_ssi{,_port}.c: fix failure checks
Message-Id: <1405605234-13559-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: arnd@arndb.de, carlos.chinea@nokia.com, sre@kernel.org, Andrey Utkin <andrey.krieger.utkin@gmail.com>

1.

[linux-3.16-rc5/drivers/hsi/controllers/omap_ssi.c:357]: (style) Checking if
unsigned variable 'gdd_irq' is less than zero.

Source code is

    omap_ssi->gdd_irq =3D platform_get_irq_byname(pd, "gdd_mpu");
    if (omap_ssi->gdd_irq < 0) {

2.

[linux-3.16-rc5/drivers/hsi/controllers/omap_ssi_port.c:1017]: (style) Chec=
king
if unsigned variable 'irq' is less than zero.

Source code is

    omap_port->irq =3D platform_get_irq(pd, 0);
    if (omap_port->irq < 0) {

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80441
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 drivers/hsi/controllers/omap_ssi.c      | 6 +++---
 drivers/hsi/controllers/omap_ssi_port.c | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/hsi/controllers/omap_ssi.c b/drivers/hsi/controllers/o=
map_ssi.c
index 0fc7a7f..232ab73 100644
--- a/drivers/hsi/controllers/omap_ssi.c
+++ b/drivers/hsi/controllers/omap_ssi.c
@@ -353,12 +353,12 @@ static int __init ssi_add_controller(struct hsi_contr=
oller *ssi,
 	err =3D ssi_get_iomem(pd, "gdd", &omap_ssi->gdd, NULL);
 	if (err < 0)
 		goto out_err;
-	omap_ssi->gdd_irq =3D platform_get_irq_byname(pd, "gdd_mpu");
-	if (omap_ssi->gdd_irq < 0) {
+	err =3D platform_get_irq_byname(pd, "gdd_mpu");
+	if (err < 0) {
 		dev_err(&pd->dev, "GDD IRQ resource missing\n");
-		err =3D omap_ssi->gdd_irq;
 		goto out_err;
 	}
+	omap_ssi->gdd_irq =3D err;
 	tasklet_init(&omap_ssi->gdd_tasklet, ssi_gdd_tasklet,
 							(unsigned long)ssi);
 	err =3D devm_request_irq(&ssi->device, omap_ssi->gdd_irq, ssi_gdd_isr,
diff --git a/drivers/hsi/controllers/omap_ssi_port.c b/drivers/hsi/controll=
ers/omap_ssi_port.c
index 29aea0b..001b868 100644
--- a/drivers/hsi/controllers/omap_ssi_port.c
+++ b/drivers/hsi/controllers/omap_ssi_port.c
@@ -1013,11 +1013,12 @@ static int __init ssi_port_irq(struct hsi_port *por=
t,
 	struct omap_ssi_port *omap_port =3D hsi_port_drvdata(port);
 	int err;
=20
-	omap_port->irq =3D platform_get_irq(pd, 0);
-	if (omap_port->irq < 0) {
+	err =3D platform_get_irq(pd, 0);
+	if (err < 0) {
 		dev_err(&port->device, "Port IRQ resource missing\n");
-		return omap_port->irq;
+		return err;
 	}
+	omap_port->irq =3D err;
 	tasklet_init(&omap_port->pio_tasklet, ssi_pio_tasklet,
 							(unsigned long)port);
 	err =3D devm_request_irq(&port->device, omap_port->irq, ssi_pio_isr,
--=20
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
