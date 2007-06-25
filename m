From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 25 Jun 2007 11:31:25 +0000
Subject: [KJ] [PATCH] Replace hard-coded constant with appropriate macro from
Message-Id: <Pine.LNX.4.64.0706250729480.4168@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

  given that kernel.h defines:

#define LONG_MAX        ((long)(~0UL>>1))

it seems silly to use a hard-coded constant.  (i'm guessing there
might be a lot of this happening in the tree.)

diff --git a/include/asm-i386/uaccess.h b/include/asm-i386/uaccess.h
index e2aa5e0..d2a4f7b 100644
--- a/include/asm-i386/uaccess.h
+++ b/include/asm-i386/uaccess.h
@@ -581,7 +581,7 @@ long __must_check __strncpy_from_user(char *dst,
  * If there is a limit on the length of a valid string, you may wish to
  * consider using strnlen_user() instead.
  */
-#define strlen_user(str) strnlen_user(str, ~0UL >> 1)
+#define strlen_user(str) strnlen_user(str, LONG_MAX)

 long strnlen_user(const char __user *str, long n);
 unsigned long __must_check clear_user(void __user *mem, unsigned long len);
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
