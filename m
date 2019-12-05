From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Thu, 05 Dec 2019 07:24:04 +0000
Subject: [PATCH] pwm: sun4i: Narrow scope of local variable
Message-Id: <20191205072404.6858-1-u.kleine-koenig@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191002101624.gljyf7g4nia2rcbx@pengutronix.de>
In-Reply-To: <20191002101624.gljyf7g4nia2rcbx@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-pwm@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de

The variable pval is only used in a single block in the function
sun4i_pwm_calculate(). So declare it in a more local scope to simplify
the function for humans and compilers.

While the diffstat for this patch is negative for this patch I still
thing the advantage of having a narrower scope is beneficial.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
Hello,

for the patch that became

	1b98ad3b3be9 ("pwm: sun4i: Drop redundant assignment to variable pval")

(and which yielded the situation that pval is only used in this single
block) I suggested to do this change. This was ignored however by both
Colin and Thierry without comment. So I suggest the change here
separately.

Best regards
Uwe

 drivers/pwm/pwm-sun4i.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
index 581d23287333..8919e6ab7577 100644
--- a/drivers/pwm/pwm-sun4i.c
+++ b/drivers/pwm/pwm-sun4i.c
@@ -149,7 +149,7 @@ static int sun4i_pwm_calculate(struct sun4i_pwm_chip *s=
un4i_pwm,
 			       u32 *dty, u32 *prd, unsigned int *prsclr)
 {
 	u64 clk_rate, div =3D 0;
-	unsigned int pval, prescaler =3D 0;
+	unsigned int prescaler =3D 0;
=20
 	clk_rate =3D clk_get_rate(sun4i_pwm->clk);
=20
@@ -170,6 +170,8 @@ static int sun4i_pwm_calculate(struct sun4i_pwm_chip *s=
un4i_pwm,
 	if (prescaler =3D 0) {
 		/* Go up from the first divider */
 		for (prescaler =3D 0; prescaler < PWM_PRESCAL_MASK; prescaler++) {
+			unsigned int pval;
+
 			if (!prescaler_table[prescaler])
 				continue;
 			pval =3D prescaler_table[prescaler];
--=20
2.24.0
