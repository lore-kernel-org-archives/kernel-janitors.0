From: Vasiliy Kulikov <segooon@gmail.com>
Date: Thu, 28 Oct 2010 11:14:03 +0000
Subject: [PATCH] misc: isl29020: fix signedness bug
Message-Id: <1288264443-10627-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Liu Hong <hong.liu@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Kalhan Trisal <kalhan.trisal@intel.com>, Arjan van de Ven <arjan@linux.intel.com>, Alan Cox <alan@linux.intel.com>, linux-kernel@vger.kernel.org

i2c_smbus_write_byte_data() may return negative error code.  This is not
seen to als_sensing_range_store() as the result is stored in unsigned int.
Made it signed.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/misc/isl29020.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/misc/isl29020.c b/drivers/misc/isl29020.c
index 34fe835..629d31e 100644
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
-- 
1.7.0.4

