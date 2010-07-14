From: Kulikov Vasiliy <segooon@gmail.com>
Date: Wed, 14 Jul 2010 18:00:42 +0000
Subject: [PATCH 01/11] arch/h8300/kernel/traps.c: formatting of pointers in printk()
Message-Id: <1279130442-10695-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Use %p instead of %08x in printk().

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 arch/h8300/kernel/traps.c |    4 +++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/h8300/kernel/traps.c b/arch/h8300/kernel/traps.c
index 3c0b66b..2c6270f 100644
--- a/arch/h8300/kernel/traps.c
+++ b/arch/h8300/kernel/traps.c
@@ -77,7 +78,7 @@ static void dump(struct pt_regs *fp)
 	tp = ((unsigned char *) fp->pc) - 0x20;
 	for (sp = (unsigned long *) tp, i = 0; (i < 0x40);  i += 4) {
 		if ((i % 0x10) = 0)
-			printk("\n%08x: ", (int) (tp + i));
+			printk("\n%p: ", tp + i);
 		printk("%08x ", (int) *sp++);
 	}
 	printk("\n");
@@ -86,7 +87,7 @@ static void dump(struct pt_regs *fp)
 	tp = ((unsigned char *) fp) - 0x40;
 	for (sp = (unsigned long *) tp, i = 0; (i < 0xc0); i += 4) {
 		if ((i % 0x10) = 0)
-			printk("\n%08x: ", (int) (tp + i));
+			printk("\n%p: ", tp + i);
 		printk("%08x ", (int) *sp++);
 	}
 	printk("\n");
-- 
1.7.0.4

