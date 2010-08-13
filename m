From: Dan Carpenter <error27@gmail.com>
Date: Fri, 13 Aug 2010 20:59:58 +0000
Subject: [patch] kfifo: __must_check helper casts everything to unsigned
Message-Id: <20100813205936.GS645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefani Seibold <stefani@seibold.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@linux.intel.com>, Greg Kroah-Hartman <gregkh@suse.de>, Mauro Carvalho Chehab <mchehab@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a new wrapper to add a __must_check to kfifo macros.  The
problem is that it casts everything to unsigned.  That breaks for places
that check stuff like:

	if (kfifo_alloc(&dlci->_fifo, 4096, GFP_KERNEL) < 0)

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/include/linux/kfifo.h b/include/linux/kfifo.h
index 311f875..437cc0d 100644
--- a/include/linux/kfifo.h
+++ b/include/linux/kfifo.h
@@ -177,6 +177,12 @@ __kfifo_must_check_helper(unsigned int val)
 	return val;
 }
 
+static inline int __must_check
+__kfifo_must_check_helper_signed(int val)
+{
+	return val;
+}
+
 /**
  * kfifo_initialized - Check if the fifo is initialized
  * @fifo: address of the fifo to check
@@ -323,7 +329,7 @@ __kfifo_must_check_helper( \
  * Return 0 if no error, otherwise an error code.
  */
 #define kfifo_alloc(fifo, size, gfp_mask) \
-__kfifo_must_check_helper( \
+__kfifo_must_check_helper_signed( \
 ({ \
 	typeof(fifo + 1) __tmp = (fifo); \
 	struct __kfifo *__kfifo = &__tmp->kfifo; \
@@ -609,7 +615,7 @@ __kfifo_must_check_helper( \
  * writer, you don't need extra locking to use these macro.
  */
 #define	kfifo_from_user(fifo, from, len, copied) \
-__kfifo_must_check_helper( \
+__kfifo_must_check_helper_signed( \
 ({ \
 	typeof(fifo + 1) __tmp = (fifo); \
 	const void __user *__from = (from); \
@@ -637,7 +643,7 @@ __kfifo_must_check_helper( \
  * writer, you don't need extra locking to use these macro.
  */
 #define	kfifo_to_user(fifo, to, len, copied) \
-__kfifo_must_check_helper( \
+__kfifo_must_check_helper_signed( \
 ({ \
 	typeof(fifo + 1) __tmp = (fifo); \
 	void __user *__to = (to); \
