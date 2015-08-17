From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Aug 2015 14:38:33 +0000
Subject: [patch v2] iio: tsl4531: fix error handling in tsl4531_check_id()
Message-Id: <20150817143832.GC23820@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <55CF4E38.70506@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Dan Murphy <dmurphy@ti.com>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

tsl4531_check_id() returns 1 on "found", 0 on "not found" and negative
if there is an error.  The bug here is that the error handling, treats
errors as "found".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: slightly different fix

diff --git a/drivers/iio/light/tsl4531.c b/drivers/iio/light/tsl4531.c
index 2697918..fca0cb0 100644
--- a/drivers/iio/light/tsl4531.c
+++ b/drivers/iio/light/tsl4531.c
@@ -180,7 +180,10 @@ static int tsl4531_probe(struct i2c_client *client,
 	data->client = client;
 	mutex_init(&data->lock);
 
-	if (!tsl4531_check_id(client)) {
+	ret = tsl4531_check_id(client);
+	if (ret < 0)
+		return ret;
+	if (ret = 0) {
 		dev_err(&client->dev, "no TSL4531 sensor\n");
 		return -ENODEV;
 	}
