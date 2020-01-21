From: Colin King <colin.king@canonical.com>
Date: Tue, 21 Jan 2020 16:17:57 +0000
Subject: [PATCH][next] iio: st_sensors: handle memory allocation failure to fix null pointer dereference
Message-Id: <20200121161757.1498082-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Linus Walleij <linus.walleij@linaro.org>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A null pointer deference on pdata can occur if the allocation of
pdata fails.  Fix this by adding a null pointer check and handle
the -ENOMEM failure in the caller.

Addresses-Coverity: ("Dereference null return value")
Fixes: 3ce85cc4fbb7 ("iio: st_sensors: get platform data from device tree")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iio/common/st_sensors/st_sensors_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iio/common/st_sensors/st_sensors_core.c b/drivers/iio/common/st_sensors/st_sensors_core.c
index e051edbc43c1..0e35ff06f9af 100644
--- a/drivers/iio/common/st_sensors/st_sensors_core.c
+++ b/drivers/iio/common/st_sensors/st_sensors_core.c
@@ -328,6 +328,8 @@ static struct st_sensors_platform_data *st_sensors_dev_probe(struct device *dev,
 		return NULL;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
 	if (!device_property_read_u32(dev, "st,drdy-int-pin", &val) && (val <= 2))
 		pdata->drdy_int_pin = (u8) val;
 	else
@@ -371,6 +373,8 @@ int st_sensors_init_sensor(struct iio_dev *indio_dev,
 
 	/* If OF/DT pdata exists, it will take precedence of anything else */
 	of_pdata = st_sensors_dev_probe(indio_dev->dev.parent, pdata);
+	if (IS_ERR(of_pdata))
+		return PTR_ERR(of_pdata);
 	if (of_pdata)
 		pdata = of_pdata;
 
-- 
2.24.0
