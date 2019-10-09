From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 09 Oct 2019 12:27:40 +0000
Subject: [PATCH -next] userfaultfd: remove set but not used variable 'h'
Message-Id: <20191009122740.70517-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrea Arcangeli <aarcange@redhat.com>, "Joel Fernandes (Google)" <joel@joelfernandes.org>, Andrew Morton <akpm@linux-foundation.org>, Mike
 Kravetz <mike.kravetz@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Wei Yang <richardw.yang@linux.intel.com>, Hugh Dickins <hughd@google.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

mm/userfaultfd.c: In function '__mcopy_atomic_hugetlb':
mm/userfaultfd.c:217:17: warning:
 variable 'h' set but not used [-Wunused-but-set-variable]

It is not used since commit 78911d0e18ac ("userfaultfd: use vma_pagesize
for all huge page size calculation")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 mm/userfaultfd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 4cb4ef3d9128..1b0d7abad1d4 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -214,7 +214,6 @@ static __always_inline ssize_t __mcopy_atomic_hugetlb(struct mm_struct *dst_mm,
 	unsigned long src_addr, dst_addr;
 	long copied;
 	struct page *page;
-	struct hstate *h;
 	unsigned long vma_hpagesize;
 	pgoff_t idx;
 	u32 hash;
@@ -271,8 +270,6 @@ static __always_inline ssize_t __mcopy_atomic_hugetlb(struct mm_struct *dst_mm,
 			goto out_unlock;
 	}
 
-	h = hstate_vma(dst_vma);
-
 	while (src_addr < src_start + len) {
 		pte_t dst_pteval;
