From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sun, 05 Sep 2010 18:32:22 +0000
Subject: [PATCH 02/14] char: tty_io: check return code of tty_register_device
Message-Id: <1283711542-7164-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Vasiliy Kulikov <segooon@gmail.com>, Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Al Viro <viro@zeniv.linux.org.uk>, Nick Piggin <npiggin@kernel.dk>, linux-kernel@vger.kernel.org

From: Vasiliy Kulikov <segooon@gmail.com>

Function tty_register_device may return ERR_PTR(...). Check for it.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Probably we need another resource deallocation in err.
 Compile tested.

 drivers/char/tty_io.c |   24 ++++++++++++++++++++++--
 1 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/char/tty_io.c b/drivers/char/tty_io.c
index d6c659f..e185db3 100644
--- a/drivers/char/tty_io.c
+++ b/drivers/char/tty_io.c
@@ -3004,6 +3004,7 @@ int tty_register_driver(struct tty_driver *driver)
 	int i;
 	dev_t dev;
 	void **p = NULL;
+	struct device *d;
 
 	if (!(driver->flags & TTY_DRIVER_DEVPTS_MEM) && driver->num) {
 		p = kzalloc(driver->num * 2 * sizeof(void *), GFP_KERNEL);
@@ -3051,12 +3052,31 @@ int tty_register_driver(struct tty_driver *driver)
 	mutex_unlock(&tty_mutex);
 
 	if (!(driver->flags & TTY_DRIVER_DYNAMIC_DEV)) {
-		for (i = 0; i < driver->num; i++)
-		    tty_register_device(driver, i, NULL);
+		for (i = 0; i < driver->num; i++) {
+			d = tty_register_device(driver, i, NULL);
+			if (IS_ERR(d)) {
+				error = PTR_ERR(d);
+				goto err;
+			}
+		}
 	}
 	proc_tty_register_driver(driver);
 	driver->flags |= TTY_DRIVER_INSTALLED;
 	return 0;
+
+err:
+	for (i--; i >= 0; i--)
+		tty_unregister_device(driver, i);
+
+	mutex_lock(&tty_mutex);
+	list_del(&driver->tty_drivers);
+	mutex_unlock(&tty_mutex);
+
+	unregister_chrdev_region(dev, driver->num);
+	driver->ttys = NULL;
+	driver->termios = NULL;
+	kfree(p);
+	return error;
 }
 
 EXPORT_SYMBOL(tty_register_driver);
-- 
1.7.0.4

