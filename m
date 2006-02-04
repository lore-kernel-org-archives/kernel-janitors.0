From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Sat, 04 Feb 2006 22:32:22 +0000
Subject: Re: [KJ] [PATCH] request_region - ppc/platforms/prep_setup.c - Please
Message-Id: <200602042332.22080.jesper.juhl@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200602041610.24772.ron@rongage.org>
In-Reply-To: <200602041610.24772.ron@rongage.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Saturday 04 February 2006 23:26, Jesper Juhl wrote:
> On Saturday 04 February 2006 22:10, Ron Gage wrote:
> > Is this a good way to handle this problem?  Original code was (in essence) 5 
> > request_region calls in a row with no return checking.
> > 
> Your patch completely neglects to free the resources already allocated. Thus if
> a the driver aborts half way through allocating its regions then the regions it did
> successfully allocate will never be freed and another driver needing those 
> regions will never be able to load.
> A better patch is (in my opinion) something like the below.
> 

D'OH, included the wrong file, the below should be better : 

Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
---

 arch/ppc/platforms/prep_setup.c |   38 ++++++++++++++++++++++++++++++++------
 1 files changed, 32 insertions(+), 6 deletions(-)

--- linux-2.6.16-rc2-git1-orig/arch/ppc/platforms/prep_setup.c	2006-02-04 14:43:58.000000000 +0100
+++ linux-2.6.16-rc2-git1/arch/ppc/platforms/prep_setup.c	2006-02-04 23:28:26.000000000 +0100
@@ -1069,17 +1069,43 @@ prep_map_io(void)
 static int __init
 prep_request_io(void)
 {
+	struct resource *region;
+	int ret = 0;
+
 	if (_machine = _MACH_prep) {
 #ifdef CONFIG_NVRAM
-		request_region(PREP_NVRAM_AS0, 0x8, "nvram");
+		region = request_region(PREP_NVRAM_AS0, 0x8, "nvram");
+		if (!region)
+			goto out_nvram;
 #endif
-		request_region(0x00,0x20,"dma1");
-		request_region(0x40,0x20,"timer");
-		request_region(0x80,0x10,"dma page reg");
-		request_region(0xc0,0x20,"dma2");
+		region = request_region(0x00,0x20,"dma1");
+		if (!region)
+			goto out_dma1;
+		region = request_region(0x40,0x20,"timer");
+		if (!region)
+			goto out_timer;
+		region = request_region(0x80,0x10,"dma page reg");
+		if (!region)
+			goto out_dma_page;
+		region = request_region(0xc0,0x20,"dma2");
+		if (!region)
+			goto out_dma2;
 	}
 
-	return 0;
+ out:
+	return ret;
+ out_dma2:
+ 	release_region(0x80,0x10);
+ out_dma_page:
+ 	release_region(0x40,0x20);
+ out_timer:
+ 	release_region(0x00,0x20);
+ out_dma1:
+ 	release_region(PREP_NVRAM_AS0, 0x8);
+ out_nvram:
+ 	ret = -EBUSY;
+ 	printk(KERN_WARNING "Unable to allocate required regions\n");
+	goto out;
 }
 
 device_initcall(prep_request_io);



-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
