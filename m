From: James Nelson <james4765@cwazy.co.uk>
Date: Wed, 26 Jan 2005 01:26:27 +0000
Subject: [KJ] [PATCH 5/53][RESEND] atyfb: Clean up printk()'s in
Message-Id: <20050126012626.10691.8424.99712@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89742552597927061=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============89742552597927061==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/aty/mach64_ct.c - resent after removing another useless #ifdef

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/aty/mach64_ct.c linux-2.6.11-rc2-mm1/drivers/video/aty/mach64_ct.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/aty/mach64_ct.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/aty/mach64_ct.c	2005-01-25 20:22:07.265477405 -0500
@@ -195,10 +195,8 @@
 	/* Get register values. */
 	pll->dsp_on_off = (dsp_on << 16) + dsp_off;
 	pll->dsp_config = (dsp_precision << 20) | (pll->dsp_loop_latency << 16) | dsp_xclks;
-#ifdef DEBUG
-	printk("atyfb(%s): dsp_config 0x%08x, dsp_on_off 0x%08x\n",
+	pr_debug("atyfb(%s): dsp_config 0x%08x, dsp_on_off 0x%08x\n",
 		__FUNCTION__, pll->dsp_config, pll->dsp_on_off);
-#endif
 	return 0;
 }
 
@@ -226,7 +224,7 @@
 #ifdef DEBUG
 	pllvclk = (1000000 * 2 * pll->vclk_fb_div) /
 		(par->ref_clk_per * pll->pll_ref_div);
-	printk("atyfb(%s): pllvclk=%d MHz, vclk=%d MHz\n",
+	pr_debug("atyfb(%s): pllvclk=%d MHz, vclk=%d MHz\n",
 		__FUNCTION__, pllvclk, pllvclk / pll->vclk_post_div_real);
 #endif
 	pll->pll_vclk_cntl = 0x03; /* VCLK = PLL_VCLK/VCLKx_POST */
@@ -257,9 +255,7 @@
 		ret /= pll->ct.xres;
 	}
 #endif
-#ifdef DEBUG
-	printk("atyfb(%s): calculated 0x%08X(%i)\n", __FUNCTION__, ret, ret);
-#endif
+	pr_debug("atyfb(%s): calculated 0x%08X(%i)\n", __FUNCTION__, ret, ret);
 	return ret;
 }
 
@@ -270,17 +266,15 @@
 	u8 tmp, tmp2;
 
 	lcd_gen_cntrl = 0;
-#ifdef DEBUG
-	printk("atyfb(%s): about to program:\n"
+	pr_debug("atyfb(%s): about to program:\n"
 		"pll_ext_cntl=0x%02x pll_gen_cntl=0x%02x pll_vclk_cntl=0x%02x\n",
 		__FUNCTION__,
 		pll->ct.pll_ext_cntl, pll->ct.pll_gen_cntl, pll->ct.pll_vclk_cntl);
 
-	printk("atyfb(%s): setting clock %lu for FeedBackDivider %i, ReferenceDivider %i, PostDivider %i(%i)\n",
+	pr_debug("atyfb(%s): setting clock %lu for FeedBackDivider %i, ReferenceDivider %i, PostDivider %i(%i)\n",
 		__FUNCTION__,
 		par->clk_wr_offset, pll->ct.vclk_fb_div,
 		pll->ct.pll_ref_div, pll->ct.vclk_post_div, pll->ct.vclk_post_div_real);
-#endif
 #ifdef CONFIG_FB_ATY_GENERIC_LCD
 	if (par->lcd_table != 0) {
 		/* turn off LCD */
@@ -412,10 +406,8 @@
 		pll->ct.xclk_post_div -= 1;
 	}
 
-#ifdef DEBUG
-	printk("atyfb(%s): mclk_fb_mult=%d, xclk_post_div=%d\n",
+	pr_debug("atyfb(%s): mclk_fb_mult=%d, xclk_post_div=%d\n",
 		__FUNCTION__, pll->ct.mclk_fb_mult, pll->ct.xclk_post_div);
-#endif
 
 	memcntl = aty_ld_le32(MEM_CNTL, par);
 	trp = (memcntl & 0x300) >> 8;
@@ -525,7 +517,7 @@
 #ifdef DEBUG
 	pllmclk = (1000000 * pll->ct.mclk_fb_mult * pll->ct.mclk_fb_div) /
 			(par->ref_clk_per * pll->ct.pll_ref_div);
-	printk("atyfb(%s): pllmclk=%d MHz, xclk=%d MHz\n",
+	pr_debug("atyfb(%s): pllmclk=%d MHz, xclk=%d MHz\n",
 		__FUNCTION__, pllmclk, pllmclk / pll->ct.xclk_post_div_real);
 #endif
 
@@ -566,7 +558,7 @@
 #ifdef DEBUG
 		pllsclk = (1000000 * 2 * sclk_fb_div) /
 			(par->ref_clk_per * pll->ct.pll_ref_div);
-		printk("atyfb(%s): use sclk, pllsclk=%d MHz, sclk=mclk=%d MHz\n",
+		pr_debug("atyfb(%s): use sclk, pllsclk=%d MHz, sclk=mclk=%d MHz\n",
 			__FUNCTION__, pllsclk, pllsclk / sclk_post_div_real);
 #endif
 		/*

--===============89742552597927061==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89742552597927061==--
