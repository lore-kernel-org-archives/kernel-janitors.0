From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 14 Aug 2017 11:16:55 +0000
Subject: [PATCH 2/2] zpool: Use common error handling code in zpool_create_pool()
Message-Id: <54351127-7222-c578-10f7-ee0dbf8f7879@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0fec59a9-ac68-33f6-533a-adfb5fa3c380@users.sourceforge.net>
In-Reply-To: <0fec59a9-ac68-33f6-533a-adfb5fa3c380@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org, Dan Streetman <ddstreet@ieee.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 14 Aug 2017 13:04:33 +0200

Add a jump target so that a bit of exception handling can be better reused
in this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 mm/zpool.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/mm/zpool.c b/mm/zpool.c
index fe1943f7d844..e4634edef86d 100644
--- a/mm/zpool.c
+++ b/mm/zpool.c
@@ -171,10 +171,8 @@ struct zpool *zpool_create_pool(const char *type, const char *name, gfp_t gfp,
 	}
 
 	zpool = kmalloc(sizeof(*zpool), gfp);
-	if (!zpool) {
-		zpool_put_driver(driver);
-		return NULL;
-	}
+	if (!zpool)
+		goto put_driver;
 
 	zpool->driver = driver;
 	zpool->pool = driver->create(name, gfp, ops, zpool);
@@ -182,8 +180,9 @@ struct zpool *zpool_create_pool(const char *type, const char *name, gfp_t gfp,
 
 	if (!zpool->pool) {
 		pr_err("couldn't create %s pool\n", type);
-		zpool_put_driver(driver);
 		kfree(zpool);
+put_driver:
+		zpool_put_driver(driver);
 		return NULL;
 	}
 
-- 
2.14.0

