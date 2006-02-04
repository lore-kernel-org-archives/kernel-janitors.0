From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Sat, 04 Feb 2006 22:26:00 +0000
Subject: Re: [KJ] [PATCH] request_region - ppc/platforms/prep_setup.c - Please
Message-Id: <200602042326.00567.jesper.juhl@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200602041610.24772.ron@rongage.org>
In-Reply-To: <200602041610.24772.ron@rongage.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Saturday 04 February 2006 22:10, Ron Gage wrote:
> Is this a good way to handle this problem?  Original code was (in essence) 5 
> request_region calls in a row with no return checking.
> 
Your patch completely neglects to free the resources already allocated. Thus if
a the driver aborts half way through allocating its regions then the regions it did
successfully allocate will never be freed and another driver needing those 
regions will never be able to load.
A better patch is (in my opinion) something like the below.

(also, you forgot to add a Signed-off-by: line to your patch)


Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
---

 arch/ppc/platforms/prep_setup.c |   30 ++++++++++++++++++++++++++++--
 1 files changed, 28 insertions(+), 2 deletions(-)

--- linux-2.6.16-rc2-git1-orig/arch/ppc/platforms/prep_setup.c	2006-02-04 14:43:58.000000000 +0100
+++ linux-2.6.16-rc2-git1/arch/ppc/platforms/prep_setup.c	2006-02-04 22:39:57.000000000 +0100
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
 		request_region(0x00,0x20,"dma1");
+		if (!region)
+			goto out_dma1;
 		request_region(0x40,0x20,"timer");
+		if (!region)
+			goto out_timer;
 		request_region(0x80,0x10,"dma page reg");
+		if (!region)
+			goto out_dma_page;
 		request_region(0xc0,0x20,"dma2");
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



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
