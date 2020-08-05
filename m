From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Aug 2020 09:55:01 +0000
Subject: [PATCH] HID: roccat: add bounds checking in kone_sysfs_write_settings()
Message-Id: <20200805095501.GD483832@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Achatz <erazor_de@users.sourceforge.net>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In the original code we didn't check if the new value for
"settings->startup_profile" was within bounds that could possibly
result in an out of bounds array acccess.  What we did was we checked if
we could write the data to the firmware and it's possibly the firmware
checks these values but there is no way to know.  It's safer and easier
to read if we check it in the kernel as well.

I also added a check to ensure that "settings->size" was correct.  The
comments say that the only valid value is 36 which is sizeof(struct
kone_settings).

Fixes: 14bf62cde794 ("HID: add driver for Roccat Kone gaming mouse")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This isn't tested.  Checking settings->size seems like a good idea, but
there is a slight risky because maybe invalid values used to be allowed
and I don't want to break user space.

 drivers/hid/hid-roccat-kone.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-roccat-kone.c b/drivers/hid/hid-roccat-kone.c
index 1a6e600197d0..5e8e1517f23c 100644
--- a/drivers/hid/hid-roccat-kone.c
+++ b/drivers/hid/hid-roccat-kone.c
@@ -294,31 +294,41 @@ static ssize_t kone_sysfs_write_settings(struct file *fp, struct kobject *kobj,
 	struct kone_device *kone = hid_get_drvdata(dev_get_drvdata(dev));
 	struct usb_device *usb_dev = interface_to_usbdev(to_usb_interface(dev));
 	int retval = 0, difference, old_profile;
+	struct kone_settings *settings = (struct kone_settings *)buf;
 
 	/* I need to get my data in one piece */
 	if (off != 0 || count != sizeof(struct kone_settings))
 		return -EINVAL;
 
 	mutex_lock(&kone->kone_lock);
-	difference = memcmp(buf, &kone->settings, sizeof(struct kone_settings));
+	difference = memcmp(settings, &kone->settings,
+			    sizeof(struct kone_settings));
 	if (difference) {
-		retval = kone_set_settings(usb_dev,
-				(struct kone_settings const *)buf);
-		if (retval) {
-			mutex_unlock(&kone->kone_lock);
-			return retval;
+		if (settings->size != sizeof(struct kone_settings) ||
+		    settings->startup_profile < 1 ||
+		    settings->startup_profile > 5) {
+			retval = -EINVAL;
+			goto unlock;
 		}
 
+		retval = kone_set_settings(usb_dev, settings);
+		if (retval)
+			goto unlock;
+
 		old_profile = kone->settings.startup_profile;
-		memcpy(&kone->settings, buf, sizeof(struct kone_settings));
+		memcpy(&kone->settings, settings, sizeof(struct kone_settings));
 
 		kone_profile_activated(kone, kone->settings.startup_profile);
 
 		if (kone->settings.startup_profile != old_profile)
 			kone_profile_report(kone, kone->settings.startup_profile);
 	}
+unlock:
 	mutex_unlock(&kone->kone_lock);
 
+	if (retval)
+		return retval;
+
 	return sizeof(struct kone_settings);
 }
 static BIN_ATTR(settings, 0660, kone_sysfs_read_settings,
-- 
2.27.0
