From: Chase Venters <chase.venters@clientec.com>
Date: Mon, 16 Oct 2006 18:43:09 +0000
Subject: [KJ] [PATCH 2.6.19-rc2] jiffies.h comment fix (volatile -> atomic)
Message-Id: <Pine.LNX.4.64.0610161339500.17664@turbotaz.ourhouse>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

jiffies.h warns about accessing jiffies_64 without sampling the seqlock 
but calls the value "not volatile" instead of "not atomic". This patch 
corrects the comment.

Signed-off-by: Chase Venters <chase.venters@clientec.com>

diff --git a/include/linux/jiffies.h b/include/linux/jiffies.h
index c8d5f20..0ec6e28 100644
--- a/include/linux/jiffies.h
+++ b/include/linux/jiffies.h
@@ -74,7 +74,7 @@ #define TICK_USEC_TO_NSEC(TUSEC) (SH_DIV
  #define __jiffy_data  __attribute__((section(".data")))

  /*
- * The 64-bit value is not volatile - you MUST NOT read it
+ * The 64-bit value is not atomic - you MUST NOT read it
   * without sampling the sequence number in xtime_lock.
   * get_jiffies_64() will do this for you as appropriate.
   */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
