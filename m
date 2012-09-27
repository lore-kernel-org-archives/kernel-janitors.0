From: Mel Gorman <mgorman@suse.de>
Date: Thu, 27 Sep 2012 10:50:10 +0000
Subject: [PATCH] mm: compaction: Restart compaction from near where it left off -fix
Message-Id: <20120927105010.GA3429@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu reported the following

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mhocko/mm.git since-3.5
head:   a1e6f861ce9bd58373728fe2de149eaf766238ae
commit: c5e47c8e10f4f45effb589de310b124b4c8cd501 [192/198] mm-compaction-cache-if-a-pageblock-was-scanned-and-no-pages-were-isolated-fix
config: i386-randconfig-b083 (attached as .config)

All error/warnings:

mm/compaction.c: In function 'isolate_freepages_block':
mm/compaction.c:346:3: warning: passing argument 1 of 'update_pageblock_skip' from incompatible pointer type [enabled by default]
mm/compaction.c:137:13: note: expected 'struct page *' but argument is of type 'struct compact_control *'
mm/compaction.c:346:3: warning: passing argument 2 of 'update_pageblock_skip' makes integer from pointer without a cast [enabled by default]
mm/compaction.c:137:13: note: expected 'long unsigned int' but argument is of type 'struct page *'
mm/compaction.c:346:3: error: too many arguments to function 'update_pageblock_skip'
mm/compaction.c:137:13: note: declared here
mm/compaction.c: In function 'isolate_migratepages_range':
mm/compaction.c:639:3: warning: passing argument 1 of 'update_pageblock_skip' from incompatible pointer type [enabled by default]
mm/compaction.c:137:13: note: expected 'struct page *' but argument is of type 'struct compact_control *'
mm/compaction.c:639:3: warning: passing argument 2 of 'update_pageblock_skip' makes integer from pointer without a cast [enabled by default]
mm/compaction.c:137:13: note: expected 'long unsigned int' but argument is of type 'struct page *'
mm/compaction.c:639:3: error: too many arguments to function 'update_pageblock_skip'
mm/compaction.c:137:13: note: declared here
mm/compaction.c: At top level:
mm/compaction.c:206:13: warning: 'compact_capture_page' defined but not used [-Wunused-function]

This is a fix for
mm-compaction-restart-compaction-from-near-where-it-left-off.patch that
became necessary after
mm-compaction-cache-if-a-pageblock-was-scanned-and-no-pages-were-isolated-fix
was merged but I missed the follow-up.

Signed-off-by: Mel Gorman <mgorman@suse.de>
---
 mm/compaction.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index ae8f69a..55d0999 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -137,7 +137,9 @@ static inline bool isolation_suitable(struct compact_control *cc,
 	return true;
 }
 
-static void update_pageblock_skip(struct page *page, unsigned long nr_isolated)
+static void update_pageblock_skip(struct compact_control *cc,
+			struct page *page, unsigned long nr_isolated,
+			bool migrate_scanner)
 {
 }
 #endif /* CONFIG_COMPACTION */
