From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 May 2017 08:25:03 +0000
Subject: [PATCH 1/3] zswap: Delete an error message for a failed memory allocation in zswap_pool_create()
Message-Id: <2345aabc-ae98-1d31-afba-40a02c5baf3d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05101843-91f6-3243-18ea-acac8e8ef6af@users.sourceforge.net>
In-Reply-To: <05101843-91f6-3243-18ea-acac8e8ef6af@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org, Dan Streetman <ddstreet@ieee.org>, Seth Jennings <sjenning@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 May 2017 22:33:21 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 mm/zswap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/zswap.c b/mm/zswap.c
index eedc27894b10..18d8e87119a6 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -518,7 +518,5 @@ static struct zswap_pool *zswap_pool_create(char *type, char *compressor)
-	if (!pool) {
-		pr_err("pool alloc failed\n");
+	if (!pool)
 		return NULL;
-	}
 
 	/* unique name for each pool specifically required by zsmalloc */
 	snprintf(name, 38, "zswap%x", atomic_inc_return(&zswap_pools_count));
-- 
2.13.0

