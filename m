From: Leann Ogasawara <ogasawara@osdl.org>
Date: Fri, 06 Feb 2004 22:36:02 +0000
Subject: [Kernel-janitors] [PATCH] drivers/video/cyber2000fb.c
Message-Id: <1076106961.11883.1097.camel@ibm-d.pdx.osdl.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
In-Reply-To: <1075239420.3744.18.camel@ibm-d.pdx.osdl.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi All,

Patch audits fb_alloc_cmap() and uses fb_dealloc_cmap() to free
colormap.  Thanks,

Leann  

diffed against 2.6.2

=== drivers/video/cyber2000fb.c 1.31 vs edited ==--- 1.31/drivers/video/cyber2000fb.c	Thu Jul 31 08:58:45 2003
+++ edited/drivers/video/cyber2000fb.c	Fri Feb  6 14:33:45 2004
@@ -1223,6 +1223,7 @@
 cyberpro_alloc_fb_info(unsigned int id, char *name)
 {
 	struct cfb_info *cfb;
+	int ret;
 
 	cfb = kmalloc(sizeof(struct cfb_info) +
 		       sizeof(u32) * 16, GFP_KERNEL);
@@ -1284,7 +1285,11 @@
 	cfb->fb.flags		= FBINFO_FLAG_DEFAULT;
 	cfb->fb.pseudo_palette	= (void *)(cfb + 1);
 
-	fb_alloc_cmap(&cfb->fb.cmap, NR_PALETTE, 0);
+	ret = fb_alloc_cmap(&cfb->fb.cmap, NR_PALETTE, 0);
+	if (ret) {
+		kfree(cfb);
+		return NULL;
+	}
 
 	return cfb;
 }
@@ -1296,7 +1301,7 @@
 		/*
 		 * Free the colourmap
 		 */
-		fb_alloc_cmap(&cfb->fb.cmap, 0, 0);
+		fb_dealloc_cmap(&cfb->fb.cmap);
 
 		kfree(cfb);
 	}


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
