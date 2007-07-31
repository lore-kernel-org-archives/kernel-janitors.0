From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 17:17:27 +0000
Subject: [PATCH 13] kmalloc + memset conversion to kzalloc
Message-Id: <200707311917.27783.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, reiserfs-dev@namesys.com, reiserfs-devel@vger.kernel.org

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 fs/reiser4/plugin/file/cryptcompress.h |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- linux-2.6.23-rc1-mm1-a/fs/reiser4/plugin/file/cryptcompress.h	2007-07-26 13:07:46.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/fs/reiser4/plugin/file/cryptcompress.h	2007-07-31 15:01:29.000000000 +0200
@@ -83,10 +83,9 @@ static inline int alloc_ts(struct tfm_st
 	assert("edward-931", stm);
 	assert("edward-932", *stm = NULL);

-	*stm = kmalloc(sizeof **stm, reiser4_ctx_gfp_mask_get());
-	if (*stm = NULL)
+	*stm = kzalloc(sizeof(**stm), reiser4_ctx_gfp_mask_get());
+	if (!*stm)
 		return -ENOMEM;
-	memset(*stm, 0, sizeof **stm);
 	return 0;
 }

