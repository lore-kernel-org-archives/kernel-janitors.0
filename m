From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Mon, 11 Nov 2019 09:03:54 +0000
Subject: [PATCH 1/4] pwm: omap-dmtimer: remove pwmchip in .remove before making it unfunctional
Message-Id: <20191111090357.13903-1-u.kleine-koenig@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

In the old code (e.g.) mutex_destroy() was called before
pwmchip_remove(). Between these two calls it is possible that a pwm
callback is used which tries to grab the mutex.

Fixes: 6604c6556db9 ("pwm: Add PWM driver for OMAP using dual-mode timers")
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-omap-dmtimer.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-omap-dmtimer.c b/drivers/pwm/pwm-omap-dmtimer.c
index 00772fc53490..bdf94c78655f 100644
--- a/drivers/pwm/pwm-omap-dmtimer.c
+++ b/drivers/pwm/pwm-omap-dmtimer.c
@@ -351,6 +351,11 @@ static int pwm_omap_dmtimer_probe(struct platform_devi=
ce *pdev)
 static int pwm_omap_dmtimer_remove(struct platform_device *pdev)
 {
 	struct pwm_omap_dmtimer_chip *omap =3D platform_get_drvdata(pdev);
+	int ret;
+
+	ret =3D pwmchip_remove(&omap->chip);
+	if (ret)
+		return ret;
=20
 	if (pm_runtime_active(&omap->dm_timer_pdev->dev))
 		omap->pdata->stop(omap->dm_timer);
@@ -359,7 +364,7 @@ static int pwm_omap_dmtimer_remove(struct platform_devi=
ce *pdev)
=20
 	mutex_destroy(&omap->mutex);
=20
-	return pwmchip_remove(&omap->chip);
+	return 0;
 }
=20
 static const struct of_device_id pwm_omap_dmtimer_of_match[] =3D {
--=20
2.23.0
