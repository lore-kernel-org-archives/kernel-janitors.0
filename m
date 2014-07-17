From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Thu, 17 Jul 2014 12:13:23 +0000
Subject: [PATCH 1/3] drivers/ata/pata_ep93xx.c: use signed int type for result of platform_get_irq()
Message-Id: <1405599203-11113-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: dcb314@hotmail.com, tj@kernel.org, Andrey Utkin <andrey.krieger.utkin@gmail.com>

[linux-3.16-rc5/drivers/ata/pata_ep93xx.c:929]: (style) Checking if unsigned
variable 'irq' is less than zero.

Source code is

    irq =3D platform_get_irq(pdev, 0);
    if (irq < 0) {

but

    unsigned int irq;

$ fgrep platform_get_irq `find . -name \*.h -print`
./include/linux/platform_device.h:extern int platform_get_irq(struct
platform_device *, unsigned int);

Now using "int" type instead of "unsigned int" for "irq" variable.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80401
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 drivers/ata/pata_ep93xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/pata_ep93xx.c b/drivers/ata/pata_ep93xx.c
index 6ad5c07..4d37c54 100644
--- a/drivers/ata/pata_ep93xx.c
+++ b/drivers/ata/pata_ep93xx.c
@@ -915,7 +915,7 @@ static int ep93xx_pata_probe(struct platform_device *pd=
ev)
 	struct ep93xx_pata_data *drv_data;
 	struct ata_host *host;
 	struct ata_port *ap;
-	unsigned int irq;
+	int irq;
 	struct resource *mem_res;
 	void __iomem *ide_base;
 	int err;
--=20
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
