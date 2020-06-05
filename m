From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Jun 2020 11:07:36 +0000
Subject: [PATCH] khugepaged: selftests: fix timeout condition in wait_for_scan()
Message-Id: <20200605110736.GH978434@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shuah Khan <shuah@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Zi Yan <ziy@nvidia.com>, William Kucharski <william.kucharski@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Yang Shi <yang.shi@linux.alibaba.com>, John Hubbard <jhubbard@nvidia.com>, linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org

The loop exits with "timeout" set to -1 and not to 0 so the test needs
to be fixed.

Fixes: e7b592f6caca ("khugepaged: add self test")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 tools/testing/selftests/vm/khugepaged.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vm/khugepaged.c b/tools/testing/selftests/vm/khugepaged.c
index 51b89cedd09d1..8b75821302a79 100644
--- a/tools/testing/selftests/vm/khugepaged.c
+++ b/tools/testing/selftests/vm/khugepaged.c
@@ -502,7 +502,7 @@ static bool wait_for_scan(const char *msg, char *p)
 
 	madvise(p, hpage_pmd_size, MADV_NOHUGEPAGE);
 
-	return !timeout;
+	return timeout = -1;
 }
 
 static void alloc_at_fault(void)
-- 
2.26.2
