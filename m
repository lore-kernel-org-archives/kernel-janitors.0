From: Colin King <colin.king@canonical.com>
Date: Sun, 18 Nov 2018 16:27:57 +0000
Subject: [PATCH] iio: hid-sensor-hub: clean up indentation, remove extraneous tab
Message-Id: <20181118162757.26900-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The statement is indented too much by one level, fix this by
removing the extraneous tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iio/common/hid-sensors/hid-sensor-attributes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/common/hid-sensors/hid-sensor-attributes.c b/drivers/iio/common/hid-sensors/hid-sensor-attributes.c
index ed3849d6fc6a..b2143d7b4ccb 100644
--- a/drivers/iio/common/hid-sensors/hid-sensor-attributes.c
+++ b/drivers/iio/common/hid-sensors/hid-sensor-attributes.c
@@ -336,7 +336,7 @@ static void adjust_exponent_nano(int *val0, int *val1, int scale0,
 			scale1 = scale1 % pow_10(8 - i);
 		}
 		*val0 += res;
-			*val1 = scale1 * pow_10(exp);
+		*val1 = scale1 * pow_10(exp);
 	} else if (exp < 0) {
 		exp = abs(exp);
 		if (exp > 9) {
-- 
2.19.1
