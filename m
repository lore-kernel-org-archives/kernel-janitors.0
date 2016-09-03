From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Sep 2016 20:40:41 +0000
Subject: [PATCH] unicore32-pm: Use kmalloc_array() in puv3_pm_init()
Message-Id: <b1251c72-da1b-892a-355d-4e757cdaef2a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 3 Sep 2016 22:34:32 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/unicore32/kernel/pm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/unicore32/kernel/pm.c b/arch/unicore32/kernel/pm.c
index 784bc2d..f5455a9 100644
--- a/arch/unicore32/kernel/pm.c
+++ b/arch/unicore32/kernel/pm.c
@@ -109,8 +109,9 @@ static int __init puv3_pm_init(void)
 		return -EINVAL;
 	}
 
-	sleep_save = kmalloc(puv3_cpu_pm_fns->save_count
-				* sizeof(unsigned long), GFP_KERNEL);
+	sleep_save = kmalloc_array(puv3_cpu_pm_fns->save_count,
+				   sizeof(*sleep_save),
+				   GFP_KERNEL);
 	if (!sleep_save) {
 		printk(KERN_ERR "failed to alloc memory for pm save\n");
 		return -ENOMEM;
-- 
2.9.3

