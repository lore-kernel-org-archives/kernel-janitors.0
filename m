From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 22 Dec 2016 12:05:15 +0000
Subject: [PATCH 46/66] hwmon: (pc87427) use permission-specific DEVICE_ATTR variants
Message-Id: <1482408335-3435-47-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/pc87427.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pc87427.c b/drivers/hwmon/pc87427.c
index cb9fdd3..dc5a9d5 100644
--- a/drivers/hwmon/pc87427.c
+++ b/drivers/hwmon/pc87427.c
@@ -943,14 +943,14 @@ static SENSOR_DEVICE_ATTR(temp6_crit_alarm, S_IRUGO,
 	{ .attrs = pc87427_attributes_temp[5] },
 };
 
-static ssize_t show_name(struct device *dev, struct device_attribute
+static ssize_t name_show(struct device *dev, struct device_attribute
 			 *devattr, char *buf)
 {
 	struct pc87427_data *data = dev_get_drvdata(dev);
 
 	return sprintf(buf, "%s\n", data->name);
 }
-static DEVICE_ATTR(name, S_IRUGO, show_name, NULL);
+static DEVICE_ATTR_RO(name);
 
 
 /*

