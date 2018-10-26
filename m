From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Oct 2018 18:02:47 +0000
Subject: [PATCH] um: trap: fix spelling mistake, EACCESS -> EACCES
Message-Id: <20181026180247.4765-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, linux-um@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to a spelling mistake of the error access name EACCESS,
rename to EACCES

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/um/kernel/trap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/um/kernel/trap.c b/arch/um/kernel/trap.c
index cced82946042..0e8b6158f224 100644
--- a/arch/um/kernel/trap.c
+++ b/arch/um/kernel/trap.c
@@ -19,7 +19,7 @@
 #include <skas.h>
 
 /*
- * Note this is constrained to return 0, -EFAULT, -EACCESS, -ENOMEM by
+ * Note this is constrained to return 0, -EFAULT, -EACCES, -ENOMEM by
  * segv().
  */
 int handle_page_fault(unsigned long address, unsigned long ip,
-- 
2.19.1
