From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 14:30:28 +0000
Subject: [PATCH 6/7] cfag12864b: Return an error code only as a constant in cfag12864b_init()
Message-Id: <8a996728-1739-abe6-1475-76f360f26a29@users.sourceforge.net>
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
Date: Sat, 10 Sep 2016 15:50:25 +0200

1. Return an error code without storing it in a local variable.

2. Do not use curly brackets at one source code place
   where a single statement should be sufficient.

3. Delete the local variable "ret" which became unnecessary with
   this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/auxdisplay/cfag12864b.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/auxdisplay/cfag12864b.c b/drivers/auxdisplay/cfag12864b.c
index b471b28..b2533e2 100644
--- a/drivers/auxdisplay/cfag12864b.c
+++ b/drivers/auxdisplay/cfag12864b.c
@@ -329,8 +329,6 @@ EXPORT_SYMBOL_GPL(cfag12864b_isinited);
 
 static int __init cfag12864b_init(void)
 {
-	int ret;
-
 	/* ks0108_init() must be called first */
 	if (!ks0108_isinited()) {
 		printk(KERN_ERR CFAG12864B_NAME ": ERROR: "
@@ -349,10 +347,8 @@ static int __init cfag12864b_init(void)
 	cfag12864b_cache = kmalloc_array(CFAG12864B_SIZE,
 					 sizeof(*cfag12864b_cache),
 					 GFP_KERNEL);
-	if (cfag12864b_cache = NULL) {
-		ret = -ENOMEM;
+	if (!cfag12864b_cache)
 		goto free_buffer;
-	}
 
 	cfag12864b_workqueue = create_singlethread_workqueue(CFAG12864B_NAME);
 	if (cfag12864b_workqueue = NULL)
@@ -367,7 +363,7 @@ static int __init cfag12864b_init(void)
 	kfree(cfag12864b_cache);
  free_buffer:
 	free_page((unsigned long) cfag12864b_buffer);
-	return ret;
+	return -ENOMEM;
 }
 
 static void __exit cfag12864b_exit(void)
-- 
2.10.0

