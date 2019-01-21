From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 21 Jan 2019 14:00:11 +0000
Subject: [PATCH] lib/test_kmod: Potential double free in error handling
Message-Id: <20190121140011.GA14283@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a copy and paste bug so we set "config->test_driver" to NULL
twice instead of setting "config->test_fs".  Smatch complains that it
leads to a double free:

lib/test_kmod.c:840 __kmod_config_init() warn: 'config->test_fs' double freed

Fixes: d9c6a72d6fa2 ("kmod: add test driver to stress test the module loader")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 lib/test_kmod.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_kmod.c b/lib/test_kmod.c
index d82d022111e0..9cf77628fc91 100644
--- a/lib/test_kmod.c
+++ b/lib/test_kmod.c
@@ -632,7 +632,7 @@ static void __kmod_config_free(struct test_config *config)
 	config->test_driver = NULL;
 
 	kfree_const(config->test_fs);
-	config->test_driver = NULL;
+	config->test_fs = NULL;
 }
 
 static void kmod_config_free(struct kmod_test_device *test_dev)
-- 
2.17.1
