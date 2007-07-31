From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 18:22:54 +0000
Subject: [PATCH 42] fs/jbd2/journal.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707312022.54957.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, sct@redhat.com

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 fs/jbd2/journal.c | 66771 -> 66719 (-52 bytes)
 fs/jbd2/journal.o | 199193 -> 199049 (-144 bytes)

 fs/jbd2/journal.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

--- linux-2.6.23-rc1-mm1-a/fs/jbd2/journal.c	2007-07-26 13:07:46.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/fs/jbd2/journal.c	2007-07-31 14:55:12.000000000 +0200
@@ -929,17 +929,16 @@ static void journal_init_stats(journal_t
 {
 	int size;

-	if (proc_jbd2_stats = NULL)
+	if (!proc_jbd2_stats)
 		return;

 	journal->j_history_max = 100;
 	size = sizeof(struct transaction_stats_s) * journal->j_history_max;
-	journal->j_history = kmalloc(size, GFP_KERNEL);
-	if (journal->j_history = NULL) {
+	journal->j_history = kzalloc(size, GFP_KERNEL);
+	if (!journal->j_history) {
 		journal->j_history_max = 0;
 		return;
 	}
-	memset(journal->j_history, 0, size);
 	spin_lock_init(&journal->j_history_lock);
 }

