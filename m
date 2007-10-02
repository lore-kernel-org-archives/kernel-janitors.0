From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 02 Oct 2007 18:27:11 +0000
Subject: [PATCH] LIB: Replace inappropriate include of <linux/bug.h>
Message-Id: <Pine.LNX.4.64.0710021424450.983@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Replace an irrelevant include of bug.h with the more appropriate
includes of slab.h and module.h.

Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

  it's not as if the original inclusion is an error, it's simply not
related to the contents of that source file, while the other two are.

  compile-tested on i386.


diff --git a/lib/argv_split.c b/lib/argv_split.c
index 4096ed4..8eada37 100644
--- a/lib/argv_split.c
+++ b/lib/argv_split.c
@@ -4,7 +4,8 @@

 #include <linux/kernel.h>
 #include <linux/ctype.h>
-#include <linux/bug.h>
+#include <linux/slab.h>
+#include <linux/module.h>

 static const char *skip_sep(const char *cp)
 {
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
