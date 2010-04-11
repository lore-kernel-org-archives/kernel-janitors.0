From: shenghui <crosslonelyover@gmail.com>
Date: Sun, 11 Apr 2010 05:23:12 +0000
Subject: [PATCH] Fix inappropriate substraction on tracing_pages_allocated in
Message-Id: <m2i5a774f4c1004102223zbfc0ce63u4e8682b69e7d8088@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rostedt@goodmis.org, fweisbec@gmail.com, mingo@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I noticed inappropriate substraction on variable
tracing_pages_allocated in trace_free_page()in 2.6.27.y series (from
2.6.27 to 2.6.27.46) kernel.


Signed-off-by: Wang Sheng-Hui <crosslonelyover@gmail.com>

---
 kernel/trace/trace.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 8f3fb3d..dfe3995 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -3018,7 +3018,6 @@ static int trace_free_page(void)
 		ClearPageLRU(page);
 		list_del(&page->lru);
 		tracing_pages_allocated--;
-		tracing_pages_allocated--;
 		__free_page(page);

 		tracing_reset(data);
@@ -3036,6 +3035,7 @@ static int trace_free_page(void)
 		page = list_entry(p, struct page, lru);
 		ClearPageLRU(page);
 		list_del(&page->lru);
+		tracing_pages_allocated--;
 		__free_page(page);

 		tracing_reset(data);
