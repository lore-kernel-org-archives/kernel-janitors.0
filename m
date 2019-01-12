From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 12 Jan 2019 05:54:30 +0000
Subject: [PATCH] fs: drop unused fput_atomic definition
Message-Id: <20190112055430.5860-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Elena Reshetova <elena.reshetova@intel.com>, Krystian Radlak <kradlak@exida.com>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

commit d7065da03822 ("get rid of the magic around f_count in aio") added
fput_atomic to include/linux/fs.h, motivated by its use in __aio_put_req()
in fs/aio.c.

Later, commit 3ffa3c0e3f6e ("aio: now fput() is OK from interrupt context;
get rid of manual delayed __fput()") removed the only use of fput_atomic
in __aio_put_req(), but did not remove the since then unused fput_atomic
definition in include/linux/fs.h.

We curate this now and finally remove the unused definition.

This issue was identified during a code review due to a coccinelle warning
from the atomic_as_refcounter.cocci rule pointing to the use of atomic_t
in fput_atomic.

Suggested-by: Krystian Radlak <kradlak@exida.com>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
compile-tested with defconfig & allyesconfig on v4.20

 include/linux/fs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 811c77743dad..ddf7de4d522b 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -952,7 +952,6 @@ static inline struct file *get_file(struct file *f)
 	return f;
 }
 #define get_file_rcu(x) atomic_long_inc_not_zero(&(x)->f_count)
-#define fput_atomic(x)	atomic_long_add_unless(&(x)->f_count, -1, 1)
 #define file_count(x)	atomic_long_read(&(x)->f_count)
 
 #define	MAX_NON_LFS	((1UL<<31) - 1)
-- 
2.17.1
