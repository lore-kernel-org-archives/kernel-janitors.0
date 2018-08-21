From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 21 Aug 2018 13:34:24 +0000
Subject: [PATCH] kernel: remove duplicated include from sys.c
Message-Id: <20180821133424.18716-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wolffhardt.schwabe@fau.de, Dave.Martin@arm.com, yang.shi@linux.alibaba.com, gregkh@linuxfoundation.org, keescook@chromium.org, arnd@arndb.de, tglx@linutronix.de, akpm@linux-foundation.org, linux@dominikbrodowski.net, gorcunov@gmail.com, kstewart@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 kernel/sys.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/sys.c b/kernel/sys.c
index 45dc552..d0281b5 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -71,9 +71,6 @@
 #include <asm/io.h>
 #include <asm/unistd.h>
 
-/* Hardening for Spectre-v1 */
-#include <linux/nospec.h>
-
 #include "uid16.h"
 
 #ifndef SET_UNALIGN_CTL
-- 
2.7.0
