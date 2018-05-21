From: Colin King <colin.king@canonical.com>
Date: Mon, 21 May 2018 09:16:54 +0000
Subject: [PATCH] iio: adc: fix spelling mistake: "Freeacale" -> "Freescale"
Message-Id: <20180521091654.17989-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in module description text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iio/adc/imx7d_adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/imx7d_adc.c b/drivers/iio/adc/imx7d_adc.c
index cfab31162845..ad6764fb2a23 100644
--- a/drivers/iio/adc/imx7d_adc.c
+++ b/drivers/iio/adc/imx7d_adc.c
@@ -604,5 +604,5 @@ static struct platform_driver imx7d_adc_driver = {
 module_platform_driver(imx7d_adc_driver);
 
 MODULE_AUTHOR("Haibo Chen <haibo.chen@freescale.com>");
-MODULE_DESCRIPTION("Freeacale IMX7D ADC driver");
+MODULE_DESCRIPTION("Freescale IMX7D ADC driver");
 MODULE_LICENSE("GPL v2");
-- 
2.17.0

