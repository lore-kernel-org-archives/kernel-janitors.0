From: Domen Puncer <domen@coderock.org>
Date: Mon, 17 May 2004 19:08:33 +0000
Subject: [Kernel-janitors] [patch 2.6.6] remove faulty __init's from
Message-Id: <20040517190833.GC5034@nd47>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4021350460390285=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============4021350460390285==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

These four are called from fb_show_logo, which is exported symbol,
called by fbcon_switch.

Compile tested.


	Domen

--- c/drivers/video/fbmem.c	2004-05-10 14:16:10.000000000 +0200
+++ a/drivers/video/fbmem.c	2004-05-17 19:48:37.000000000 +0200
@@ -509,7 +509,7 @@ static inline unsigned safe_shift(unsign
 	return n < 0 ? d >> -n : d << n;
 }
 
-static void __init fb_set_logocmap(struct fb_info *info,
+static void fb_set_logocmap(struct fb_info *info,
 				   const struct linux_logo *logo)
 {
 	struct fb_cmap palette_cmap;
@@ -543,7 +543,7 @@ static void __init fb_set_logocmap(struc
 	}
 }
 
-static void  __init fb_set_logo_truepalette(struct fb_info *info,
+static void  fb_set_logo_truepalette(struct fb_info *info,
 					    const struct linux_logo *logo,
 					    u32 *palette)
 {
@@ -573,7 +573,7 @@ static void  __init fb_set_logo_truepale
 	}
 }
 
-static void __init fb_set_logo_directpalette(struct fb_info *info,
+static void fb_set_logo_directpalette(struct fb_info *info,
 					     const struct linux_logo *logo,
 					     u32 *palette)
 {
@@ -588,7 +588,7 @@ static void __init fb_set_logo_directpal
 		palette[i] = i << redshift | i << greenshift | i << blueshift;
 }
 
-static void __init fb_set_logo(struct fb_info *info,
+static void fb_set_logo(struct fb_info *info,
 			       const struct linux_logo *logo, u8 *dst,
 			       int depth)
 {

--===============4021350460390285==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4021350460390285==--
