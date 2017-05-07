From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 May 2017 19:33:48 +0000
Subject: [PATCH] xtensa: Use seq_puts() in c_show()
Message-Id: <f4fc3f37-799c-397e-62b8-c7f4a7d974f9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Zankel <chris@zankel.net>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>, Kefeng Wang <wangkefeng.wang@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 May 2017 21:24:51 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/xtensa/kernel/setup.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index 23ac2a205e97..44632a20f3d9 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -593,8 +593,7 @@ c_show(struct seq_file *f, void *slot)
 		      (ccount_freq/10000) % 100,
 		      loops_per_jiffy/(500000/HZ),
 		      (loops_per_jiffy/(5000/HZ)) % 100);
-
-	seq_printf(f,"flags\t\t: "
+	seq_puts(f, "flags\t\t: "
 #if XCHAL_HAVE_NMI
 		     "nmi "
 #endif
-- 
2.12.2

