From: Dan Carpenter <error27@gmail.com>
Date: Sat, 26 Feb 2011 12:55:24 +0000
Subject: [patch 3/3] sony-laptop: handle allocation failures
Message-Id: <20110226125524.GK18043@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mattia Dongili <malattia@linux.it>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

Return -ENOMEM if kzalloc() fails.  The callers already handle error
returns.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index d0d0522..0db9049 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -768,6 +768,8 @@ static int sony_nc_handles_setup(struct platform_device *pd)
 	int result;
 
 	handles = kzalloc(sizeof(*handles), GFP_KERNEL);
+	if (!handles)
+		return -ENOMEM;
 
 	sysfs_attr_init(&handles->devattr.attr);
 	handles->devattr.attr.name = "handles";
@@ -1458,6 +1460,8 @@ static int sony_nc_kbd_backlight_setup(struct platform_device *pd)
 		return 0;
 
 	kbdbl_handle = kzalloc(sizeof(*kbdbl_handle), GFP_KERNEL);
+	if (!kbdbl_handle)
+		return -ENOMEM;
 
 	sysfs_attr_init(&kbdbl_handle->mode_attr.attr);
 	kbdbl_handle->mode_attr.attr.name = "kbd_backlight";
