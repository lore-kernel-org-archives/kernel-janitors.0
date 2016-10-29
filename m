From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Oct 2016 19:37:03 +0000
Subject: [PATCH 09/15] arch/tile: use permission-specific DEVICE_ATTR variants
Message-Id: <1477769829-22230-10-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1477769829-22230-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1477769829-22230-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Metcalf <cmetcalf@mellanox.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Use DEVICE_ATTR_RO for read only attributes and DEVICE_ATTR_RW for
read-write attributes.  This simplifies the source code, improves
readbility, and reduces the chance of inconsistencies.

The semantic patch for the RO case is as follows:
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

The macro code was transformed by hand.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/tile/kernel/sysfs.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/tile/kernel/sysfs.c b/arch/tile/kernel/sysfs.c
index 825867c..9619a03 100644
--- a/arch/tile/kernel/sysfs.c
+++ b/arch/tile/kernel/sysfs.c
@@ -38,7 +38,7 @@ static ssize_t chip_width_show(struct device *dev,
 {
 	return sprintf(page, "%u\n", smp_width);
 }
-static DEVICE_ATTR(chip_width, 0444, chip_width_show, NULL);
+static DEVICE_ATTR_RO(chip_width);
 
 static ssize_t chip_height_show(struct device *dev,
 				struct device_attribute *attr,
@@ -46,7 +46,7 @@ static ssize_t chip_height_show(struct device *dev,
 {
 	return sprintf(page, "%u\n", smp_height);
 }
-static DEVICE_ATTR(chip_height, 0444, chip_height_show, NULL);
+static DEVICE_ATTR_RO(chip_height);
 
 static ssize_t chip_serial_show(struct device *dev,
 				struct device_attribute *attr,
@@ -54,7 +54,7 @@ static ssize_t chip_serial_show(struct device *dev,
 {
 	return get_hv_confstr(page, HV_CONFSTR_CHIP_SERIAL_NUM);
 }
-static DEVICE_ATTR(chip_serial, 0444, chip_serial_show, NULL);
+static DEVICE_ATTR_RO(chip_serial);
 
 static ssize_t chip_revision_show(struct device *dev,
 				  struct device_attribute *attr,
@@ -62,7 +62,7 @@ static ssize_t chip_revision_show(struct device *dev,
 {
 	return get_hv_confstr(page, HV_CONFSTR_CHIP_REV);
 }
-static DEVICE_ATTR(chip_revision, 0444, chip_revision_show, NULL);
+static DEVICE_ATTR_RO(chip_revision);
 
 
 static ssize_t type_show(struct device *dev,
@@ -71,7 +71,7 @@ static ssize_t type_show(struct device *dev,
 {
 	return sprintf(page, "tilera\n");
 }
-static DEVICE_ATTR(type, 0444, type_show, NULL);
+static DEVICE_ATTR_RO(type);
 
 #define HV_CONF_ATTR(name, conf)					\
 	static ssize_t name ## _show(struct device *dev,		\
@@ -80,7 +80,7 @@ static ssize_t type_show(struct device *dev,
 	{								\
 		return get_hv_confstr(page, conf);			\
 	}								\
-	static DEVICE_ATTR(name, 0444, name ## _show, NULL);
+	static DEVICE_ATTR_RO(name);
 
 HV_CONF_ATTR(version,		HV_CONFSTR_HV_SW_VER)
 HV_CONF_ATTR(config_version,	HV_CONFSTR_HV_CONFIG_VER)
@@ -184,7 +184,7 @@ static ssize_t hv_stats_store(struct device *dev,
 	return n < 0 ? n : count;
 }
 
-static DEVICE_ATTR(hv_stats, 0644, hv_stats_show, hv_stats_store);
+static DEVICE_ATTR_RW(hv_stats);
 
 static int hv_stats_device_add(struct device *dev, struct subsys_interface *sif)
 {

