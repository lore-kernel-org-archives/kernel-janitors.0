From: Julia Lawall <julia@diku.dk>
Date: Thu, 14 Feb 2008 15:14:33 +0000
Subject: [PATCH 2/6] fs/direct-io.c: Use DIV_ROUND_UP
Message-Id: <Pine.LNX.4.58.0802141614050.1185@pc-041.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The kernel.h macro DIV_ROUND_UP performs the computation (((n) + (d) - 1) /
(d)) but is perhaps more readable.

An extract of the semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@haskernel@
@@

#include <linux/kernel.h>

@depends on haskernel@
expression n,d;
@@

(
- (n + d - 1) / d
+ DIV_ROUND_UP(n,d)
|
- (n + (d - 1)) / d
+ DIV_ROUND_UP(n,d)
)

@depends on haskernel@
expression n,d;
@@

- DIV_ROUND_UP((n),d)
+ DIV_ROUND_UP(n,d)

@depends on haskernel@
expression n,d;
@@

- DIV_ROUND_UP(n,(d))
+ DIV_ROUND_UP(n,d)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/fs/direct-io.c b/fs/direct-io.c
--- a/fs/direct-io.c 2008-02-08 08:58:17.000000000 +0100
+++ b/fs/direct-io.c 2008-02-13 20:58:53.000000000 +0100
@@ -976,7 +976,7 @@ direct_io_worker(int rw, struct kiocb *i
 	for (seg = 0; seg < nr_segs; seg++) {
 		user_addr = (unsigned long)iov[seg].iov_base;
 		dio->pages_in_io +-			((user_addr+iov[seg].iov_len +PAGE_SIZE-1)/PAGE_SIZE
+			(DIV_ROUND_UP(user_addr + iov[seg].iov_len, PAGE_SIZE)
 				- user_addr/PAGE_SIZE);
 	}

@@ -998,7 +998,7 @@ direct_io_worker(int rw, struct kiocb *i
 			dio->total_pages++;
 			bytes -= PAGE_SIZE - (user_addr & (PAGE_SIZE - 1));
 		}
-		dio->total_pages += (bytes + PAGE_SIZE - 1) / PAGE_SIZE;
+		dio->total_pages += DIV_ROUND_UP(bytes, PAGE_SIZE);
 		dio->curr_user_address = user_addr;

 		ret = do_direct_IO(dio);
