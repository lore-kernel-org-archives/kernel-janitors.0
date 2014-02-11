From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Feb 2014 21:07:55 +0000
Subject: [patch v2] w1: small type cleanup in sysfs
Message-Id: <20140211210755.GA25579@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20140211164513.GF5530@spacedout.fries.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>, David Fries <David@Fries.net>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 64 bit systems, a large value for "long tmp" is truncated when
assigning to "int md->max_slave_count" so we still end up with a value
less than one despite the "tmp < 1" check.

This is more of a problem for static checkers than a real life issue,
but it's simple enough to fix.

Acked-by: David Fries <david@fries.net>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: clarified the commit message

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index 9eb816b2ea5e..b96f61b15dc6 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -320,10 +320,10 @@ static ssize_t w1_master_attribute_show_timeout(struct device *dev, struct devic
 static ssize_t w1_master_attribute_store_max_slave_count(struct device *dev,
 	struct device_attribute *attr, const char *buf, size_t count)
 {
-	long tmp;
+	int tmp;
 	struct w1_master *md = dev_to_w1_master(dev);
 
-	if (kstrtol(buf, 0, &tmp) = -EINVAL || tmp < 1)
+	if (kstrtoint(buf, 0, &tmp) = -EINVAL || tmp < 1)
 		return -EINVAL;
 
 	mutex_lock(&md->mutex);

