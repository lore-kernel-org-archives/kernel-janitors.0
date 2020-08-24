From: Walter Harms <wharms@bfs.de>
Date: Mon, 24 Aug 2020 15:35:16 +0000
Subject: AW: [PATCH v2] HID: roccat: add bounds checking in kone_sysfs_write_settings()
Message-Id: <ab4625b2b2ea41dd83ff9e192a027f41@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1597819984.4101.16.camel@web.de>,<20200824085735.GA208317@mwanda>
In-Reply-To: <20200824085735.GA208317@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Stefan Achatz <erazor_de@users.sourceforge.net>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

hello Dan, 

i notice that you can shorten the line to:
(line above checks for count==sizeof(struct kone_settings))

difference = memcmp(settings, &kone->settings, count);

nothing special just to shorten the line and make use of count.

and just to save one indent level and because its  readabel nicely:
    if ( ! difference ) 
          goto unlock;

hope that helps

re,
 wh
________________________________________
Von: kernel-janitors-owner@vger.kernel.org [kernel-janitors-owner@vger.kernel.org] im Auftrag von Dan Carpenter [dan.carpenter@oracle.com]
Gesendet: Montag, 24. August 2020 10:57
An: Stefan Achatz
Cc: Jiri Kosina; Benjamin Tissoires; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
Betreff: [PATCH v2] HID: roccat: add bounds checking in kone_sysfs_write_settings()

This code doesn't check if "settings->startup_profile" is within bounds
and that could result in an out of bounds array access.  What the code
does do is it checks if the settings can be written to the firmware, so
it's possible that the firmware has a bounds check?  It's safer and
easier to verify when the bounds checking is done in the kernel.

Fixes: 14bf62cde794 ("HID: add driver for Roccat Kone gaming mouse")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2:  In the v1 patch I added a check against settings->size but that's
potentially too strict so it was removed.

 drivers/hid/hid-roccat-kone.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-roccat-kone.c b/drivers/hid/hid-roccat-kone.c
index 2ff4c8e366ff..1ca64481145e 100644
--- a/drivers/hid/hid-roccat-kone.c
+++ b/drivers/hid/hid-roccat-kone.c
@@ -294,31 +294,40 @@ static ssize_t kone_sysfs_write_settings(struct file *fp, struct kobject *kobj,
        struct kone_device *kone = hid_get_drvdata(dev_get_drvdata(dev));
        struct usb_device *usb_dev = interface_to_usbdev(to_usb_interface(dev));
        int retval = 0, difference, old_profile;
+       struct kone_settings *settings = (struct kone_settings *)buf;

        /* I need to get my data in one piece */
        if (off != 0 || count != sizeof(struct kone_settings))
                return -EINVAL;

        mutex_lock(&kone->kone_lock);
-       difference = memcmp(buf, &kone->settings, sizeof(struct kone_settings));
+       difference = memcmp(settings, &kone->settings,
+                           sizeof(struct kone_settings));
        if (difference) {
-               retval = kone_set_settings(usb_dev,
-                               (struct kone_settings const *)buf);
-               if (retval) {
-                       mutex_unlock(&kone->kone_lock);
-                       return retval;
+               if (settings->startup_profile < 1 ||
+                   settings->startup_profile > 5) {
+                       retval = -EINVAL;
+                       goto unlock;
                }

+               retval = kone_set_settings(usb_dev, settings);
+               if (retval)
+                       goto unlock;
+
                old_profile = kone->settings.startup_profile;
-               memcpy(&kone->settings, buf, sizeof(struct kone_settings));
+               memcpy(&kone->settings, settings, sizeof(struct kone_settings));

                kone_profile_activated(kone, kone->settings.startup_profile);

                if (kone->settings.startup_profile != old_profile)
                        kone_profile_report(kone, kone->settings.startup_profile);
        }
+unlock:
        mutex_unlock(&kone->kone_lock);

+       if (retval)
+               return retval;
+
        return sizeof(struct kone_settings);
 }
 static BIN_ATTR(settings, 0660, kone_sysfs_read_settings,
--
2.28.0
