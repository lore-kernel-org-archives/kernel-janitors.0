From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
Date: Sun, 10 Oct 2010 19:39:46 +0000
Subject: [PATCH] mfd/mc13xxx: don't open code kasprintf
Message-Id: <1286739586-32745-1-git-send-email-u.kleine-koenig@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286731711-17865-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1286731711-17865-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org

This fixes an off by one error noticed by Vasiliy Kulikov en passant.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/mfd/mc13xxx-core.c |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/mc13xxx-core.c b/drivers/mfd/mc13xxx-core.c
index 93258ad..b763b8c 100644
--- a/drivers/mfd/mc13xxx-core.c
+++ b/drivers/mfd/mc13xxx-core.c
@@ -687,7 +687,6 @@ EXPORT_SYMBOL_GPL(mc13783_adc_do_conversion);
 static int mc13xxx_add_subdevice_pdata(struct mc13xxx *mc13xxx,
 		const char *format, void *pdata, size_t pdata_size)
 {
-	char buf[30];
 	const char *name =3D mc13xxx_get_chipname(mc13xxx);
=20
 	struct mfd_cell cell =3D {
@@ -695,11 +694,7 @@ static int mc13xxx_add_subdevice_pdata(struct mc13xxx =
*mc13xxx,
 		.data_size =3D pdata_size,
 	};
=20
-	/* there is no asnprintf in the kernel :-( */
-	if (snprintf(buf, sizeof(buf), format, name) > sizeof(buf))
-		return -E2BIG;
-
-	cell.name =3D kmemdup(buf, strlen(buf) + 1, GFP_KERNEL);
+	cell.name =3D kasprintf(GFP_KERNEL, format, name);
 	if (!cell.name)
 		return -ENOMEM;
=20
--=20
1.7.2.3

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
