From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Oct 2017 20:08:28 +0000
Subject: [PATCH 1/3] char/bsr: Delete an error message for a failed memory allocation in bsr_add_node()
Message-Id: <6a324cb1-873a-6cd3-881e-42f1adb92e06@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ff23c201-8043-124e-88fd-25e5abd382fb@users.sourceforge.net>
In-Reply-To: <ff23c201-8043-124e-88fd-25e5abd382fb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Oct 2017 21:12:34 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/bsr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/bsr.c b/drivers/char/bsr.c
index a6cef548e01e..865eb457e539 100644
--- a/drivers/char/bsr.c
+++ b/drivers/char/bsr.c
@@ -203,7 +203,6 @@ static int bsr_add_node(struct device_node *bn)
 		int result;
 
 		if (!cur) {
-			printk(KERN_ERR "Unable to alloc bsr dev\n");
 			ret = -ENOMEM;
 			goto out_err;
 		}
-- 
2.14.2

