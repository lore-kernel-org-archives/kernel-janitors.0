From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Jun 2018 12:04:33 +0000
Subject: [PATCH] test_overflow: fix an IS_ERR() vs NULL bug
Message-Id: <20180612120432.xqffkv7q74wnip5n@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

root_device_register() returns error pointers, it never returns NULL.

Fixes: ca90800a91ba ("test_overflow: Add memory allocation overflow tests")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/lib/test_overflow.c b/lib/test_overflow.c
index aecbbb217305..2278fe05a1b0 100644
--- a/lib/test_overflow.c
+++ b/lib/test_overflow.c
@@ -367,7 +367,7 @@ static int __init test_overflow_allocation(void)
 
 	/* Create dummy device for devm_kmalloc()-family tests. */
 	dev = root_device_register(device_name);
-	if (!dev) {
+	if (IS_ERR(dev)) {
 		pr_warn("Cannot register test device\n");
 		return 1;
 	}
