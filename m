From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Nov 2017 10:06:01 +0000
Subject: [PATCH] platform/x86: wmi: Unlock on error in wmi_ioctl()
Message-Id: <20171113100601.quq6qjvlk6ijzmri@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Darren Hart <dvhart@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to drop a lock if try_module_get() fails.

Fixes: 44b6b7661132 ("platform/x86: wmi: create userspace interface for drivers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 8c31ed4f0e1b..791449a2370f 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -868,8 +868,10 @@ static long wmi_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	/* let the driver do any filtering and do the call */
 	wdriver = container_of(wblock->dev.dev.driver,
 			       struct wmi_driver, driver);
-	if (!try_module_get(wdriver->driver.owner))
-		return -EBUSY;
+	if (!try_module_get(wdriver->driver.owner)) {
+		ret = -EBUSY;
+		goto out_ioctl;
+	}
 	ret = wdriver->filter_callback(&wblock->dev, cmd, buf);
 	module_put(wdriver->driver.owner);
 	if (ret)
