From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Apr 2016 09:35:48 +0000
Subject: [patch] w1: silence an uninitialized variable warning
Message-Id: <20160414093548.GG16549@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If kstrtoint() returns -ERANGE then "tmp" is uninitialized.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index 89a7847..bb34362 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -335,7 +335,7 @@ static ssize_t w1_master_attribute_store_max_slave_count(struct device *dev,
 	int tmp;
 	struct w1_master *md = dev_to_w1_master(dev);
 
-	if (kstrtoint(buf, 0, &tmp) = -EINVAL || tmp < 1)
+	if (kstrtoint(buf, 0, &tmp) || tmp < 1)
 		return -EINVAL;
 
 	mutex_lock(&md->mutex);
