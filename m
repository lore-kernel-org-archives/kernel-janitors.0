From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 08 Dec 2012 15:25:12 +0000
Subject: [PATCH] Remove two unused variables and two useless calls to kfree
Message-Id: <1354980312-7184-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

old_class_name, and new_class_name are never used. This patch remove the
declaration and calls to kfree.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r1 forall@
type T; identifier i;
@@
* T *i = NULL;
  ... when != i
* kfree(i);
// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 drivers/base/core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index a235085..27603a6 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1685,8 +1685,6 @@ EXPORT_SYMBOL_GPL(device_destroy);
  */
 int device_rename(struct device *dev, const char *new_name)
 {
-	char *old_class_name = NULL;
-	char *new_class_name = NULL;
 	char *old_device_name = NULL;
 	int error;
 
@@ -1717,8 +1715,6 @@ int device_rename(struct device *dev, const char *new_name)
 out:
 	put_device(dev);
 
-	kfree(new_class_name);
-	kfree(old_class_name);
 	kfree(old_device_name);
 
 	return error;
-- 
1.7.11.7

