From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sun, 12 Sep 2010 13:48:25 +0000
Subject: [PATCH] ACPI: apei: Cast u64 to unsigned long, fix compile warning
Message-Id: <1284299305.7239.4.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Len Brown <lenb@kernel.org>, Huang Ying <ying.huang@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In today linux-net I got a compile warning in acpi/apei

drivers/acpi/apei/erst.c: In function ‘erst_exec_move_data’:
drivers/acpi/apei/erst.c:273: warning: cast to pointer from integer of different size
drivers/acpi/apei/erst.c:274: warning: cast to pointer from integer of different size

The problem is that apei_exec_context->dst_base type is u64.
But in 32 bits architecture void * is 32 bits long. 
Casting it to unsigned long solves the issue

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/acpi/apei/erst.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/apei/erst.c b/drivers/acpi/apei/erst.c
index a4904f1..37d7a05 100644
--- a/drivers/acpi/apei/erst.c
+++ b/drivers/acpi/apei/erst.c
@@ -270,8 +270,8 @@ static int erst_exec_move_data(struct apei_exec_context *ctx,
 	rc = __apei_exec_read_register(entry, &offset);
 	if (rc)
 		return rc;
-	memmove((void *)ctx->dst_base + offset,
-		(void *)ctx->src_base + offset,
+	memmove((void *)(unsigned long)ctx->dst_base + offset,
+		(void *)(unsigned long)ctx->src_base + offset,
 		ctx->var2);
 
 	return 0;
-- 
1.7.0.4



