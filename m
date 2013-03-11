From: Mirsal Ennaime <mirsal@mirsal.fr>
Date: Mon, 11 Mar 2013 19:31:54 +0000
Subject: [PATCH 3/4] drivers: android: binder: Remove excessive indentation
Message-Id: <1363030315-10229-4-git-send-email-mirsal@mirsal.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1363030315-10229-1-git-send-email-mirsal@mirsal.fr>
In-Reply-To: <1363030315-10229-1-git-send-email-mirsal@mirsal.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Brian Swetland <swetland@google.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Mirsal Ennaime <mirsal@mirsal.fr>

Remove one level of indentation from the binder proc page release code
by using slightly different control semantics.

This is a cosmetic patch which removes checkpatch "80-columns" warnings

Signed-off-by: Mirsal Ennaime <mirsal@mirsal.fr>
---
 drivers/staging/android/binder.c |   24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/android/binder.c b/drivers/staging/android/binder.c
index 49cc573..18a83e2 100644
--- a/drivers/staging/android/binder.c
+++ b/drivers/staging/android/binder.c
@@ -3002,18 +3002,20 @@ static void binder_deferred_release(struct binder_proc *proc)
 	if (proc->pages) {
 		int i;
 		for (i = 0; i < proc->buffer_size / PAGE_SIZE; i++) {
-			if (proc->pages[i]) {
-				void *page_addr = proc->buffer + i * PAGE_SIZE;
-				binder_debug(BINDER_DEBUG_BUFFER_ALLOC,
-					"binder_release: %d: page %d at %p not freed\n",
-					proc->pid, i,
-					page_addr);
-				unmap_kernel_range((unsigned long)page_addr,
-					PAGE_SIZE);
-				__free_page(proc->pages[i]);
-				page_count++;
-			}
+			if (!proc->pages[i])
+				continue;
+
+			void *page_addr = proc->buffer + i * PAGE_SIZE;
+			binder_debug(BINDER_DEBUG_BUFFER_ALLOC,
+				"binder_release: %d: page %d at %p not freed\n",
+				proc->pid, i,
+				page_addr);
+			unmap_kernel_range((unsigned long)page_addr,
+				PAGE_SIZE);
+			__free_page(proc->pages[i]);
+			page_count++;
 		}
+
 		kfree(proc->pages);
 		vfree(proc->buffer);
 	}
-- 
1.7.10.4

