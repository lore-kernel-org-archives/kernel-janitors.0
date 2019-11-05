From: Colin King <colin.king@canonical.com>
Date: Tue, 05 Nov 2019 20:28:18 +0000
Subject: [PATCH] iio: temperature: ltc2983: fix u32 read into a unsigned long long
Message-Id: <20191105202818.90065-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the read of temp using of_property_read_u32_index is reading
a u32 value into a unsigned long long.  This relies on machine endianness
to work correctly, so fix this by reading a u32 value and setting temp
to this value.

Addresses-Coverity: ("Reliance on integer endianness")
Fixes: f110f3188e56 ("iio: temperature: Add support for LTC2983")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iio/temperature/ltc2983.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/temperature/ltc2983.c b/drivers/iio/temperature/ltc2983.c
index ddf47023364b..d39c0d6b77f1 100644
--- a/drivers/iio/temperature/ltc2983.c
+++ b/drivers/iio/temperature/ltc2983.c
@@ -444,8 +444,10 @@ static struct ltc2983_custom_sensor *__ltc2983_custom_sensor_new(
 			else
 				temp = __convert_to_raw(temp, resolution);
 		} else {
-			of_property_read_u32_index(np, propname, index,
-						   (u32 *)&temp);
+			u32 t32;
+
+			of_property_read_u32_index(np, propname, index, &t32);
+			temp = t32;
 		}
 
 		for (j = 0; j < n_size; j++)
-- 
2.20.1
