From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 13:49:22 +0000
Subject: [PATCH 4/4] C6X/megamode-pic: Fix a typo in a comment line
Message-Id: <d28d1e47-c842-e35a-c3f4-9d1a4d267824@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1b8c2efb-1096-3b78-9100-e20c55b6ecf1@users.sourceforge.net>
In-Reply-To: <1b8c2efb-1096-3b78-9100-e20c55b6ecf1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c6x-dev@linux-c6x.org, Aurelien Jacquiot <a-jacquiot@ti.com>, Mark Salter <msalter@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 15:12:49 +0200

Delete one character from a word in this description for a function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/c6x/platforms/megamod-pic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/c6x/platforms/megamod-pic.c b/arch/c6x/platforms/megamod-pic.c
index c49aa63289fa..d5699ebcc149 100644
--- a/arch/c6x/platforms/megamod-pic.c
+++ b/arch/c6x/platforms/megamod-pic.c
@@ -168,7 +168,7 @@ static void __init set_megamod_mux(struct megamod_pic *pic, int src, int output)
  * The MUX map is an array of up to 12 cells; one for each usable core priority
  * interrupt. The value of a given cell is the megamodule interrupt source
  * which is to me MUXed to the output corresponding to the cell position
- * withing the array. The first cell in the array corresponds to priority
+ * within the array. The first cell in the array corresponds to priority
  * 4 and the last (12th) cell corresponds to priority 15. The allowed
  * values are 4 - ((NR_COMBINERS * 32) - 1). Note that the combined interrupt
  * sources (0 - 3) are not allowed to be mapped through this property. They
-- 
2.12.3

