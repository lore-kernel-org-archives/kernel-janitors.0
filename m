From: Leann Ogasawara <ogasawara@osdl.org>
Date: Fri, 16 Jan 2004 23:00:23 +0000
Subject: [Kernel-janitors] [PATCH] vgastate.c ioremap/iounmap audit
Message-Id: <1074294022.12959.76.camel@ibm-d.pdx.osdl.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi All,

Patch inserts missing iounmap's on error and also removes unnecessary
iounmap's.  I was unable to test so feedback welcome.

Leann

diffed against 2.6.1

=== drivers/video/vgastate.c 1.4 vs edited ==--- 1.4/drivers/video/vgastate.c	Wed Jun 25 16:30:51 2003
+++ edited/drivers/video/vgastate.c	Fri Jan 16 08:30:21 2004
@@ -420,9 +420,8 @@
 
 		if (!fbbase) {
 			vga_cleanup(state);
-			iounmap(fbbase);
 			return 1;
-	}
+		}
 
 		/* 
 		 * save only first 32K used by vgacon
@@ -430,10 +429,11 @@
 		if (state->flags & VGA_SAVE_FONT0) {
 			saved->vga_font0 = vmalloc(4 * 8192);
 			if (!saved->vga_font0) {
-			vga_cleanup(state);
-			return 1;
+				iounmap(fbbase);
+				vga_cleanup(state);
+				return 1;
+			}
 		}
-	}
 		/* 
 		 * largely unused, but if required by the caller
 		 * we'll just save everything.
@@ -441,19 +441,21 @@
 		if (state->flags & VGA_SAVE_FONT1) {
 			saved->vga_font1 = vmalloc(state->memsize);
 			if (!saved->vga_font1) {
-			vga_cleanup(state);
-			return 1;
+				iounmap(fbbase);
+				vga_cleanup(state);
+				return 1;
+			}
 		}
-	}
 		/*
 		 * Save 8K at plane0[0], and 8K at plane1[16K]
 		 */
 		if (state->flags & VGA_SAVE_TEXT) {
 			saved->vga_text = vmalloc(8192 * 2);
 			if (!saved->vga_text) {
-			vga_cleanup(state);
-			return 1;
-		}
+				iounmap(fbbase);
+				vga_cleanup(state);
+				return 1;
+			}
 		}
 		
 		save_vga_text(state, fbbase);
@@ -475,7 +477,6 @@
 
 		if (!fbbase) {
 			vga_cleanup(state);
-			iounmap(fbbase);
 			return 1;
 		}
 		restore_vga_text(state, fbbase);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
