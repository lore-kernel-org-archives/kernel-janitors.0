From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 13:46:07 +0000
Subject: [PATCH 1/4] C6X/megamode-pic: Improve a size determination in init_megamod_pic()
Message-Id: <db7a5f16-21d4-59da-ae8c-31bdeafe63a2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1b8c2efb-1096-3b78-9100-e20c55b6ecf1@users.sourceforge.net>
In-Reply-To: <1b8c2efb-1096-3b78-9100-e20c55b6ecf1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c6x-dev@linux-c6x.org, Aurelien Jacquiot <a-jacquiot@ti.com>, Mark Salter <msalter@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 14:56:57 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/c6x/platforms/megamod-pic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/c6x/platforms/megamod-pic.c b/arch/c6x/platforms/megamod-pic.c
index 43afc03e4125..72b5f143c105 100644
--- a/arch/c6x/platforms/megamod-pic.c
+++ b/arch/c6x/platforms/megamod-pic.c
@@ -205,6 +205,5 @@ static struct megamod_pic * __init init_megamod_pic(struct device_node *np)
 	int mapping[NR_MUX_OUTPUTS];
 
 	pr_info("Initializing C64x+ Megamodule PIC\n");
-
-	pic = kzalloc(sizeof(struct megamod_pic), GFP_KERNEL);
+	pic = kzalloc(sizeof(*pic), GFP_KERNEL);
 	if (!pic) {
-- 
2.12.3

