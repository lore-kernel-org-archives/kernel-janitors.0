From: Dan Carpenter <error27@gmail.com>
Date: Tue, 06 Apr 2010 10:45:39 +0000
Subject: [patch] proc: copy_to_user() returns unsigned
Message-Id: <20100406104539.GC21229@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Minchan Kim <minchan.kim@gmail.com>, Matt Mackall <mpm@selenic.com>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

copy_to_user() returns the number of bytes left to be copied.

This was a typo from: d82ef020cf31504c816803b1def94eb5ff173363
"proc: pagemap: Hold mmap_sem during page walk".

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 0962739..bfb2773 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -799,7 +799,7 @@ static ssize_t pagemap_read(struct file *file, char __user *buf,
 		start_vaddr = end;
 
 		len = min(count, PM_ENTRY_BYTES * pm.pos);
-		if (copy_to_user(buf, pm.buffer, len) < 0) {
+		if (copy_to_user(buf, pm.buffer, len)) {
 			ret = -EFAULT;
 			goto out_free;
 		}
