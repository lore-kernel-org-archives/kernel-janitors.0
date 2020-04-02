From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Apr 2020 11:13:41 +0000
Subject: [PATCH] driver core: platform: remove redundant assignment to variable ret
Message-Id: <20200402111341.511801-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read
and it is being updated later with a new value. The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/base/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 5255550b7c34..2e454c18b3a9 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -668,7 +668,7 @@ EXPORT_SYMBOL_GPL(platform_device_unregister);
 struct platform_device *platform_device_register_full(
 		const struct platform_device_info *pdevinfo)
 {
-	int ret = -ENOMEM;
+	int ret;
 	struct platform_device *pdev;
 
 	pdev = platform_device_alloc(pdevinfo->name, pdevinfo->id);
-- 
2.25.1
