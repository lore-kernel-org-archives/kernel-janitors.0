From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 17:16:13 +0000
Subject: [PATCH 12] fs/reiser4/plugin/file/cryptcompress.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707311916.13506.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, reiserfs-dev@namesys.com, reiserfs-devel@vger.kernel.org

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 fs/reiser4/plugin/file/cryptcompress.c | 101386 -> 101352 (-34 bytes)
 fs/reiser4/plugin/file/cryptcompress.o | 456784 -> 456644 (-140 bytes)

 fs/reiser4/plugin/file/cryptcompress.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-2.6.23-rc1-mm1-a/fs/reiser4/plugin/file/cryptcompress.c	2007-07-26 13:07:46.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/fs/reiser4/plugin/file/cryptcompress.c	2007-07-31 15:00:24.000000000 +0200
@@ -74,13 +74,13 @@ static void set_inode_crypto_info (struc
 /* allocate a cipher key info */
 struct reiser4_crypto_info * reiser4_alloc_crypto_info (struct inode * inode)
 {
-	struct reiser4_crypto_info * info;
+	struct reiser4_crypto_info *info;
 	int fipsize;

-	info = kmalloc(sizeof(*info), reiser4_ctx_gfp_mask_get());
+	info = kzalloc(sizeof(*info), reiser4_ctx_gfp_mask_get());
 	if (!info)
 		return ERR_PTR(-ENOMEM);
-	memset(info, 0, sizeof (*info));
+
 	fipsize = inode_digest_plugin(inode)->fipsize;
 	info->keyid = kmalloc(fipsize, reiser4_ctx_gfp_mask_get());
 	if (!info->keyid) {
