From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Oct 2016 19:36:56 +0000
Subject: [PATCH 02/15] wusbcore: wusbhc: use permission-specific DEVICE_ATTR variants
Message-Id: <1477769829-22230-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1477769829-22230-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1477769829-22230-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Use DEVICE_ATTR_RW for read-write attributes.  This simplifies the
source code, improves readbility, and reduces the chance of
inconsistencies.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@rw@
declarer name DEVICE_ATTR;
identifier x,x_show,x_store;
@@

DEVICE_ATTR(x, \(0644\|S_IRUGO|S_IWUSR\), x_show, x_store);

@script:ocaml@
x << rw.x;
x_show << rw.x_show;
x_store << rw.x_store;
@@

if not (x^"_show" = x_show && x^"_store" = x_store)
then Coccilib.include_match false

@@
declarer name DEVICE_ATTR_RW;
identifier rw.x,rw.x_show,rw.x_store;
@@

- DEVICE_ATTR(x, \(0644\|S_IRUGO|S_IWUSR\), x_show, x_store);
+ DEVICE_ATTR_RW(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/wusbcore/wusbhc.c |   13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/wusbcore/wusbhc.c b/drivers/usb/wusbcore/wusbhc.c
index 94f401a..a273a91 100644
--- a/drivers/usb/wusbcore/wusbhc.c
+++ b/drivers/usb/wusbcore/wusbhc.c
@@ -84,8 +84,7 @@ static ssize_t wusb_trust_timeout_store(struct device *dev,
 out:
 	return result < 0 ? result : size;
 }
-static DEVICE_ATTR(wusb_trust_timeout, 0644, wusb_trust_timeout_show,
-					     wusb_trust_timeout_store);
+static DEVICE_ATTR_RW(wusb_trust_timeout);
 
 /*
  * Show the current WUSB CHID.
@@ -145,7 +144,7 @@ static ssize_t wusb_chid_store(struct device *dev,
 	result = wusbhc_chid_set(wusbhc, &chid);
 	return result < 0 ? result : size;
 }
-static DEVICE_ATTR(wusb_chid, 0644, wusb_chid_show, wusb_chid_store);
+static DEVICE_ATTR_RW(wusb_chid);
 
 
 static ssize_t wusb_phy_rate_show(struct device *dev,
@@ -174,8 +173,7 @@ static ssize_t wusb_phy_rate_store(struct device *dev,
 	wusbhc->phy_rate = phy_rate;
 	return size;
 }
-static DEVICE_ATTR(wusb_phy_rate, 0644, wusb_phy_rate_show,
-			wusb_phy_rate_store);
+static DEVICE_ATTR_RW(wusb_phy_rate);
 
 static ssize_t wusb_dnts_show(struct device *dev,
 				  struct device_attribute *attr,
@@ -205,7 +203,7 @@ static ssize_t wusb_dnts_store(struct device *dev,
 
 	return size;
 }
-static DEVICE_ATTR(wusb_dnts, 0644, wusb_dnts_show, wusb_dnts_store);
+static DEVICE_ATTR_RW(wusb_dnts);
 
 static ssize_t wusb_retry_count_show(struct device *dev,
 				  struct device_attribute *attr,
@@ -234,8 +232,7 @@ static ssize_t wusb_retry_count_store(struct device *dev,
 
 	return size;
 }
-static DEVICE_ATTR(wusb_retry_count, 0644, wusb_retry_count_show,
-	wusb_retry_count_store);
+static DEVICE_ATTR_RW(wusb_retry_count);
 
 /* Group all the WUSBHC attributes */
 static struct attribute *wusbhc_attrs[] = {

