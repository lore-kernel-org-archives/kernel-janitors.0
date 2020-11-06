From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 06 Nov 2020 03:40:05 +0000
Subject: [PATCH] printk: remove unneeded dead-store assignment
Message-Id: <20201106034005.18822-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech, Lukas Bulwahn <lukas.bulwahn@gmail.com>

make clang-analyzer on x86_64 defconfig caught my attention with:

  kernel/printk/printk_ringbuffer.c:885:3: warning:
  Value stored to 'desc' is never read [clang-analyzer-deadcode.DeadStores]
                desc = to_desc(desc_ring, head_id);
                ^

Commit b6cf8b3f3312 ("printk: add lockless ringbuffer") introduced
desc_reserve() with this unneeded dead-store assignment.

As discussed with John Ogness privately, this is probably just some minor
left-over from previous iterations of the ringbuffer implementation. So,
simply remove this unneeded dead assignment to make clang-analyzer happy.

As compilers will detect this unneeded assignment and optimize this anyway,
the resulting object code is identical before and after this change.

No functional change. No change to object code.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20201105

John, please ack.
Petr, please pick this minor non-urgent clean-up patch.

 kernel/printk/printk_ringbuffer.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 6b1525685277..74e25a1704f2 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -882,8 +882,6 @@ static bool desc_reserve(struct printk_ringbuffer *rb, unsigned long *id_out)
 	head_id = atomic_long_read(&desc_ring->head_id); /* LMM(desc_reserve:A) */
 
 	do {
-		desc = to_desc(desc_ring, head_id);
-
 		id = DESC_ID(head_id + 1);
 		id_prev_wrap = DESC_ID_PREV_WRAP(desc_ring, id);
 
-- 
2.17.1
