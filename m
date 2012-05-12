From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 12 May 2012 11:01:04 +0000
Subject: [patch] mfd: lm3533: silence a gcc warning
Message-Id: <20120512110104.GC19472@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is supposed to be umode_t.  It causes a GCC warning:
drivers/mfd/lm3533-core.c:440:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/mfd/lm3533-core.c:440:2: warning: (near initialization for ‘lm3533_attribute_group.is_visible’) [enabled by default]

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index 75f4b7f..6f315d6 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -418,7 +418,7 @@ static struct attribute *lm3533_attributes[] = {
 #define to_dev_attr(_attr) \
 	container_of(_attr, struct device_attribute, attr)
 
-static mode_t lm3533_attr_is_visible(struct kobject *kobj,
+static umode_t lm3533_attr_is_visible(struct kobject *kobj,
 					     struct attribute *attr, int n)
 {
 	struct device *dev = container_of(kobj, struct device, kobj);
