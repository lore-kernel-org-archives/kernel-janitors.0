From: Ji-Hun Kim <jihuun.k@gmail.com>
Date: Thu, 28 Dec 2017 02:49:29 +0000
Subject: [PATCH 2/2] staging: iio: add spaces around '-' operator
Message-Id: <20171228024927.GA3113@MacBook-Air>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lars@metafoo.de
Cc: Michael.Hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, device-drivers-devel@blackfin.uclinux.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Clean up checkpatch warning:
CHECK: spaces preferred around that '-' (ctx:VxV)

Signed-off-by: Ji-Hun Kim <jihuun.k@gmail.com>
---
 drivers/staging/iio/adc/ad7192.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/adc/ad7192.c b/drivers/staging/iio/adc/ad7192.c
index f015955..c4eff71 100644
--- a/drivers/staging/iio/adc/ad7192.c
+++ b/drivers/staging/iio/adc/ad7192.c
@@ -340,7 +340,7 @@ ad7192_show_scale_available(struct device *dev,
 }
 
 static IIO_DEVICE_ATTR_NAMED(in_v_m_v_scale_available,
-			     in_voltage-voltage_scale_available,
+			     in_voltage - voltage_scale_available,
 			     0444, ad7192_show_scale_available, NULL, 0);
 
 static IIO_DEVICE_ATTR(in_voltage_scale_available, 0444,
-- 
2.10.1 (Apple Git-78)

