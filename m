From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 13:47:28 +0000
Subject: [PATCH 2/4] C6X/megamode-pic: Delete an error message for a failed memory allocation in init_megamod
Message-Id: <03061c31-8a58-59a4-e76a-a4380e7a1935@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1b8c2efb-1096-3b78-9100-e20c55b6ecf1@users.sourceforge.net>
In-Reply-To: <1b8c2efb-1096-3b78-9100-e20c55b6ecf1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c6x-dev@linux-c6x.org, Aurelien Jacquiot <a-jacquiot@ti.com>, Mark Salter <msalter@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 15:00:30 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/c6x/platforms/megamod-pic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/c6x/platforms/megamod-pic.c b/arch/c6x/platforms/megamod-pic.c
index 72b5f143c105..cf0ebf25e42f 100644
--- a/arch/c6x/platforms/megamod-pic.c
+++ b/arch/c6x/platforms/megamod-pic.c
@@ -209,7 +209,5 @@ static struct megamod_pic * __init init_megamod_pic(struct device_node *np)
-	if (!pic) {
-		pr_err("%s: Could not alloc PIC structure.\n", np->full_name);
+	if (!pic)
 		return NULL;
-	}
 
 	pic->irqhost = irq_domain_add_linear(np, NR_COMBINERS * 32,
 					     &megamod_domain_ops, pic);
-- 
2.12.3

