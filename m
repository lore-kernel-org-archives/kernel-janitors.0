From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jul 2019 17:50:20 +0000
Subject: [PATCH] locking/lockdep: Replace two seq_printf() calls by seq_puts() in print_name()
Message-Id: <f842ca82-b9f1-6aa6-7868-6b6e8c6b0f76@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 Jul 2019 19:45:26 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function “seq_puts”.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/locking/lockdep_proc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/locking/lockdep_proc.c b/kernel/locking/lockdep_proc.c
index 9c49ec645d8b..5bc9187e6246 100644
--- a/kernel/locking/lockdep_proc.c
+++ b/kernel/locking/lockdep_proc.c
@@ -45,9 +45,9 @@ static void print_name(struct seq_file *m, struct lock_class *class)

 	if (!name) {
 		name = __get_key_name(class->key, str);
-		seq_printf(m, "%s", name);
+		seq_puts(m, name);
 	} else{
-		seq_printf(m, "%s", name);
+		seq_puts(m, name);
 		if (class->name_version > 1)
 			seq_printf(m, "#%d", class->name_version);
 		if (class->subclass)
--
2.22.0
