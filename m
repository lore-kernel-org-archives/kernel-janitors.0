From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 11 Apr 2019 03:53:52 +0000
Subject: [PATCH RESEND] fs: drop unused fput_atomic definition
Message-Id: <20190411035352.19407-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>
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
v1:
  - sent on 2018-01-12, got no response
    https://lore.kernel.org/lkml/20190112055430.5860-1-lukas.bulwahn@gmail.com/

v1 resend:
  - rebased to v5.1-rc4

  - added Jens to recipient list as he touched the place lately closeby
    in commit 091141a42e15 ("fs: add fget_many() and fput_many()")

  - compile-tested with defconfig on v5.1-rc4 and next-20190410


 include/linux/fs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index dd28e7679089..79b2f43b945d 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -969,7 +969,6 @@ static inline struct file *get_file(struct file *f)
 #define get_file_rcu_many(x, cnt)	\
 	atomic_long_add_unless(&(x)->f_count, (cnt), 0)
 #define get_file_rcu(x) get_file_rcu_many((x), 1)
-#define fput_atomic(x)	atomic_long_add_unless(&(x)->f_count, -1, 1)
 #define file_count(x)	atomic_long_read(&(x)->f_count)
 
 #define	MAX_NON_LFS	((1UL<<31) - 1)
-- 
2.17.1
