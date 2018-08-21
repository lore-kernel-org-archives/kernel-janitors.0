From: Colin King <colin.king@canonical.com>
Date: Tue, 21 Aug 2018 11:36:34 +0000
Subject: [PATCH] mm/gup_benchmark: fix unsigned comparison with less than zero
Message-Id: <20180821113634.3782-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, "Michael S . Tsirkin" <mst@redhat.com>, linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the return from get_user_pages_fast is being checked
to be less than zero for an error check, however, the variable being
checked is unsigned so the check is always false. Fix this by using
a signed long instead.

Detected by Coccinelle ("Unsigned expression compared with zero: nr <= 0")

Fixes: 64c349f4ae78 ("mm: add infrastructure for get_user_pages_fast() benchmarking")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 mm/gup_benchmark.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/gup_benchmark.c b/mm/gup_benchmark.c
index 6a473709e9b6..a9a15e7a1185 100644
--- a/mm/gup_benchmark.c
+++ b/mm/gup_benchmark.c
@@ -31,6 +31,8 @@ static int __gup_benchmark_ioctl(unsigned int cmd,
 	nr = gup->nr_pages_per_call;
 	start_time = ktime_get();
 	for (addr = gup->addr; addr < gup->addr + gup->size; addr = next) {
+		long n;
+
 		if (nr != gup->nr_pages_per_call)
 			break;
 
@@ -40,10 +42,10 @@ static int __gup_benchmark_ioctl(unsigned int cmd,
 			nr = (next - addr) / PAGE_SIZE;
 		}
 
-		nr = get_user_pages_fast(addr, nr, gup->flags & 1, pages + i);
-		if (nr <= 0)
+		n = get_user_pages_fast(addr, nr, gup->flags & 1, pages + i);
+		if (n <= 0)
 			break;
-		i += nr;
+		i += n;
 	}
 	end_time = ktime_get();
 
-- 
2.17.1
