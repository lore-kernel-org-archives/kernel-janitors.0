From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 30 Jul 2010 11:08:00 +0000
Subject: [PATCH 3/9] staging: otus: check kmalloc() return value
Message-Id: <1280488080-20777-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Alexander Beregalov <a.beregalov@gmail.com>, Tejun Heo <tj@kernel.org>, Mithlesh Thukral <mithlesh@linsyssoft.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

kmalloc() may fail, if so return error from zfwUsbSubmitControl().

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/otus/wrap_usb.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/otus/wrap_usb.c b/drivers/staging/otus/wrap_usb.c
index 93459ca..9f04047 100644
--- a/drivers/staging/otus/wrap_usb.c
+++ b/drivers/staging/otus/wrap_usb.c
@@ -104,6 +104,11 @@ u32_t zfwUsbSubmitControl(zdev_t *dev, u8_t req, u16_t value, u16_t index,
 
 	if (size > 0) {
 		buf = kmalloc(size, GFP_KERNEL);
+		if (buf = NULL) {
+			pr_err("zfwUsbSubmitControl() failed, "
+				  "kmalloc() returned NULL\n");
+			return 1;
+		}
 		memcpy(buf, (u8_t *)data, size);
 	} else
 		buf = NULL;
-- 
1.7.0.4

