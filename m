From: Dan Carpenter <error27@gmail.com>
Date: Sat, 04 Jun 2011 06:10:21 +0000
Subject: [patch] USB: wusbcore: return negative error codes
Message-Id: <20110604061021.GA7675@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

cbaf_cdid_get() is only used in cbaf_wusb_chid_store().

In the original code cbaf_cdid_get() returns either a negative error
code or a small positive value on error.  I have changed it to
return -ENOENT if there is not enough data available.

In the original code the caller changed the negative error codes to
positive return values.  I've changed it to just return the error
value directly.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This is a static checker bug and I have not tested it.

diff --git a/drivers/usb/wusbcore/cbaf.c b/drivers/usb/wusbcore/cbaf.c
index c0c5665..200fd7c 100644
--- a/drivers/usb/wusbcore/cbaf.c
+++ b/drivers/usb/wusbcore/cbaf.c
@@ -298,7 +298,7 @@ static int cbaf_cdid_get(struct cbaf *cbaf)
 	if (result < needed) {
 		dev_err(dev, "Not enough data in DEVICE_INFO reply (%zu vs "
 			"%zu bytes needed)\n", (size_t)result, needed);
-		return result;
+		return -ENOENT;
 	}
 
 	strlcpy(cbaf->device_name, di->DeviceFriendlyName, CBA_NAME_LEN);
@@ -350,7 +350,7 @@ static ssize_t cbaf_wusb_chid_store(struct device *dev,
 		return result;
 	result = cbaf_cdid_get(cbaf);
 	if (result < 0)
-		return -result;
+		return result;
 	return size;
 }
 static DEVICE_ATTR(wusb_chid, 0600, cbaf_wusb_chid_show, cbaf_wusb_chid_store);
