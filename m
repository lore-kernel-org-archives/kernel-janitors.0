From: Colin King <colin.king@canonical.com>
Date: Fri, 16 Oct 2020 14:33:51 +0000
Subject: [PATCH] lightnvm: fix out-of-bounds write to array devices->info[]
Message-Id: <20201016143351.677352-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matias Bjorling <mb@lightnvm.io>, =?UTF-8?q?Matias=20Bj=C3=B8rling?= <m@bjorling.me>, Jens Axboe <axboe@fb.com>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an off-by-one array check that can lead to a out-of-bounds
write to devices->info[i].  Fix this by checking by using >= rather
than > for the size check. Also replace hard-coded array size limit
with ARRAY_SIZE on the array.

Addresses-Coverity: ("Out-of-bounds write")
Fixes: cd9e9808d18f ("lightnvm: Support for Open-Channel SSDs")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/lightnvm/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/lightnvm/core.c b/drivers/lightnvm/core.c
index fe78bf0fdce5..f9f5dd38c697 100644
--- a/drivers/lightnvm/core.c
+++ b/drivers/lightnvm/core.c
@@ -1311,8 +1311,9 @@ static long nvm_ioctl_get_devices(struct file *file, void __user *arg)
 		strlcpy(info->bmname, "gennvm", sizeof(info->bmname));
 		i++;
 
-		if (i > 31) {
-			pr_err("max 31 devices can be reported.\n");
+		if (i >= ARRAY_SIZE(devices->info)) {
+			pr_err("max %zd devices can be reported.\n",
+			       ARRAY_SIZE(devices->info));
 			break;
 		}
 	}
-- 
2.27.0
