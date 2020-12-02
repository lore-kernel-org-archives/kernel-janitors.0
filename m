From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Dec 2020 06:45:31 +0000
Subject: [PATCH] pstore: Tidy up an error check
Message-Id: <X8c4C2q6qaZ8qX6L@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kees Cook <keescook@chromium.org>
Cc: Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The crypto_alloc_comp() function never returns NULL, it returns error
pointers on error.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/pstore/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index 36714df37d5d..b7a2a2a31dee 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -315,7 +315,7 @@ static void allocate_buf_for_compression(void)
 	}
 
 	ctx = crypto_alloc_comp(zbackend->name, 0, 0);
-	if (IS_ERR_OR_NULL(ctx)) {
+	if (IS_ERR(ctx)) {
 		kfree(buf);
 		pr_err("crypto_alloc_comp('%s') failed: %ld\n", zbackend->name,
 		       PTR_ERR(ctx));
-- 
2.29.2
