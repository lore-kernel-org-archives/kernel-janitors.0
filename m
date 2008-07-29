From: Alexander Beregalov <a.beregalov@gmail.com>
Date: Tue, 29 Jul 2008 01:54:31 +0000
Subject: [PATCH] usb/core/driver: fix warning
Message-Id: <20080729015431.GA28952@orion>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Alexander Beregalov <a.beregalov@gmail.com>

usb/core/driver: fix warning:
drivers/usb/core/driver.c:834: warning: 'do_unbind_rebind' defined but not used


Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

---

 drivers/usb/core/driver.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index ddb54e1..6618bc8 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -774,6 +774,7 @@ void usb_deregister(struct usb_driver *driver)
 }
 EXPORT_SYMBOL_GPL(usb_deregister);
 
+#ifdef CONFIG_PM
 
 /* Forced unbinding of a USB interface driver, either because
  * it doesn't support pre_reset/post_reset/reset_resume or
@@ -872,8 +873,6 @@ static void do_unbind_rebind(struct usb_device *udev, int action)
 	}
 }
 
-#ifdef CONFIG_PM
-
 /* Caller has locked udev's pm_mutex */
 static int usb_suspend_device(struct usb_device *udev, pm_message_t msg)
 {
