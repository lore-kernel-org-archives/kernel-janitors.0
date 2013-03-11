From: Mirsal Ennaime <mirsal@mirsal.fr>
Date: Mon, 11 Mar 2013 19:31:55 +0000
Subject: [PATCH 4/4] drivers: android: binder: Fix compiler warning
Message-Id: <1363030315-10229-5-git-send-email-mirsal@mirsal.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1363030315-10229-1-git-send-email-mirsal@mirsal.fr>
In-Reply-To: <1363030315-10229-1-git-send-email-mirsal@mirsal.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <greg@kroah.com>
Cc: =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Brian Swetland <swetland@google.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Mirsal Ennaime <mirsal@mirsal.fr>

Fix an instance of -Wdeclaration-after-statement

Signed-off-by: Mirsal Ennaime <mirsal@mirsal.fr>
---
 drivers/staging/android/binder.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/android/binder.c b/drivers/staging/android/binder.c
index 18a83e2..c833b53 100644
--- a/drivers/staging/android/binder.c
+++ b/drivers/staging/android/binder.c
@@ -3001,11 +3001,12 @@ static void binder_deferred_release(struct binder_proc *proc)
 	page_count = 0;
 	if (proc->pages) {
 		int i;
+		void *page_addr;
 		for (i = 0; i < proc->buffer_size / PAGE_SIZE; i++) {
 			if (!proc->pages[i])
 				continue;
 
-			void *page_addr = proc->buffer + i * PAGE_SIZE;
+			page_addr = proc->buffer + i * PAGE_SIZE;
 			binder_debug(BINDER_DEBUG_BUFFER_ALLOC,
 				"binder_release: %d: page %d at %p not freed\n",
 				proc->pid, i,
-- 
1.7.10.4

