From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Mon, 11 Nov 2019 09:03:57 +0000
Subject: [PATCH 4/4] pwm: omap-dmtimer: Allow compiling with COMPILE_TEST
Message-Id: <20191111090357.13903-4-u.kleine-koenig@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

The dependency on OMAP_DM_TIMER is only a runtime dependency. Also
OMAP_DM_TIMER cannot be enabled without ARCH_OMAP being enabled.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index e3a2518503ed..e49cbdb1ce29 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -328,7 +328,8 @@ config PWM_MXS
=20
 config PWM_OMAP_DMTIMER
 	tristate "OMAP Dual-Mode Timer PWM support"
-	depends on OF && ARCH_OMAP && OMAP_DM_TIMER
+	depends on OF
+	depends on OMAP_DM_TIMER || COMPILE_TEST
 	help
 	  Generic PWM framework driver for OMAP Dual-Mode Timer PWM output
=20
--=20
2.23.0
