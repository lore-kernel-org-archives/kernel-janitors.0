From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 07 Nov 2007 08:03:39 +0000
Subject: [PATCH] use "is_power_of_2()" macro for simplicity.
Message-Id: <Pine.LNX.4.64.0711070301540.8914@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  this source file already includes log2.h for other power-of-2
operations, so might as well finish off the job.


diff --git a/kernel/kfifo.c b/kernel/kfifo.c
index bc41ad0..04a1748 100644
--- a/kernel/kfifo.c
+++ b/kernel/kfifo.c
@@ -74,7 +74,7 @@ struct kfifo *kfifo_alloc(unsigned int size, gfp_t gfp_mask, spinlock_t *lock)
 	 * round up to the next power of 2, since our 'let the indices
 	 * wrap' tachnique works only in this case.
 	 */
-	if (size & (size - 1)) {
+	if (!is_power_of_2(size)) {
 		BUG_ON(size > 0x80000000);
 		size = roundup_pow_of_two(size);
 	}
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
