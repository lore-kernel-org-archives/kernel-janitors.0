From: Colin King <colin.king@canonical.com>
Date: Mon, 22 Jun 2020 14:48:50 +0000
Subject: [PATCH][next] mm: cma: remove redundant null check of the array cma->name
Message-Id: <20200622144850.45952-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Barry Song <song.bao.hua@hisilicon.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Mike Kravetz <mike.kravetz@oracle.com>, Roman Gushchin <guro@fb.com>, linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An earlier commit changed name from a pointer to an array so the
cma->name null check is now redundant and can be removed.

Addresses-Coverity: ("Array compared against 0")
Fixes: e7f0557d7de9 ("mm: cma: fix the name of CMA areas")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 mm/cma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/cma.c b/mm/cma.c
index 31a61d410c59..6cf08817bac6 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -52,7 +52,7 @@ unsigned long cma_get_size(const struct cma *cma)
 
 const char *cma_get_name(const struct cma *cma)
 {
-	return cma->name ? cma->name : "(undefined)";
+	return cma->name;
 }
 
 static unsigned long cma_bitmap_aligned_mask(const struct cma *cma,
-- 
2.27.0
