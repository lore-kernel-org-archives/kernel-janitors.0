From: "Luis G.F" <luisgf@gmail.com>
Date: Tue, 04 Sep 2012 08:43:27 +0000
Subject: [PATCH 1/1] mm: Fix unused function warnings in vmstat.c
Message-Id: <CAHve1mzC+x=z5L4-74EYhAmi7Jqc-XqD7u5yRctbHwgKVyO2dA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

frag_start(), frag_next(), frag_stop(), walk_zones_in_node() throws
compilation warnings (-Wunused-function) even when are currently used.

This patchs fix the compilation warnings in vmstat.c

Signed-off-by: Luis Gonzalez Fernandez <luisgf@gmail.com>
---
 mm/vmstat.c |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/mm/vmstat.c b/mm/vmstat.c
index df7a674..e8f7dbd 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -619,7 +619,8 @@ static char * const migratetype_names[MIGRATE_TYPES] = {
 	"Isolate",
 };

-static void *frag_start(struct seq_file *m, loff_t *pos)
+static void __attribute__((unused)) *frag_start(struct seq_file *m,
+							loff_t *pos)
 {
 	pg_data_t *pgdat;
 	loff_t node = *pos;
@@ -631,7 +632,8 @@ static void *frag_start(struct seq_file *m, loff_t *pos)
 	return pgdat;
 }

-static void *frag_next(struct seq_file *m, void *arg, loff_t *pos)
+static void __attribute__((unused)) *frag_next(struct seq_file *m,
+						void *arg, loff_t *pos)
 {
 	pg_data_t *pgdat = (pg_data_t *)arg;

@@ -639,12 +641,13 @@ static void *frag_next(struct seq_file *m, void
*arg, loff_t *pos)
 	return next_online_pgdat(pgdat);
 }

-static void frag_stop(struct seq_file *m, void *arg)
+static void __attribute__((unused)) frag_stop(struct seq_file *m, void *arg)
 {
 }

 /* Walk all the zones in a node and print using a callback */
-static void walk_zones_in_node(struct seq_file *m, pg_data_t *pgdat,
+static void __attribute__((unused)) walk_zones_in_node(struct seq_file *m,
+							pg_data_t *pgdat,
 		void (*print)(struct seq_file *m, pg_data_t *, struct zone *))
 {
 	struct zone *zone;
-- 
1.7.9.5
