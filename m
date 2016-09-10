From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 14:27:34 +0000
Subject: [PATCH 3/7] cfag12864b: Return directly if the driver "ks0108" was not initialized
Message-Id: <c76d5fa4-da07-19b3-3087-f47ec53eee29@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <3d24b514-4e99-86ea-d69e-49a0b1edd286@users.sourceforge.net>
In-Reply-To: <3d24b514-4e99-86ea-d69e-49a0b1edd286@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 15:15:10 +0200

* Return directly if the LCD controller driver was not initialized
  at the beginning.

* Omit an explicit variable initialisation which became unnecessary with
  this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/auxdisplay/cfag12864b.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/auxdisplay/cfag12864b.c b/drivers/auxdisplay/cfag12864b.c
index fd07fad..921e177 100644
--- a/drivers/auxdisplay/cfag12864b.c
+++ b/drivers/auxdisplay/cfag12864b.c
@@ -329,13 +329,13 @@ EXPORT_SYMBOL_GPL(cfag12864b_isinited);
 
 static int __init cfag12864b_init(void)
 {
-	int ret = -EINVAL;
+	int ret;
 
 	/* ks0108_init() must be called first */
 	if (!ks0108_isinited()) {
 		printk(KERN_ERR CFAG12864B_NAME ": ERROR: "
 			"ks0108 is not initialized\n");
-		goto none;
+		return -EINVAL;
 	}
 	BUILD_BUG_ON(PAGE_SIZE < CFAG12864B_SIZE);
 
-- 
2.10.0

