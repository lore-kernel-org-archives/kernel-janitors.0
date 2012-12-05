From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Dec 2012 17:01:24 +0000
Subject: [patch v2] vfs: clear to the end of the buffer on reads
Message-Id: <20121205170124.GA21549@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CA+55aFyCuepCzYq4zsLJyMO0yKzb=jD0-zv9zG6RyFYABOGe5w@mail.gmail.com>
In-Reply-To: <CA+55aFyCuepCzYq4zsLJyMO0yKzb=jD0-zv9zG6RyFYABOGe5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, Romain Francoise <romain@orebokech.com>, Meelis Roos <mroos@linux.ee>, Tony Luck <tony.luck@intel.com>

READ is zero so this test is always false.  If ((rw & RW_MASK) = READ)
was intended.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: I didn't mask out the other flags in the first version

diff --git a/fs/buffer.c b/fs/buffer.c
index 70ed4d8..e0a59c6 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -2931,7 +2931,7 @@ static void guard_bh_eod(int rw, struct bio *bio, struct buffer_head *bh)
 	bio->bi_io_vec[0].bv_len = bytes;
 
 	/* ..and clear the end of the buffer for reads */
-	if (rw & READ) {
+	if ((rw & RW_MASK) = READ) {
 		void *kaddr = kmap_atomic(bh->b_page);
 		memset(kaddr + bh_offset(bh) + bytes, 0, bh->b_size - bytes);
 		kunmap_atomic(kaddr);

