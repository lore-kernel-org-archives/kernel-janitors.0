From: Ionut Alexa <ionut.m.alexa@gmail.com>
Date: Fri, 11 Jul 2014 23:39:10 +0000
Subject: [PATCH] kernel:dma : fix coding style errors
Message-Id: <1405121950-22273-1-git-send-email-ionut.m.alexa@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mmarek@suse.cz
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Ionut Alexa <ionut.m.alexa@gmail.com>

Fixed coding style errors.

Signed-off-by: Ionut Alexa <ionut.m.alexa@gmail.com>
---
 kernel/dma.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/kernel/dma.c b/kernel/dma.c
index 6c6262f..ae9ba17 100644
--- a/kernel/dma.c
+++ b/kernel/dma.c
@@ -66,7 +66,7 @@ static struct dma_chan dma_chan_busy[MAX_DMA_CHANNELS] = {
  * @dmanr: DMA channel number
  * @device_id: reserving device ID string, used in /proc/dma
  */
-int request_dma(unsigned int dmanr, const char * device_id)
+int request_dma(unsigned int dmanr, const char *device_id)
 {
 	if (dmanr >= MAX_DMA_CHANNELS)
 		return -EINVAL;
@@ -87,12 +87,12 @@ int request_dma(unsigned int dmanr, const char * device_id)
 void free_dma(unsigned int dmanr)
 {
 	if (dmanr >= MAX_DMA_CHANNELS) {
-		printk(KERN_WARNING "Trying to free DMA%d\n", dmanr);
+		pr_warn("Trying to free DMA%d\n", dmanr);
 		return;
 	}
 
 	if (xchg(&dma_chan_busy[dmanr].lock, 0) = 0) {
-		printk(KERN_WARNING "Trying to free free DMA%d\n", dmanr);
+		pr_warn("Trying to free free DMA%d\n", dmanr);
 		return;
 	}
 
@@ -152,9 +152,10 @@ static int __init proc_dma_init(void)
 	return 0;
 }
 
-__initcall(proc_dma_init);
+device_initcall(proc_dma_init);
 #endif
 
 EXPORT_SYMBOL(request_dma);
 EXPORT_SYMBOL(free_dma);
 EXPORT_SYMBOL(dma_spin_lock);
+
-- 
1.7.10.4

