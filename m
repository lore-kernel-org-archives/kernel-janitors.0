From: "Suresh Jayaraman" <sjayaraman@novell.com>
Date: Fri, 29 Jun 2007 16:06:03 +0000
Subject: [KJ] [PATCH] ibmebus: Remove unnecessary cast of return value of
Message-Id: <46857B43020000F40000AA46@lucius.provo.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove unnecessasry cast of return value of kmalloc() in
powerpc/kernel/ibmebus.c

Signed-off-by: Suresh Jayaraman <sjayaraman@novell.com>
---
diff --git a/arch/powerpc/kernel/ibmebus.c b/arch/powerpc/kernel/ibmebus.c
index 9a8c9af..2953eff 100644
--- a/arch/powerpc/kernel/ibmebus.c
+++ b/arch/powerpc/kernel/ibmebus.c
@@ -383,7 +383,7 @@ static int ibmebus_match_path(struct device *dev, void *data)
 
 static char *ibmebus_chomp(const char *in, size_t count)
 {
-	char *out = (char*)kmalloc(count + 1, GFP_KERNEL);
+	char *out = kmalloc(count + 1, GFP_KERNEL);
 	if (!out)
 		return NULL;

-- 
Suresh Jayaraman


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
