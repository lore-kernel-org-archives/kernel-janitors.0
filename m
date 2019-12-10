From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Tue, 10 Dec 2019 10:24:44 +0000
Subject: [PATCH v2] pwm: sun4i: Narrow scope of local variable
Message-Id: <20191210102444.26594-1-u.kleine-koenig@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191210101229.rvqelc2hanisd2cp@pengutronix.de>
In-Reply-To: <20191210101229.rvqelc2hanisd2cp@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Thierry Reding <thierry.reding@gmail.com>, Walter Harms <wharms@bfs.de>
Cc: linux-pwm@vger.kernel.org, kernel-janitors@vger.kernel.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Dan Carpenter <dan.carpenter@oracle.com>

The variable pval is only used in a single block in the function
sun4i_pwm_calculate(). So declare it in a more local scope to simplify
the function for humans and compilers.

While at it also simplify assignment to pval.

While the diffstat for this patch is negative for this patch I still
thing the advantage of having a narrower scope is beneficial.

In my compiler / .config setup (gcc 8.2.1, arm/imx_v6_v7_defconfig +
COMPILE_TEST + PWM_SUN4I) this change doesn't result in any binary
changes.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
Hello,

changes since (implicit) v1:

 - also simplify assignment to pval as suggested by Walter
 - verify the patch doesn't introduce binary changes

Best regards
Uwe

 drivers/pwm/pwm-sun4i.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
index 1fa2057419fb..4f77ebc8ae69 100644
--- a/drivers/pwm/pwm-sun4i.c
+++ b/drivers/pwm/pwm-sun4i.c
@@ -152,7 +152,7 @@ static int sun4i_pwm_calculate(struct sun4i_pwm_chip *s=
un4i_pwm,
 			       u32 *dty, u32 *prd, unsigned int *prsclr)
 {
 	u64 clk_rate, div =3D 0;
-	unsigned int pval, prescaler =3D 0;
+	unsigned int prescaler =3D 0;
=20
 	clk_rate =3D clk_get_rate(sun4i_pwm->clk);
=20
@@ -173,9 +173,11 @@ static int sun4i_pwm_calculate(struct sun4i_pwm_chip *=
sun4i_pwm,
 	if (prescaler =3D 0) {
 		/* Go up from the first divider */
 		for (prescaler =3D 0; prescaler < PWM_PRESCAL_MASK; prescaler++) {
+			unsigned int pval =3D prescaler_table[prescaler];
+
-			if (!prescaler_table[prescaler])
+			if (!pval)
 				continue;
-			pval =3D prescaler_table[prescaler];
+
 			div =3D clk_rate;
 			do_div(div, pval);
 			div =3D div * state->period;
--=20
2.24.0
