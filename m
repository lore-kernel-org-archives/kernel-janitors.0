From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Oct 2016 19:36:55 +0000
Subject: [PATCH 01/15] wusbcore: dev-sysfs: use permission-specific DEVICE_ATTR variants
Message-Id: <1477769829-22230-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1477769829-22230-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1477769829-22230-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Use DEVICE_ATTR_WO for write ony attributes and DEVICE_ATTR_RO for read
only attributes.  This simplifies the source code, improves readbility,
and reduces the chance of inconsistencies.

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

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/wusbcore/dev-sysfs.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/wusbcore/dev-sysfs.c b/drivers/usb/wusbcore/dev-sysfs.c
index 415b140..d4de56b 100644
--- a/drivers/usb/wusbcore/dev-sysfs.c
+++ b/drivers/usb/wusbcore/dev-sysfs.c
@@ -53,7 +53,7 @@ static ssize_t wusb_disconnect_store(struct device *dev,
 	wusbhc_put(wusbhc);
 	return size;
 }
-static DEVICE_ATTR(wusb_disconnect, 0200, NULL, wusb_disconnect_store);
+static DEVICE_ATTR_WO(wusb_disconnect);
 
 static ssize_t wusb_cdid_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
@@ -69,7 +69,7 @@ static ssize_t wusb_cdid_show(struct device *dev,
 	wusb_dev_put(wusb_dev);
 	return result + 1;
 }
-static DEVICE_ATTR(wusb_cdid, 0444, wusb_cdid_show, NULL);
+static DEVICE_ATTR_RO(wusb_cdid);
 
 static ssize_t wusb_ck_store(struct device *dev,
 			     struct device_attribute *attr,
@@ -105,7 +105,7 @@ static ssize_t wusb_ck_store(struct device *dev,
 	wusbhc_put(wusbhc);
 	return result < 0 ? result : size;
 }
-static DEVICE_ATTR(wusb_ck, 0200, NULL, wusb_ck_store);
+static DEVICE_ATTR_WO(wusb_ck);
 
 static struct attribute *wusb_dev_attrs[] = {
 		&dev_attr_wusb_disconnect.attr,

