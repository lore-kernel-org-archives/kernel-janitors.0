From: David Howells <dhowells@redhat.com>
Date: Thu, 27 Nov 2008 15:12:38 +0000
Subject: [PATCH] FRV: Fix mmap2 error handling
Message-Id: <20081127151238.13728.34704.stgit@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: torvalds@osdl.org, akpm@linux-foundation.org, julia@diku.dk
Cc: dhowells@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix the error handling in sys_mmap2().  Currently, if the pgoff check fails,
fput() might have to be called (which it isn't), so do the pgoff check first,
before fget() is called.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 arch/frv/kernel/sys_frv.c |   17 ++++++++---------
 1 files changed, 8 insertions(+), 9 deletions(-)


diff --git a/arch/frv/kernel/sys_frv.c b/arch/frv/kernel/sys_frv.c
index 49b2cf2..baadc97 100644
--- a/arch/frv/kernel/sys_frv.c
+++ b/arch/frv/kernel/sys_frv.c
@@ -35,22 +35,21 @@ asmlinkage long sys_mmap2(unsigned long addr, unsigned long len,
 	int error = -EBADF;
 	struct file * file = NULL;
 
-	flags &= ~(MAP_EXECUTABLE | MAP_DENYWRITE);
-	if (!(flags & MAP_ANONYMOUS)) {
-		file = fget(fd);
-		if (!file)
-			goto out;
-	}
-
 	/* As with sparc32, make sure the shift for mmap2 is constant
 	   (12), no matter what PAGE_SIZE we have.... */
 
 	/* But unlike sparc32, don't just silently break if we're
 	   trying to map something we can't */
-	if (pgoff & ((1<<(PAGE_SHIFT-12))-1))
+	if (pgoff & ((1 << (PAGE_SHIFT - 12)) - 1))
 		return -EINVAL;
+	pgoff >>= PAGE_SHIFT - 12;
 
-	pgoff >>= (PAGE_SHIFT - 12);
+	flags &= ~(MAP_EXECUTABLE | MAP_DENYWRITE);
+	if (!(flags & MAP_ANONYMOUS)) {
+		file = fget(fd);
+		if (!file)
+			goto out;
+	}
 
 	down_write(&current->mm->mmap_sem);
 	error = do_mmap_pgoff(file, addr, len, prot, flags, pgoff);

