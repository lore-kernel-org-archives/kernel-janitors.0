From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sat, 29 Mar 2008 13:32:39 +0000
Subject: [PATCH] jiffies.h: Better error message and add "const" where
Message-Id: <alpine.LFD.1.00.0803290930110.20145@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Add a more informative error message for bad values of HZ, and add
"const" argument qualification for a couple routines for which it's
appropriate.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  compile-tested on x86.

 include/linux/jiffies.h |    6 +++---
 kernel/time.c           |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/jiffies.h b/include/linux/jiffies.h
index e0b5b68..07a988f 100644
--- a/include/linux/jiffies.h
+++ b/include/linux/jiffies.h
@@ -36,7 +36,7 @@
 #elif HZ >= 6144 && HZ < 12288
 # define SHIFT_HZ	13
 #else
-# error You lose.
+# error Invalid value of HZ.
 #endif

 /* LATCH is used in the interval timer and ftape setup. */
@@ -277,8 +277,8 @@ extern void jiffies_to_timespec(const unsigned long jiffies,
 extern unsigned long timeval_to_jiffies(const struct timeval *value);
 extern void jiffies_to_timeval(const unsigned long jiffies,
 			       struct timeval *value);
-extern clock_t jiffies_to_clock_t(long x);
-extern unsigned long clock_t_to_jiffies(unsigned long x);
+extern clock_t jiffies_to_clock_t(const long x);
+extern unsigned long clock_t_to_jiffies(const unsigned long x);
 extern u64 jiffies_64_to_clock_t(u64 x);
 extern u64 nsec_to_clock_t(u64 x);

diff --git a/kernel/time.c b/kernel/time.c
index a5ec013..18bf135 100644
--- a/kernel/time.c
+++ b/kernel/time.c
@@ -576,7 +576,7 @@ EXPORT_SYMBOL(jiffies_to_timeval);
 /*
  * Convert jiffies/jiffies_64 to clock_t and back.
  */
-clock_t jiffies_to_clock_t(long x)
+clock_t jiffies_to_clock_t(const long x)
 {
 #if (TICK_NSEC % (NSEC_PER_SEC / USER_HZ)) = 0
 # if HZ < USER_HZ
@@ -592,7 +592,7 @@ clock_t jiffies_to_clock_t(long x)
 }
 EXPORT_SYMBOL(jiffies_to_clock_t);

-unsigned long clock_t_to_jiffies(unsigned long x)
+unsigned long clock_t_to_jiffies(const unsigned long x)
 {
 #if (HZ % USER_HZ)=0
 	if (x >= ~0UL / (HZ / USER_HZ))

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
