From: Dan Carpenter <error27@gmail.com>
Date: Mon, 24 Jan 2011 18:32:13 +0000
Subject: [patch] hid: check for kmalloc() failure
Message-Id: <20110124183213.GA2721@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jkosina@suse.cz>, erazor_de@users.sourceforge.net
Cc: linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

Return -ENOMEM if kmalloc() fails.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/hid/hid-roccat-koneplus.c b/drivers/hid/hid-roccat-koneplus.c
index 1608c8d..c27bc91 100644
--- a/drivers/hid/hid-roccat-koneplus.c
+++ b/drivers/hid/hid-roccat-koneplus.c
@@ -220,6 +220,10 @@ static int koneplus_get_startup_profile(struct usb_device *usb_dev)
 	int retval;
 
 	buf = kmalloc(sizeof(struct koneplus_startup_profile), GFP_KERNEL);
+	if (!buf) {
+		retval = -ENOMEM;
+		goto out;
+	}
 
 	retval = koneplus_receive(usb_dev, KONEPLUS_USB_COMMAND_STARTUP_PROFILE,
 			buf, sizeof(struct koneplus_startup_profile));
