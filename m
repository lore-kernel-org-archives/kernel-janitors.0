From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 23 Aug 2014 18:33:22 +0000
Subject: [PATCH 1/7] video: fbdev: riva: delete double assignment
Message-Id: <1408818808-18850-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1408818808-18850-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1408818808-18850-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antonino Daplas <adaplas@gmail.com>
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete successive assignments to the same location.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression i;
@@

*i = ...;
 i = ...;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The patches in this series do not depend on each other.

 drivers/video/fbdev/riva/riva_hw.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/riva/riva_hw.c b/drivers/video/fbdev/riva/riva_hw.c
index 78fdbf5..8bdf37f 100644
--- a/drivers/video/fbdev/riva/riva_hw.c
+++ b/drivers/video/fbdev/riva/riva_hw.c
@@ -430,7 +430,6 @@ static char nv3_arb(nv3_fifo_info * res_info, nv3_sim_state * state,  nv3_arb_in
     int mmisses, gmisses, vmisses, eburst_size, mburst_size;
     int refresh_cycle;
 
-    refresh_cycle = 0;
     refresh_cycle = 2*(state->mclk_khz/state->pclk_khz) + 5;
     mmisses = 2;
     if (state->mem_aligned) gmisses = 2;

