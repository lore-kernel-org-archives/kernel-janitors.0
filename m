From: Dan Carpenter <error27@gmail.com>
Date: Thu, 28 Oct 2010 04:41:11 +0000
Subject: [patch] misc/apds9802als: signedness bug in
Message-Id: <20101028044111.GT6062@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hong Liu <hong.liu@intel.com>
Cc: Alan Cox <alan@linux.intel.com>, Anantha Narayanan <anantha.narayanan@intel.com>, Jonathan Cameron <jic23@cam.ac.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The error handling breaks if "ret_val" is unsigned here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/misc/apds9802als.c b/drivers/misc/apds9802als.c
index f9b91ba..0ed0935 100644
--- a/drivers/misc/apds9802als.c
+++ b/drivers/misc/apds9802als.c
@@ -123,7 +123,7 @@ static ssize_t als_sensing_range_store(struct device *dev,
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct als_data *data = i2c_get_clientdata(client);
-	unsigned int ret_val;
+	int ret_val;
 	unsigned long val;
 
 	if (strict_strtoul(buf, 10, &val))
