From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 25 Aug 2012 19:57:09 +0000
Subject: [PATCH 6/6] drivers/iio/adc/at91_adc.c: adjust inconsistent IS_ERR and PTR_ERR
Message-Id: <1345924629-16584-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345924629-16584-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345924629-16584-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Jonathan Cameron <jic23@cam.ac.uk>
Cc: kernel-janitors@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Change the call to PTR_ERR to access the value just tested by IS_ERR.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e,e1;
@@

(
if (IS_ERR(e)) { ... PTR_ERR(e) ... }
|
if (IS_ERR(e=E1)) { ... PTR_ERR(e) ... }
|
*if (IS_ERR(e))
 { ...
*  PTR_ERR(e1)
   ... }
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/iio/adc/at91_adc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 98c96f9..8650281 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -604,7 +604,7 @@ static int __devinit at91_adc_probe(struct platform_dev=
ice *pdev)
 	st->adc_clk =3D devm_clk_get(&pdev->dev, "adc_op_clk");
 	if (IS_ERR(st->adc_clk)) {
 		dev_err(&pdev->dev, "Failed to get the ADC clock.\n");
-		ret =3D PTR_ERR(st->clk);
+		ret =3D PTR_ERR(st->adc_clk);
 		goto error_disable_clk;
 	}
=20

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
