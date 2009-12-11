From: Adam Buchbinder <adam.buchbinder@gmail.com>
Date: Fri, 11 Dec 2009 21:35:40 +0000
Subject: [PATCH 08/10] Fix misspellings of "invocation" in comments.
Message-Id: <1260567342-8327-9-git-send-email-adam.buchbinder@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Some comments misspell "invocation"; this fixes them. No code
changes.

Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
---
 drivers/staging/wlan-ng/hfa384x_usb.c |    2 +-
 fs/buffer.c                           |    2 +-
 fs/mpage.c                            |    2 +-
 include/linux/mmzone.h                |    2 +-
 kernel/sched_cpupri.c                 |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/wlan-ng/hfa384x_usb.c b/drivers/staging/wlan-ng/hfa384x_usb.c
index 925678b..c6a9e17 100644
--- a/drivers/staging/wlan-ng/hfa384x_usb.c
+++ b/drivers/staging/wlan-ng/hfa384x_usb.c
@@ -52,7 +52,7 @@
 * around the register accesses.  The next higher level represents C-callable
 * prism2 API functions that match the Intersil documentation as closely
 * as is reasonable.  The next higher layer implements common sequences
-* of invokations of the API layer (e.g. write to bap, followed by cmd).
+* of invocations of the API layer (e.g. write to bap, followed by cmd).
 *
 * Common sequences:
 * hfa384x_drvr_xxx	Highest level abstractions provided by the
diff --git a/fs/buffer.c b/fs/buffer.c
index 6fa5302..1d920ba 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2893,7 +2893,7 @@ int block_write_full_page_endio(struct page *page, get_block_t *get_block,
 
 	/*
 	 * The page straddles i_size.  It must be zeroed out on each and every
-	 * writepage invokation because it may be mmapped.  "A file is mapped
+	 * writepage invocation because it may be mmapped.  "A file is mapped
 	 * in multiples of the page size.  For a file that is not a multiple of
 	 * the  page size, the remaining memory is zeroed when mapped, and
 	 * writes to that region are not written out to the file."
diff --git a/fs/mpage.c b/fs/mpage.c
index 42381bd..598d54e 100644
--- a/fs/mpage.c
+++ b/fs/mpage.c
@@ -561,7 +561,7 @@ page_is_mapped:
 	if (page->index >= end_index) {
 		/*
 		 * The page straddles i_size.  It must be zeroed out on each
-		 * and every writepage invokation because it may be mmapped.
+		 * and every writepage invocation because it may be mmapped.
 		 * "A file is mapped in multiples of the page size.  For a file
 		 * that is not a multiple of the page size, the remaining memory
 		 * is zeroed when mapped, and writes to that region are not
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 6f75617..c92ea75 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -349,7 +349,7 @@ struct zone {
 	 * prev_priority holds the scanning priority for this zone.  It is
 	 * defined as the scanning priority at which we achieved our reclaim
 	 * target at the previous try_to_free_pages() or balance_pgdat()
-	 * invokation.
+	 * invocation.
 	 *
 	 * We use prev_priority as a measure of how much stress page reclaim is
 	 * under - it drives the swappiness decision: whether to unmap mapped
diff --git a/kernel/sched_cpupri.c b/kernel/sched_cpupri.c
index 0f052fc..9777bf6 100644
--- a/kernel/sched_cpupri.c
+++ b/kernel/sched_cpupri.c
@@ -58,7 +58,7 @@ static int convert_prio(int prio)
  * @lowest_mask: A mask to fill in with selected CPUs (or NULL)
  *
  * Note: This function returns the recommended CPUs as calculated during the
- * current invokation.  By the time the call returns, the CPUs may have in
+ * current invocation.  By the time the call returns, the CPUs may have in
  * fact changed priorities any number of times.  While not ideal, it is not
  * an issue of correctness since the normal rebalancer logic will correct
  * any discrepancies created by racing against the uncertainty of the current
-- 
1.6.3.3

