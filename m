From: Firo Yang <firogm@gmail.com>
Date: Fri, 05 Jun 2015 16:38:36 +0000
Subject: [PATCH] firmware: Fix memory leak in error path
Message-Id: <1433522316-23063-1-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In error path, we forgot to free fw_work alloced by kzalloc.
This will make a memory leak. So just free it before return.

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 drivers/base/firmware_class.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/firmware_class.c b/drivers/base/firmware_class.c
index 8c3aa3c..9c42883 100644
--- a/drivers/base/firmware_class.c
+++ b/drivers/base/firmware_class.c
@@ -1307,8 +1307,10 @@ request_firmware_nowait(
 
 	fw_work->module = module;
 	fw_work->name = kstrdup_const(name, gfp);
-	if (!fw_work->name)
+	if (!fw_work->name) {
+		kfree(fw_work);
 		return -ENOMEM;
+	}
 	fw_work->device = device;
 	fw_work->context = context;
 	fw_work->cont = cont;
-- 
2.4.2

