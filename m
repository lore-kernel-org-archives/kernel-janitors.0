From: Tobias Klauser <tklauser@xenon.tklauser.home>
Date: Sat, 12 Aug 2006 22:07:50 +0000
Subject: [KJ] [PATCH] sound/mips/au1x00: Use ARRAY_SIZE macro
Message-Id: <20060812220750.GA4718@neon.tklauser.home>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: linux-mips@linux-mips.org, akpm@osdl.org

Use ARRAY_SIZE macro instead of sizeof(x)/sizeof(x[0])

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 sound/mips/au1x00.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sound/mips/au1x00.c b/sound/mips/au1x00.c
index c31b386..ff6e6fc 100644
--- a/sound/mips/au1x00.c
+++ b/sound/mips/au1x00.c
@@ -258,7 +258,7 @@ au1000_dma_interrupt(int irq, void *dev_
 
 static unsigned int rates[] = {8000, 11025, 16000, 22050};
 static struct snd_pcm_hw_constraint_list hw_constraints_rates = {
-	.count	=  sizeof(rates) / sizeof(rates[0]),
+	.count	= ARRAY_SIZE(rates),
 	.list	= rates,
 	.mask	= 0,
 };
-- 
1.4.1

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
