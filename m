From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 09 Jan 2018 12:42:19 +0000
Subject: [PATCH] misc/lkdtm_usercopy: Delete an error message for a failed memory allocation in do_usercopy_h
Message-Id: <4e1e5a7a-3c92-24b3-18fc-081638ad083a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 9 Jan 2018 13:31:43 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/lkdtm_usercopy.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/misc/lkdtm_usercopy.c b/drivers/misc/lkdtm_usercopy.c
index 9725aed305bb..ed50c1db4f87 100644
--- a/drivers/misc/lkdtm_usercopy.c
+++ b/drivers/misc/lkdtm_usercopy.c
@@ -202,10 +202,8 @@ static void do_usercopy_heap_whitelist(bool to_user)
 	 * Allocate a buffer with a whitelisted window in the buffer.
 	 */
 	buf = kmem_cache_alloc(whitelist_cache, GFP_KERNEL);
-	if (!buf) {
-		pr_warn("Failed to allocate buffer from whitelist cache\n");
+	if (!buf)
 		goto free_alloc;
-	}
 
 	/* Allocate user memory we'll poke at. */
 	user_alloc = vm_mmap(NULL, 0, PAGE_SIZE,
-- 
2.15.1

