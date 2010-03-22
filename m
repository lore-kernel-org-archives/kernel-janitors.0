From: Dan Carpenter <error27@gmail.com>
Date: Mon, 22 Mar 2010 12:05:09 +0000
Subject: [patch] kcore: fix test for end of list
Message-Id: <20100322120509.GC21571@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, WANG Cong <xiyou.wangcong@gmail.com>, Jiri Slaby <jirislaby@gmail.com>, Jaswinder Singh Rajput <jaswinderrajput@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"m" is never NULL here.  We need a different test for the end of list
condition.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Found with a static checker and compile tested only.  Please review
carefully.

diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
index a44a789..b442dac 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -490,7 +490,7 @@ read_kcore(struct file *file, char __user *buffer, size_t buflen, loff_t *fpos)
 		}
 		read_unlock(&kclist_lock);
 
-		if (m = NULL) {
+		if (&m->list = &kclist_head) {
 			if (clear_user(buffer, tsz))
 				return -EFAULT;
 		} else if (is_vmalloc_or_module_addr((void *)start)) {
