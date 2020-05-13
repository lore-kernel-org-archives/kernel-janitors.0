From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 May 2020 09:42:25 +0000
Subject: [PATCH] mm/hmm/test: fix an error code in hmm_dmirror_init()
Message-Id: <20200513094225.GE347693@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>
Cc: linux-mm@kvack.org, kernel-janitors@vger.kernel.org

If the allocation fails, then this should return -ENOMEM instead of
success.

Fixes: a149d2eb654b ("mm/hmm/test: add selftest driver for HMM")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 lib/test_hmm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 00bca6116f930..b4d9434e49e72 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -1119,8 +1119,10 @@ static int __init hmm_dmirror_init(void)
 	 * make the code here simpler (i.e., we need a struct page for it).
 	 */
 	dmirror_zero_page = alloc_page(GFP_HIGHUSER | __GFP_ZERO);
-	if (!dmirror_zero_page)
+	if (!dmirror_zero_page) {
+		ret = -ENOMEM;
 		goto err_chrdev;
+	}
 
 	pr_info("HMM test module loaded. This is only for testing HMM.\n");
 	return 0;
-- 
2.26.2
