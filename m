From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Mon, 11 Nov 2019 09:03:55 +0000
Subject: [PATCH 2/4] pwm: omap-dmtimer: simplify error handling
Message-Id: <20191111090357.13903-2-u.kleine-koenig@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Instead of doing error handling in the middle of
pwm_omap_dmtimer_probe() move error handling and freeing the reference
to timer to the end.

This fixes a resource leak as dm_timer wasn't freed when allocating
*omap failed.

Implementation note: The put: label was never reached without a goto and
ret being unequal to 0, so the removed return statement is fine.

Fixes: 6604c6556db9 ("pwm: Add PWM driver for OMAP using dual-mode timers")
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-omap-dmtimer.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/pwm/pwm-omap-dmtimer.c b/drivers/pwm/pwm-omap-dmtimer.c
index bdf94c78655f..e36fcad668a6 100644
--- a/drivers/pwm/pwm-omap-dmtimer.c
+++ b/drivers/pwm/pwm-omap-dmtimer.c
@@ -298,15 +298,10 @@ static int pwm_omap_dmtimer_probe(struct platform_dev=
ice *pdev)
 		goto put;
 	}
=20
-put:
-	of_node_put(timer);
-	if (ret < 0)
-		return ret;
-
 	omap =3D devm_kzalloc(&pdev->dev, sizeof(*omap), GFP_KERNEL);
 	if (!omap) {
-		pdata->free(dm_timer);
-		return -ENOMEM;
+		ret =3D -ENOMEM;
+		goto err_alloc_omap;
 	}
=20
 	omap->pdata =3D pdata;
@@ -339,13 +334,28 @@ static int pwm_omap_dmtimer_probe(struct platform_dev=
ice *pdev)
 	ret =3D pwmchip_add(&omap->chip);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to register PWM\n");
-		omap->pdata->free(omap->dm_timer);
-		return ret;
+		goto err_pwmchip_add;
 	}
=20
+	of_node_put(timer);
+
 	platform_set_drvdata(pdev, omap);
=20
 	return 0;
+
+err_pwmchip_add:
+
+	/*
+	 * *omap is allocated using devm_kzalloc,
+	 * so no free necessary here
+	 */
+err_alloc_omap:
+
+	pdata->free(dm_timer);
+put:
+	of_node_put(timer);
+
+	return ret;
 }
=20
 static int pwm_omap_dmtimer_remove(struct platform_device *pdev)
--=20
2.23.0
