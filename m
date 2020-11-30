From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 30 Nov 2020 12:49:15 +0000
Subject: [PATCH] printk: remove obsolete dead assignment
Message-Id: <20201130124915.7573-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 849f3127bb46 ("switch /dev/kmsg to ->write_iter()") refactored
devkmsg_write() and left over a dead assignment on the variable 'len'.

Hence, make clang-analyzer warns:

  kernel/printk/printk.c:744:4: warning: Value stored to 'len' is never read
    [clang-analyzer-deadcode.DeadStores]
                          len -= endp - line;
                          ^

Simply remove this obsolete dead assignment here.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201130

Petr, please pick this minor non-urgent clean-up patch.

 kernel/printk/printk.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index f279d4fbd9dd..6e4e38b7cd91 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -741,7 +741,6 @@ static ssize_t devkmsg_write(struct kiocb *iocb, struct iov_iter *from)
 			if (LOG_FACILITY(u) != 0)
 				facility = LOG_FACILITY(u);
 			endp++;
-			len -= endp - line;
 			line = endp;
 		}
 	}
-- 
2.17.1
