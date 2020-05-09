From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 09 May 2020 02:58:50 +0000
Subject: [PATCH -next] mm/hmm/test: fix missing unlock on error in dmirror_migrate_finalize_and_map()
Message-Id: <20200509030225.14592-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jglisse@redhat.com, Ralph Campbell <rcampbell@nvidia.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Add the missing unlock before return from function
dmirror_migrate_finalize_and_map() in the error
handling case.

Fixes: 5d5e54be8a1e ("mm/hmm/test: add selftest driver for HMM")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 lib/test_hmm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 00bca6116f93..30462193c4ff 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -647,8 +647,10 @@ static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
 		if (*dst & MIGRATE_PFN_WRITE)
 			entry = xa_tag_pointer(entry, DPT_XA_TAG_WRITE);
 		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
-		if (xa_is_err(entry))
+		if (xa_is_err(entry)) {
+			mutex_unlock(&dmirror->mutex);
 			return xa_err(entry);
+		}
 	}
 
 	mutex_unlock(&dmirror->mutex);
