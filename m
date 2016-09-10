From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 14:28:25 +0000
Subject: [PATCH 4/7] cfag12864b: Return directly after a failed get_zeroed_page()
Message-Id: <fa7102b8-8ef1-a53d-e9f4-a15e559f5ea2@users.sourceforge.net>
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
Date: Sat, 10 Sep 2016 15:30:56 +0200

* Return directly after a call of the function "get_zeroed_page" failed
  at the beginning.

* Delete the jump label "none" which became unnecessary with
  this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/auxdisplay/cfag12864b.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/auxdisplay/cfag12864b.c b/drivers/auxdisplay/cfag12864b.c
index 921e177..2fa149b 100644
--- a/drivers/auxdisplay/cfag12864b.c
+++ b/drivers/auxdisplay/cfag12864b.c
@@ -343,8 +343,7 @@ static int __init cfag12864b_init(void)
 	if (cfag12864b_buffer = NULL) {
 		printk(KERN_ERR CFAG12864B_NAME ": ERROR: "
 			"can't get a free page\n");
-		ret = -ENOMEM;
-		goto none;
+		return -ENOMEM;
 	}
 
 	cfag12864b_cache = kmalloc_array(CFAG12864B_SIZE,
@@ -370,8 +369,6 @@ cachealloced:
 
 bufferalloced:
 	free_page((unsigned long) cfag12864b_buffer);
-
-none:
 	return ret;
 }
 
-- 
2.10.0

