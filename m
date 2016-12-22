From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 22 Dec 2016 12:04:50 +0000
Subject: [PATCH 21/66] hwmon: (lm70) use permission-specific DEVICE_ATTR variants
Message-Id: <1482408335-3435-22-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org

Use DEVICE_ATTR_RO etc. for read only attributes etc.  This simplifies the
source code, improves readbility, and reduces the chance of
inconsistencies.

The semantic patch for the RO case, in the case where the show function
already has the expected name, is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@ro@
declarer name DEVICE_ATTR;
identifier x,x_show;
@@

DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);

@script:ocaml@
x << ro.x;
x_show << ro.x_show;
@@

if not (x^"_show" = x_show) then Coccilib.include_match false

@@
declarer name DEVICE_ATTR_RO;
identifier ro.x,ro.x_show;
@@

- DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);
+ DEVICE_ATTR_RO(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/hwmon/lm70.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm70.c b/drivers/hwmon/lm70.c
index 583f883..d6ecd1a 100644
--- a/drivers/hwmon/lm70.c
+++ b/drivers/hwmon/lm70.c
@@ -54,8 +54,8 @@ struct lm70 {
 };
 
 /* sysfs hook function */
-static ssize_t lm70_sense_temp(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t temp1_input_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
 {
 	struct lm70 *p_lm70 = dev_get_drvdata(dev);
 	struct spi_device *spi = p_lm70->spi;
@@ -120,7 +120,7 @@ static ssize_t lm70_sense_temp(struct device *dev,
 	return status;
 }
 
-static DEVICE_ATTR(temp1_input, S_IRUGO, lm70_sense_temp, NULL);
+static DEVICE_ATTR_RO(temp1_input);
 
 static struct attribute *lm70_attrs[] = {
 	&dev_attr_temp1_input.attr,

