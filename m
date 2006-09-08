From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:00:19 +0000
Subject: [KJ] [PATCH 35/72] arm: add KERN_ constants to
Message-Id: <20060908020019.10114.75663.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-s3c2410/dma.c b/arch/arm/mach-s3c2410/dma.c
index cc92a7b..fa4d41c 100644
--- a/arch/arm/mach-s3c2410/dma.c
+++ b/arch/arm/mach-s3c2410/dma.c
@@ -66,7 +66,7 @@ struct s3c2410_dma_chan s3c2410_chans[S3
 
 #define BUF_MAGIC (0xcafebabe)
 
-#define dmawarn(fmt...) printk(KERN_DEBUG fmt)
+#define DMAWARN(fmt...) printk(KERN_DEBUG fmt)
 
 #define dma_regaddr(chan, reg) ((chan)->regs + (reg))
 
@@ -239,18 +239,18 @@ s3c2410_dma_loadbuffer(struct s3c2410_dm
 		 buf, (unsigned long)buf->data, buf->size);
 
 	if (buf = NULL) {
-		dmawarn("buffer is NULL\n");
+		DMAWARN("buffer is NULL\n");
 		return -EINVAL;
 	}
 
 	/* check the state of the channel before we do anything */
 
 	if (chan->load_state = S3C2410_DMALOAD_1LOADED) {
-		dmawarn("load_state is S3C2410_DMALOAD_1LOADED\n");
+		DMAWARN("load_state is S3C2410_DMALOAD_1LOADED\n");
 	}
 
 	if (chan->load_state = S3C2410_DMALOAD_1LOADED_1RUNNING) {
-		dmawarn("state is S3C2410_DMALOAD_1LOADED_1RUNNING\n");
+		DMAWARN("state is S3C2410_DMALOAD_1LOADED_1RUNNING\n");
 	}
 
 	/* it would seem sensible if we are the last buffer to not bother
@@ -267,7 +267,7 @@ s3c2410_dma_loadbuffer(struct s3c2410_dm
 	}
 
 	if ((buf->data & 0xf0000000) != 0x30000000) {
-		dmawarn("dmaload: buffer is %p\n", (void *)buf->data);
+		DMAWARN("dmaload: buffer is %p\n", (void *)buf->data);
 	}
 
 	writel(buf->data, chan->addr_reg);
@@ -289,7 +289,7 @@ s3c2410_dma_loadbuffer(struct s3c2410_dm
 		break;
 
 	default:
-		dmawarn("dmaload: unknown state %d in loadbuffer\n",
+		DMAWARN("dmaload: unknown state %d in loadbuffer\n",
 			chan->load_state);
 		break;
 	}
@@ -549,7 +549,7 @@ s3c2410_dma_freebuf(struct s3c2410_dma_b
 	if (magicok) {
 		kmem_cache_free(dma_kmem, buf);
 	} else {
-		printk("s3c2410_dma_freebuf: buff %p with bad magic\n", buf);
+		pr_info("s3c2410_dma_freebuf: buff %p with bad magic\n", buf);
 	}
 }
 
@@ -1274,7 +1274,7 @@ static int __init s3c2410_init_dma(void)
 	int channel;
 	int ret;
 
-	printk("S3C2410 DMA Driver, (c) 2003-2004 Simtec Electronics\n");
+	pr_info("S3C2410 DMA Driver, (c) 2003-2004 Simtec Electronics\n");
 
 	dma_base = ioremap(S3C24XX_PA_DMA, 0x200);
 	if (dma_base = NULL) {
@@ -1322,7 +1322,7 @@ static int __init s3c2410_init_dma(void)
 		cp->dev.id  = channel;
 		ret = sysdev_register(&cp->dev);
 
-		printk("DMA channel %d at %p, irq %d\n",
+		pr_info("DMA channel %d at %p, irq %d\n",
 		       cp->number, cp->regs, cp->irq);
 	}
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
