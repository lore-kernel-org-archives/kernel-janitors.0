From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 Dec 2020 08:42:10 +0000
Subject: [PATCH] USB: apple-mfi-fastcharge: Fix use after free in probe
Message-Id: <X8ik4j8yJitVUyfU@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bastien Nocera <hadess@hadess.net>, Lucas Tanure <tanure@linux.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

This code frees "mfi" and then derefences it on the next line to get
the error code.

Fixes: b0eec52fbe63 ("USB: apple-mfi-fastcharge: Fix kfree after failed kzalloc")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/misc/apple-mfi-fastcharge.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c b/drivers/usb/misc/apple-mfi-fastcharge.c
index 6dedd5498e8a..32a17b42d57b 100644
--- a/drivers/usb/misc/apple-mfi-fastcharge.c
+++ b/drivers/usb/misc/apple-mfi-fastcharge.c
@@ -178,6 +178,7 @@ static int mfi_fc_probe(struct usb_device *udev)
 {
 	struct power_supply_config battery_cfg = {};
 	struct mfi_device *mfi = NULL;
+	int err;
 
 	if (!mfi_fc_match(udev))
 		return -ENODEV;
@@ -194,8 +195,9 @@ static int mfi_fc_probe(struct usb_device *udev)
 						&battery_cfg);
 	if (IS_ERR(mfi->battery)) {
 		dev_err(&udev->dev, "Can't register battery\n");
+		err = PTR_ERR(mfi->battery);
 		kfree(mfi);
-		return PTR_ERR(mfi->battery);
+		return err;
 	}
 
 	mfi->udev = usb_get_dev(udev);
-- 
2.29.2
