From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Dec 2020 10:13:57 +0000
Subject: [PATCH] hugetlb: Fix an error code in hugetlb_reserve_pages()
Message-Id: <X9NGZWnZl5/Mt99R@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Kravetz <mike.kravetz@oracle.com>, Mina Almasry <almasrymina@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Rientjes <rientjes@google.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

Preserve the error code from region_add() instead of returning success.

Fixes: 0db9d74ed884 ("hugetlb: disable region_add file_region coalescing")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Untested.

 mm/hugetlb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 1f3bf1710b66..ac2e48b9f1d7 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5113,6 +5113,7 @@ int hugetlb_reserve_pages(struct inode *inode,
 
 		if (unlikely(add < 0)) {
 			hugetlb_acct_memory(h, -gbl_reserve);
+			ret = add;
 			goto out_put_pages;
 		} else if (unlikely(chg > add)) {
 			/*
-- 
2.29.2
