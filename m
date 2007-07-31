From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 18:24:05 +0000
Subject: [PATCH 43] fs/reiser4/ktxnmgrd.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707312024.06110.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, reiserfs-dev@namesys.com, reiserfs-devel@vger.kernel.org

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 fs/reiser4/ktxnmgrd.c | 5314 -> 5277 (-37 bytes)
 fs/reiser4/ktxnmgrd.o | 131624 -> 131496 (-128 bytes)

 fs/reiser4/ktxnmgrd.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- linux-2.6.23-rc1-mm1-a/fs/reiser4/ktxnmgrd.c	2007-07-26 13:07:46.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/fs/reiser4/ktxnmgrd.c	2007-07-31 14:58:09.000000000 +0200
@@ -130,13 +130,12 @@ int reiser4_init_ktxnmgrd(struct super_b

 	assert("zam-1014", mgr->daemon = NULL);

-	ctx = kmalloc(sizeof(ktxnmgrd_context), reiser4_ctx_gfp_mask_get());
-	if (ctx = NULL)
+	ctx = kzalloc(sizeof(ktxnmgrd_context), reiser4_ctx_gfp_mask_get());
+	if (!ctx)
 		return RETERR(-ENOMEM);

 	assert("nikita-2442", ctx != NULL);

-	memset(ctx, 0, sizeof *ctx);
 	init_waitqueue_head(&ctx->wait);

 	/*kcond_init(&ctx->startup);*/
