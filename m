From: Colin King <colin.king@canonical.com>
Date: Fri, 03 Apr 2020 12:58:38 +0000
Subject: [PATCH][next] iio: dac: ad5770r: fix off-by-one check on maximum number of channels
Message-Id: <20200403125838.71271-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Stefan Popa <stefan.popa@analog.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Mircea Caprioru <mircea.caprioru@analog.com>, Alexandru Tachici <alexandru.tachici@analog.com>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently there is an off-by-one check on the number of channels that
will cause an arry overrun in array st->output_mode when calling the
function d5770r_store_output_range. Fix this by using >= rather than >
to check for maximum number of channels.

Addresses-Coverity: ("Out-of-bounds access")
Fixes: cbbb819837f6 ("iio: dac: ad5770r: Add AD5770R support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iio/dac/ad5770r.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/dac/ad5770r.c b/drivers/iio/dac/ad5770r.c
index a98ea76732e7..2d7623b9b2c0 100644
--- a/drivers/iio/dac/ad5770r.c
+++ b/drivers/iio/dac/ad5770r.c
@@ -525,7 +525,7 @@ static int ad5770r_channel_config(struct ad5770r_state *st)
 		ret = fwnode_property_read_u32(child, "num", &num);
 		if (ret)
 			return ret;
-		if (num > AD5770R_MAX_CHANNELS)
+		if (num >= AD5770R_MAX_CHANNELS)
 			return -EINVAL;
 
 		ret = fwnode_property_read_u32_array(child,
-- 
2.25.1
