From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 11 Jan 2018 11:13:45 +0000
Subject: [PATCH -next] test_firmware: make local symbol test_fw_config static
Message-Id: <1515669225-125691-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warnings:

lib/test_firmware.c:99:20: warning:
 symbol 'test_fw_config' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 lib/test_firmware.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_firmware.c b/lib/test_firmware.c
index 964784d..1e907dd3b4 100644
--- a/lib/test_firmware.c
+++ b/lib/test_firmware.c
@@ -96,7 +96,7 @@ struct test_config {
 			    struct device *device);
 };
 
-struct test_config *test_fw_config;
+static struct test_config *test_fw_config;
 
 static ssize_t test_fw_misc_read(struct file *f, char __user *buf,
 				 size_t size, loff_t *offset)

