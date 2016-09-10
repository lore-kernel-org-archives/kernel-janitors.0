From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 14:29:34 +0000
Subject: [PATCH 5/7] cfag12864b: Rename jump labels in cfag12864b_init()
Message-Id: <ac00e60f-df70-d51d-c6f4-3890f4bf2bb7@users.sourceforge.net>
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
Date: Sat, 10 Sep 2016 15:35:02 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/auxdisplay/cfag12864b.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/auxdisplay/cfag12864b.c b/drivers/auxdisplay/cfag12864b.c
index 2fa149b..b471b28 100644
--- a/drivers/auxdisplay/cfag12864b.c
+++ b/drivers/auxdisplay/cfag12864b.c
@@ -351,23 +351,21 @@ static int __init cfag12864b_init(void)
 					 GFP_KERNEL);
 	if (cfag12864b_cache = NULL) {
 		ret = -ENOMEM;
-		goto bufferalloced;
+		goto free_buffer;
 	}
 
 	cfag12864b_workqueue = create_singlethread_workqueue(CFAG12864B_NAME);
 	if (cfag12864b_workqueue = NULL)
-		goto cachealloced;
+		goto free_cache;
 
 	cfag12864b_clear();
 	cfag12864b_on();
 
 	cfag12864b_inited = 1;
 	return 0;
-
-cachealloced:
+ free_cache:
 	kfree(cfag12864b_cache);
-
-bufferalloced:
+ free_buffer:
 	free_page((unsigned long) cfag12864b_buffer);
 	return ret;
 }
-- 
2.10.0

