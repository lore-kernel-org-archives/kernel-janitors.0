From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sun, 20 Apr 2008 11:09:35 +0000
Subject: [PATCH] Generate a slightly more informative error msg for bad HZ.
Message-Id: <alpine.LFD.1.00.0804200708290.6686@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/include/linux/jiffies.h b/include/linux/jiffies.h
index e0b5b68..8f4aa72 100644
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

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
