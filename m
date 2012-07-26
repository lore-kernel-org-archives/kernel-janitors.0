From: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
Date: Thu, 26 Jul 2012 17:27:46 +0000
Subject: Re: [PATCH] aty128fb: Fix coding style issues
Message-Id: <50117E12.6040107@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 06/08/2012 04:55 PM, Emil Goode wrote:
> This patch cleans up some coding style issues.
> 
> -Some lines are indented with 4 spaces, most of this code
>  is not used but it should be correctly indented anyway.
> 
> -I also fixed some long lines exceeding the 80 char limit.
> 
> Signed-off-by: Emil Goode <emilgoode@gmail.com>

Applied.


Thanks,

Florian Tobias Schandinat

> ---
> Note: The patch has 3 checkpatch warnings which I didn't introduce.
> 
>  drivers/video/aty/aty128fb.c |  180 ++++++++++++++++++++++++------------------
>  1 file changed, 101 insertions(+), 79 deletions(-)
> 
> diff --git a/drivers/video/aty/aty128fb.c b/drivers/video/aty/aty128fb.c
> index b0b2ac3..747442d 100644
> --- a/drivers/video/aty/aty128fb.c
> +++ b/drivers/video/aty/aty128fb.c
> @@ -90,7 +90,8 @@
>  #undef DEBUG
>  
>  #ifdef DEBUG
> -#define DBG(fmt, args...)		printk(KERN_DEBUG "aty128fb: %s " fmt, __func__, ##args);
> +#define DBG(fmt, args...) \
> +	printk(KERN_DEBUG "aty128fb: %s " fmt, __func__, ##args);
>  #else
>  #define DBG(fmt, args...)
>  #endif
> @@ -449,8 +450,9 @@ static int aty128_decode_var(struct fb_var_screeninfo *var,
>                               struct aty128fb_par *par);
>  #if 0
>  static void __devinit aty128_get_pllinfo(struct aty128fb_par *par,
> -				      void __iomem *bios);
> -static void __devinit __iomem *aty128_map_ROM(struct pci_dev *pdev, const struct aty128fb_par *par);
> +					 void __iomem *bios);
> +static void __devinit __iomem *aty128_map_ROM(struct pci_dev *pdev,
> +					      const struct aty128fb_par *par);
>  #endif
>  static void aty128_timings(struct aty128fb_par *par);
>  static void aty128_init_engine(struct aty128fb_par *par);
> @@ -779,7 +781,8 @@ static u32 depth_to_dst(u32 depth)
>  
>  
>  #ifndef __sparc__
> -static void __iomem * __devinit aty128_map_ROM(const struct aty128fb_par *par, struct pci_dev *dev)
> +static void __iomem * __devinit aty128_map_ROM(const struct aty128fb_par *par,
> +					       struct pci_dev *dev)
>  {
>  	u16 dptr;
>  	u8 rom_type;
> @@ -811,13 +814,14 @@ static void __iomem * __devinit aty128_map_ROM(const struct aty128fb_par *par, s
>  	/* Look for the PCI data to check the ROM type */
>  	dptr = BIOS_IN16(0x18);
>  
> -	/* Check the PCI data signature. If it's wrong, we still assume a normal x86 ROM
> -	 * for now, until I've verified this works everywhere. The goal here is more
> -	 * to phase out Open Firmware images.
> +	/* Check the PCI data signature. If it's wrong, we still assume a normal
> +	 * x86 ROM for now, until I've verified this works everywhere.
> +	 * The goal here is more to phase out Open Firmware images.
>  	 *
> -	 * Currently, we only look at the first PCI data, we could iteratre and deal with
> -	 * them all, and we should use fb_bios_start relative to start of image and not
> -	 * relative start of ROM, but so far, I never found a dual-image ATI card
> +	 * Currently, we only look at the first PCI data, we could iteratre and
> +	 * deal with them all, and we should use fb_bios_start relative to start
> +	 * of image and not relative start of ROM, but so far, I never found a
> +	 * dual-image ATI card.
>  	 *
>  	 * typedef struct {
>  	 * 	u32	signature;	+ 0x00
> @@ -852,7 +856,8 @@ static void __iomem * __devinit aty128_map_ROM(const struct aty128fb_par *par, s
>  		printk(KERN_INFO "aty128fb: Found HP PA-RISC ROM Image\n");
>  		goto failed;
>  	default:
> -		printk(KERN_INFO "aty128fb: Found unknown type %d ROM Image\n", rom_type);
> +		printk(KERN_INFO "aty128fb: Found unknown type %d ROM Image\n",
> +		       rom_type);
>  		goto failed;
>  	}
>   anyway:
> @@ -863,7 +868,8 @@ static void __iomem * __devinit aty128_map_ROM(const struct aty128fb_par *par, s
>  	return NULL;
>  }
>  
> -static void __devinit aty128_get_pllinfo(struct aty128fb_par *par, unsigned char __iomem *bios)
> +static void __devinit aty128_get_pllinfo(struct aty128fb_par *par,
> +					 unsigned char __iomem *bios)
>  {
>  	unsigned int bios_hdr;
>  	unsigned int bios_pll;
> @@ -1247,10 +1253,13 @@ static int aty128_crtc_to_var(const struct aty128_crtc *crtc,
>  static void aty128_set_crt_enable(struct aty128fb_par *par, int on)
>  {
>  	if (on) {
> -		aty_st_le32(CRTC_EXT_CNTL, aty_ld_le32(CRTC_EXT_CNTL) | CRT_CRTC_ON);
> -		aty_st_le32(DAC_CNTL, (aty_ld_le32(DAC_CNTL) | DAC_PALETTE2_SNOOP_EN));
> +		aty_st_le32(CRTC_EXT_CNTL, aty_ld_le32(CRTC_EXT_CNTL) |
> +			    CRT_CRTC_ON);
> +		aty_st_le32(DAC_CNTL, (aty_ld_le32(DAC_CNTL) |
> +			    DAC_PALETTE2_SNOOP_EN));
>  	} else
> -		aty_st_le32(CRTC_EXT_CNTL, aty_ld_le32(CRTC_EXT_CNTL) & ~CRT_CRTC_ON);
> +		aty_st_le32(CRTC_EXT_CNTL, aty_ld_le32(CRTC_EXT_CNTL) &
> +			    ~CRT_CRTC_ON);
>  }
>  
>  static void aty128_set_lcd_enable(struct aty128fb_par *par, int on)
> @@ -1281,7 +1290,8 @@ static void aty128_set_lcd_enable(struct aty128fb_par *par, int on)
>  	}
>  }
>  
> -static void aty128_set_pll(struct aty128_pll *pll, const struct aty128fb_par *par)
> +static void aty128_set_pll(struct aty128_pll *pll,
> +			   const struct aty128fb_par *par)
>  {
>  	u32 div3;
>  
> @@ -1366,7 +1376,8 @@ static int aty128_var_to_pll(u32 period_in_ps, struct aty128_pll *pll,
>  }
>  
>  
> -static int aty128_pll_to_var(const struct aty128_pll *pll, struct fb_var_screeninfo *var)
> +static int aty128_pll_to_var(const struct aty128_pll *pll,
> +			     struct fb_var_screeninfo *var)
>  {
>  	var->pixclock = 100000000 / pll->vclk;
>  
> @@ -1512,7 +1523,8 @@ static int aty128fb_set_par(struct fb_info *info)
>   *  encode/decode the User Defined Part of the Display
>   */
>  
> -static int aty128_decode_var(struct fb_var_screeninfo *var, struct aty128fb_par *par)
> +static int aty128_decode_var(struct fb_var_screeninfo *var,
> +			     struct aty128fb_par *par)
>  {
>  	int err;
>  	struct aty128_crtc crtc;
> @@ -1559,7 +1571,8 @@ static int aty128_encode_var(struct fb_var_screeninfo *var,
>  }           
>  
>  
> -static int aty128fb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
> +static int aty128fb_check_var(struct fb_var_screeninfo *var,
> +			      struct fb_info *info)
>  {
>  	struct aty128fb_par par;
>  	int err;
> @@ -1575,7 +1588,8 @@ static int aty128fb_check_var(struct fb_var_screeninfo *var, struct fb_info *inf
>  /*
>   *  Pan or Wrap the Display
>   */
> -static int aty128fb_pan_display(struct fb_var_screeninfo *var, struct fb_info *fb) 
> +static int aty128fb_pan_display(struct fb_var_screeninfo *var,
> +				struct fb_info *fb)
>  {
>  	struct aty128fb_par *par = fb->par;
>  	u32 xoffset, yoffset;
> @@ -1594,7 +1608,8 @@ static int aty128fb_pan_display(struct fb_var_screeninfo *var, struct fb_info *f
>  	par->crtc.xoffset = xoffset;
>  	par->crtc.yoffset = yoffset;
>  
> -	offset = ((yoffset * par->crtc.vxres + xoffset)*(par->crtc.bpp >> 3)) & ~7;
> +	offset = ((yoffset * par->crtc.vxres + xoffset) * (par->crtc.bpp >> 3))
> +									  & ~7;
>  
>  	if (par->crtc.bpp = 24)
>  		offset += 8 * (offset % 3); /* Must be multiple of 8 and 3 */
> @@ -1620,11 +1635,13 @@ static void aty128_st_pal(u_int regno, u_int red, u_int green, u_int blue,
>  		 * do mirroring
>  		 */
>  
> -		aty_st_le32(DAC_CNTL, aty_ld_le32(DAC_CNTL) | DAC_PALETTE_ACCESS_CNTL);
> +		aty_st_le32(DAC_CNTL, aty_ld_le32(DAC_CNTL) |
> +			    DAC_PALETTE_ACCESS_CNTL);
>  		aty_st_8(PALETTE_INDEX, regno);
>  		aty_st_le32(PALETTE_DATA, (red<<16)|(green<<8)|blue);
>  #endif
> -		aty_st_le32(DAC_CNTL, aty_ld_le32(DAC_CNTL) & ~DAC_PALETTE_ACCESS_CNTL);
> +		aty_st_le32(DAC_CNTL, aty_ld_le32(DAC_CNTL) &
> +			    ~DAC_PALETTE_ACCESS_CNTL);
>  	}
>  
>  	aty_st_8(PALETTE_INDEX, regno);
> @@ -1753,7 +1770,8 @@ static int aty128_bl_update_status(struct backlight_device *bd)
>  			aty_st_le32(LVDS_GEN_CNTL, reg);
>  		}
>  		reg &= ~LVDS_BL_MOD_LEVEL_MASK;
> -		reg |= (aty128_bl_get_level_brightness(par, level) << LVDS_BL_MOD_LEVEL_SHIFT);
> +		reg |= (aty128_bl_get_level_brightness(par, level) <<
> +			LVDS_BL_MOD_LEVEL_SHIFT);
>  #ifdef BACKLIGHT_LVDS_OFF
>  		reg |= LVDS_ON | LVDS_EN;
>  		reg &= ~LVDS_DISPLAY_DIS;
> @@ -1764,7 +1782,8 @@ static int aty128_bl_update_status(struct backlight_device *bd)
>  #endif
>  	} else {
>  		reg &= ~LVDS_BL_MOD_LEVEL_MASK;
> -		reg |= (aty128_bl_get_level_brightness(par, 0) << LVDS_BL_MOD_LEVEL_SHIFT);
> +		reg |= (aty128_bl_get_level_brightness(par, 0) <<
> +			LVDS_BL_MOD_LEVEL_SHIFT);
>  #ifdef BACKLIGHT_LVDS_OFF
>  		reg |= LVDS_DISPLAY_DIS;
>  		aty_st_le32(LVDS_GEN_CNTL, reg);
> @@ -1869,7 +1888,8 @@ static void aty128_early_resume(void *data)
>  }
>  #endif /* CONFIG_PPC_PMAC */
>  
> -static int __devinit aty128_init(struct pci_dev *pdev, const struct pci_device_id *ent)
> +static int __devinit aty128_init(struct pci_dev *pdev,
> +				 const struct pci_device_id *ent)
>  {
>  	struct fb_info *info = pci_get_drvdata(pdev);
>  	struct aty128fb_par *par = info->par;
> @@ -1887,7 +1907,8 @@ static int __devinit aty128_init(struct pci_dev *pdev, const struct pci_device_i
>  
>  	/* range check to make sure */
>  	if (ent->driver_data < ARRAY_SIZE(r128_family))
> -	    strlcat(video_card, r128_family[ent->driver_data], sizeof(video_card));
> +		strlcat(video_card, r128_family[ent->driver_data],
> +			sizeof(video_card));
>  
>  	printk(KERN_INFO "aty128fb: %s [chip rev 0x%x] ", video_card, chip_rev);
>  
> @@ -1911,11 +1932,11 @@ static int __devinit aty128_init(struct pci_dev *pdev, const struct pci_device_i
>  		/* Indicate sleep capability */
>  		if (par->chip_gen = rage_M3) {
>  			pmac_call_feature(PMAC_FTR_DEVICE_CAN_WAKE, NULL, 0, 1);
> -#if 0 /* Disable the early video resume hack for now as it's causing problems, among
> -       * others we now rely on the PCI core restoring the config space for us, which
> -       * isn't the case with that hack, and that code path causes various things to
> -       * be called with interrupts off while they shouldn't. I'm leaving the code in
> -       * as it can be useful for debugging purposes
> +#if 0 /* Disable the early video resume hack for now as it's causing problems,
> +       * among others we now rely on the PCI core restoring the config space
> +       * for us, which isn't the case with that hack, and that code path causes
> +       * various things to be called with interrupts off while they shouldn't.
> +       * I'm leaving the code in as it can be useful for debugging purposes
>         */
>  			pmac_set_early_video_resume(aty128_early_resume, par);
>  #endif
> @@ -1953,11 +1974,11 @@ static int __devinit aty128_init(struct pci_dev *pdev, const struct pci_device_i
>  				default_vmode = VMODE_1152_768_60;
>  	
>  			if (default_cmode > 16) 
> -			    default_cmode = CMODE_32;
> +				default_cmode = CMODE_32;
>  			else if (default_cmode > 8) 
> -			    default_cmode = CMODE_16;
> +				default_cmode = CMODE_16;
>  			else 
> -			    default_cmode = CMODE_8;
> +				default_cmode = CMODE_8;
>  
>  			if (mac_vmode_to_var(default_vmode, default_cmode, &var))
>  				var = default_var;
> @@ -2018,7 +2039,8 @@ static int __devinit aty128_init(struct pci_dev *pdev, const struct pci_device_i
>  
>  #ifdef CONFIG_PCI
>  /* register a card    ++ajoshi */
> -static int __devinit aty128_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> +static int __devinit aty128_probe(struct pci_dev *pdev,
> +				  const struct pci_device_id *ent)
>  {
>  	unsigned long fb_addr, reg_addr;
>  	struct aty128fb_par *par;
> @@ -2318,39 +2340,39 @@ static inline void aty128_rectcopy(int srcx, int srcy, int dstx, int dsty,
>  				   u_int width, u_int height,
>  				   struct fb_info_aty128 *par)
>  {
> -    u32 save_dp_datatype, save_dp_cntl, dstval;
> -
> -    if (!width || !height)
> -        return;
> -
> -    dstval = depth_to_dst(par->current_par.crtc.depth);
> -    if (dstval = DST_24BPP) {
> -        srcx *= 3;
> -        dstx *= 3;
> -        width *= 3;
> -    } else if (dstval = -EINVAL) {
> -        printk("aty128fb: invalid depth or RGBA\n");
> -        return;
> -    }
> -
> -    wait_for_fifo(2, par);
> -    save_dp_datatype = aty_ld_le32(DP_DATATYPE);
> -    save_dp_cntl     = aty_ld_le32(DP_CNTL);
> -
> -    wait_for_fifo(6, par);
> -    aty_st_le32(SRC_Y_X, (srcy << 16) | srcx);
> -    aty_st_le32(DP_MIX, ROP3_SRCCOPY | DP_SRC_RECT);
> -    aty_st_le32(DP_CNTL, DST_X_LEFT_TO_RIGHT | DST_Y_TOP_TO_BOTTOM);
> -    aty_st_le32(DP_DATATYPE, save_dp_datatype | dstval | SRC_DSTCOLOR);
> -
> -    aty_st_le32(DST_Y_X, (dsty << 16) | dstx);
> -    aty_st_le32(DST_HEIGHT_WIDTH, (height << 16) | width);
> -
> -    par->blitter_may_be_busy = 1;
> -
> -    wait_for_fifo(2, par);
> -    aty_st_le32(DP_DATATYPE, save_dp_datatype);
> -    aty_st_le32(DP_CNTL, save_dp_cntl); 
> +	u32 save_dp_datatype, save_dp_cntl, dstval;
> +
> +	if (!width || !height)
> +		return;
> +
> +	dstval = depth_to_dst(par->current_par.crtc.depth);
> +	if (dstval = DST_24BPP) {
> +		srcx *= 3;
> +		dstx *= 3;
> +		width *= 3;
> +	} else if (dstval = -EINVAL) {
> +		printk("aty128fb: invalid depth or RGBA\n");
> +		return;
> +	}
> +
> +	wait_for_fifo(2, par);
> +	save_dp_datatype = aty_ld_le32(DP_DATATYPE);
> +	save_dp_cntl     = aty_ld_le32(DP_CNTL);
> +
> +	wait_for_fifo(6, par);
> +	aty_st_le32(SRC_Y_X, (srcy << 16) | srcx);
> +	aty_st_le32(DP_MIX, ROP3_SRCCOPY | DP_SRC_RECT);
> +	aty_st_le32(DP_CNTL, DST_X_LEFT_TO_RIGHT | DST_Y_TOP_TO_BOTTOM);
> +	aty_st_le32(DP_DATATYPE, save_dp_datatype | dstval | SRC_DSTCOLOR);
> +
> +	aty_st_le32(DST_Y_X, (dsty << 16) | dstx);
> +	aty_st_le32(DST_HEIGHT_WIDTH, (height << 16) | width);
> +
> +	par->blitter_may_be_busy = 1;
> +
> +	wait_for_fifo(2, par);
> +	aty_st_le32(DP_DATATYPE, save_dp_datatype);
> +	aty_st_le32(DP_CNTL, save_dp_cntl);
>  }
>  
>  
> @@ -2358,17 +2380,17 @@ static inline void aty128_rectcopy(int srcx, int srcy, int dstx, int dsty,
>       * Text mode accelerated functions
>       */
>  
> -static void fbcon_aty128_bmove(struct display *p, int sy, int sx, int dy, int dx,
> -			int height, int width)
> +static void fbcon_aty128_bmove(struct display *p, int sy, int sx, int dy,
> +			       int dx, int height, int width)
>  {
> -    sx     *= fontwidth(p);
> -    sy     *= fontheight(p);
> -    dx     *= fontwidth(p);
> -    dy     *= fontheight(p);
> -    width  *= fontwidth(p);
> -    height *= fontheight(p);
> -
> -    aty128_rectcopy(sx, sy, dx, dy, width, height,
> +	sx     *= fontwidth(p);
> +	sy     *= fontheight(p);
> +	dx     *= fontwidth(p);
> +	dy     *= fontheight(p);
> +	width  *= fontwidth(p);
> +	height *= fontheight(p);
> +
> +	aty128_rectcopy(sx, sy, dx, dy, width, height,
>  			(struct fb_info_aty128 *)p->fb_info);
>  }
>  #endif /* 0 */

