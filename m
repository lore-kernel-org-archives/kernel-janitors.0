From: Mel Gorman <mgorman@suse.de>
Date: Wed, 26 Sep 2012 09:10:45 +0000
Subject: [PATCH] mm: compaction: cache if a pageblock was scanned and no pages were isolated -fix
Message-Id: <20120926091044.GH11266@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu reported the following

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mhocko/mm.git since-3.5
head:   2f641f902ca76711e47e8d3b18004f0e46ca3d9b
commit: 7faeb2a39c789f1bac69014cc468677a60b73395 [184/186] mm:
compaction: cache if a pageblock was scanned and no pages were isolated
config: i386-randconfig-b083 (attached as .config)

All error/warnings:

mm/compaction.c: In function 'isolation_suitable':
mm/compaction.c:60:2: error: implicit declaration of function 'get_pageblock_skip' [-Werror=implicit-function-declaration]
mm/compaction.c: In function 'reset_isolation_suitable':
mm/compaction.c:94:3: error: implicit declaration of function 'clear_pageblock_skip' [-Werror=implicit-function-declaration]
mm/compaction.c: In function 'update_pageblock_skip':
mm/compaction.c:108:3: error: implicit declaration of function 'set_pageblock_skip' [-Werror=implicit-function-declaration]
mm/compaction.c: At top level:
mm/compaction.c:68:13: warning: 'reset_isolation_suitable' defined but not used [-Wunused-function]
mm/compaction.c:177:13: warning: 'compact_capture_page' defined but not used [-Wunused-function]
cc1: some warnings being treated as errors

Michal Hocko suggested implementing !CONFIG_COMPACTION versions of these
functions but that still leaves the dead version of
reset_isolation_suitable in the !CONFIG_COMPACTION && CONFIG_CMA case.
Create !CONFIG_COMPACTION versions of isolation_suitable() and
update_pageblock_skip() instead.

This is a fix for
mm-compaction-cache-if-a-pageblock-was-scanned-and-no-pages-were-isolated.patch

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Mel Gorman <mgorman@suse.de>
---
 mm/compaction.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/compaction.c b/mm/compaction.c
index 5ffe9a5..fb07abb 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -50,6 +50,7 @@ static inline bool migrate_async_suitable(int migratetype)
 	return is_migrate_cma(migratetype) || migratetype = MIGRATE_MOVABLE;
 }
 
+#ifdef CONFIG_COMPACTION
 /* Returns true if the pageblock should be scanned for pages to isolate. */
 static inline bool isolation_suitable(struct compact_control *cc,
 					struct page *page)
@@ -107,6 +108,17 @@ static void update_pageblock_skip(struct page *page, unsigned long nr_isolated)
 	if (!nr_isolated)
 		set_pageblock_skip(page);
 }
+#else
+static inline bool isolation_suitable(struct compact_control *cc,
+					struct page *page)
+{
+	return true;
+}
+
+static void update_pageblock_skip(struct page *page, unsigned long nr_isolated)
+{
+}
+#endif /* CONFIG_COMPACTION */
 
 static inline bool should_release_lock(spinlock_t *lock)
 {
