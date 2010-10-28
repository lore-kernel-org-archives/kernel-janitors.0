From: Dan Carpenter <error27@gmail.com>
Date: Thu, 28 Oct 2010 04:40:37 +0000
Subject: [patch] misc/isl29020: signedness bug in als_sensing_range_store()
Message-Id: <20101028044037.GS6062@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liu Hong <hong.liu@intel.com>
Cc: Kalhan Trisal <kalhan.trisal@intel.com>, Alan Cox <alan@linux.intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"ret_val" is supposed to be signed here or the error handling breaks.
Also we should check the return value from i2c_smbus_read_byte_data().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/misc/isl29020.c b/drivers/misc/isl29020.c
index 34fe835..ca47e62 100644
--- a/drivers/misc/isl29020.c
+++ b/drivers/misc/isl29020.c
@@ -87,7 +87,7 @@ static ssize_t als_sensing_range_store(struct device *dev,
 		struct device_attribute *attr, const  char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev);
-	unsigned int ret_val;
+	int ret_val;
 	unsigned long val;
 
 	if (strict_strtoul(buf, 10, &val))
@@ -106,6 +106,8 @@ static ssize_t als_sensing_range_store(struct device *dev,
 		val = 4;
 
 	ret_val = i2c_smbus_read_byte_data(client, 0x00);
+	if (ret_val < 0)
+		return ret_val;
 
 	ret_val &= 0xFC; /*reset the bit before setting them */
 	ret_val |= val - 1;
