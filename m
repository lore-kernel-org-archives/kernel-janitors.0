From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Fri, 02 Nov 2012 07:28:53 +0000
Subject: [PATCH] staging: iio: adc: ad7280a.c: fixed macro coding style
Message-Id: <1351841333-30581-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jic23@cam.ac.uk
Cc: gregkh@linuxfoundation.org, lars@metafoo.de, michael.hennerich@analog.com, thomas@m3y3r.de, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

remove unnecessary semicolon from the macro definition

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 drivers/staging/iio/adc/ad7280a.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/adc/ad7280a.c b/drivers/staging/iio/adc/ad7280a.c
index cfc39a7..e7cb3b2 100644
--- a/drivers/staging/iio/adc/ad7280a.c
+++ b/drivers/staging/iio/adc/ad7280a.c
@@ -117,7 +117,7 @@
  */
 #define POLYNOM		0x2F
 #define POLYNOM_ORDER	8
-#define HIGHBIT		1 << (POLYNOM_ORDER - 1);
+#define HIGHBIT		(1 << (POLYNOM_ORDER - 1))
 
 struct ad7280_state {
 	struct spi_device		*spi;
-- 
1.7.9.5

