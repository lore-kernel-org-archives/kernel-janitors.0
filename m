From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 03 May 2017 20:42:03 +0000
Subject: [PATCH 6/6] lockdep: Add spaces for better code readability
Message-Id: <b2b41c17-d187-878d-2f97-42cd6d923d3f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3f95acb5-c037-b6fa-7a9b-258b4ae465fb@users.sourceforge.net>
In-Reply-To: <3f95acb5-c037-b6fa-7a9b-258b4ae465fb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 3 May 2017 22:11:28 +0200

Use space characters at some source code places according to
the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/locking/lockdep_proc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/locking/lockdep_proc.c b/kernel/locking/lockdep_proc.c
index 509a17f5ea01..22c89868e6b1 100644
--- a/kernel/locking/lockdep_proc.c
+++ b/kernel/locking/lockdep_proc.c
@@ -402,7 +402,7 @@ static void snprint_time(char *buf, size_t bufsiz, s64 nr)
 
 	nr += 5; /* for display rounding */
 	div = div_s64_rem(nr, 1000, &rem);
-	snprintf(buf, bufsiz, "%lld.%02d", (long long)div, (int)rem/10);
+	snprintf(buf, bufsiz, "%lld.%02d", (long long)div, (int)rem / 10);
 }
 
 static void seq_time(struct seq_file *m, s64 time)
@@ -461,11 +461,11 @@ static void seq_stats(struct seq_file *m, struct lock_stat_data *data)
 
 	namelen = strlen(name);
 	if (class->name_version > 1) {
-		snprintf(name+namelen, 3, "#%d", class->name_version);
+		snprintf(name + namelen, 3, "#%d", class->name_version);
 		namelen += 2;
 	}
 	if (class->subclass) {
-		snprintf(name+namelen, 3, "/%d", class->subclass);
+		snprintf(name + namelen, 3, "/%d", class->subclass);
 		namelen += 2;
 	}
 
@@ -504,7 +504,7 @@ static void seq_stats(struct seq_file *m, struct lock_stat_data *data)
 			break;
 
 		if (!i)
-			seq_line(m, '-', 40-namelen, namelen);
+			seq_line(m, '-', 40 - namelen, namelen);
 
 		snprintf(ip, sizeof(ip), "[<%p>]",
 				(void *)class->contention_point[i]);
@@ -519,7 +519,7 @@ static void seq_stats(struct seq_file *m, struct lock_stat_data *data)
 			break;
 
 		if (!i)
-			seq_line(m, '-', 40-namelen, namelen);
+			seq_line(m, '-', 40 - namelen, namelen);
 
 		snprintf(ip, sizeof(ip), "[<%p>]",
 				(void *)class->contending_point[i]);
-- 
2.12.2

