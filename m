From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 19:42:50 +0000
Subject: [PATCH 2/3] kernel-sched: Adjust four checks for null pointers
Message-Id: <15f374e1-e55a-93fb-d475-194c34be41c9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ece07743-9bbb-e396-b562-ba161c3eb9b8@users.sourceforge.net>
In-Reply-To: <ece07743-9bbb-e396-b562-ba161c3eb9b8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 21:17:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/sched/debug.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index ff599b7f10b6..4a1abb61d1f7 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -231,7 +231,7 @@ static void sd_free_ctl_entry(struct ctl_table **tablep)
 	for (entry = *tablep; entry->mode; entry++) {
 		if (entry->child)
 			sd_free_ctl_entry(&entry->child);
-		if (entry->proc_handler = NULL)
+		if (!entry->proc_handler)
 			kfree(entry->procname);
 	}
 
@@ -265,7 +265,7 @@ sd_alloc_ctl_domain_table(struct sched_domain *sd)
 {
 	struct ctl_table *table = sd_alloc_ctl_entry(14);
 
-	if (table = NULL)
+	if (!table)
 		return NULL;
 
 	set_table_entry(&table[0], "min_interval", &sd->min_interval,
@@ -311,7 +311,7 @@ static struct ctl_table *sd_alloc_ctl_cpu_table(int cpu)
 	for_each_domain(cpu, sd)
 		domain_num++;
 	entry = table = sd_alloc_ctl_entry(domain_num + 1);
-	if (table = NULL)
+	if (!table)
 		return NULL;
 
 	i = 0;
@@ -336,7 +336,7 @@ void register_sched_domain_sysctl(void)
 	WARN_ON(sd_ctl_dir[0].child);
 	sd_ctl_dir[0].child = entry;
 
-	if (entry = NULL)
+	if (!entry)
 		return;
 
 	for_each_possible_cpu(i) {
-- 
2.12.2

