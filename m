From: Vasiliy Kulikov <segooon@gmail.com>
Date: Thu, 28 Oct 2010 11:13:58 +0000
Subject: [PATCH] misc: apds9802als: fix signedness bug
Message-Id: <1288264438-10578-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Hong Liu <hong.liu@intel.com>, Alan Cox <alan@linux.intel.com>, Anantha Narayanan <anantha.narayanan@intel.com>, Jonathan Cameron <jic23@cam.ac.uk>, linux-kernel@vger.kernel.org

i2c_smbus_read_byte_data() may return negative error code.  This is not
seen to als_sensing_range_store() as the result is stored in unsigned int.
Made it signed.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/misc/apds9802als.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
-- 
1.7.0.4

