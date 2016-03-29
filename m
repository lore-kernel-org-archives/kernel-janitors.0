From: Greg KH <gregkh@linuxfoundation.org>
Date: Tue, 29 Mar 2016 19:35:48 +0000
Subject: Re: [PATCH 1/5] staging: xgifb: fix block comments
Message-Id: <20160329193548.GA32561@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1459105983-17251-1-git-send-email-clifton.a.barnes@gmail.com>
In-Reply-To: <1459105983-17251-1-git-send-email-clifton.a.barnes@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clifton Barnes <clifton.a.barnes@gmail.com>
Cc: arnaud.patard@rtp-net.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Mar 27, 2016 at 03:12:59PM -0400, Clifton Barnes wrote:
> fix checkpatch.pl warning about 'Block comments use a trailing */ on a
> separate line' and 'Block comments use * on subsequent lines'
> 
> Signed-off-by: Clifton Barnes <clifton.a.barnes@gmail.com>
> ---
>  drivers/staging/xgifb/vb_init.c    |  13 ++--
>  drivers/staging/xgifb/vb_setmode.c |   3 +-
>  drivers/staging/xgifb/vb_table.h   | 135 ++++++++++++++++++++++---------------
>  3 files changed, 88 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/staging/xgifb/vb_init.c b/drivers/staging/xgifb/vb_init.c
> index 26b539b..1ef2bfb 100644
> --- a/drivers/staging/xgifb/vb_init.c
> +++ b/drivers/staging/xgifb/vb_init.c
> @@ -355,7 +355,8 @@ static void XGINew_DDR2_DefaultRegister(
>  	unsigned long P3d4 = Port, P3c4 = Port - 0x10;
>  
>  	/* keep following setting sequence, each setting in
> -	 * the same reg insert idle */
> +	 * the same reg insert idle
> +	 */
>  	xgifb_reg_set(P3d4, 0x82, 0x77);
>  	xgifb_reg_set(P3d4, 0x86, 0x00);
>  	xgifb_reg_get(P3d4, 0x86); /* Insert read command for delay */
> @@ -699,11 +700,11 @@ static void XGINew_CheckChannel(struct xgi_hw_device_info *HwDeviceExtension,
>  		break;
>  	case XG42:
>  		/*
> -		 XG42 SR14 D[3] Reserve
> -		 D[2] = 1, Dual Channel
> -		 = 0, Single Channel
> -
> -		 It's Different from Other XG40 Series.
> +		 * XG42 SR14 D[3] Reserve
> +		 * D[2] = 1, Dual Channel
> +		 * = 0, Single Channel
> +		 *
> +		 * It's Different from Other XG40 Series.
>  		 */
>  		if (XGINew_CheckFrequence(pVBInfo) = 1) { /* DDRII, DDR2x */
>  			pVBInfo->ram_bus = 32; /* 32 bits */
> diff --git a/drivers/staging/xgifb/vb_setmode.c b/drivers/staging/xgifb/vb_setmode.c
> index 40939c8..0f9c300 100644
> --- a/drivers/staging/xgifb/vb_setmode.c
> +++ b/drivers/staging/xgifb/vb_setmode.c
> @@ -1992,7 +1992,8 @@ static void XGI_GetVBInfo(unsigned short ModeIdIndex,
>  		}
>  
>  		/* LCD+TV can't support in slave mode
> -		 * (Force LCDA+TV->LCDB) */
> +		 * (Force LCDA+TV->LCDB)
> +		 */
>  		if ((tempbx & SetInSlaveMode) && (tempbx & XGI_SetCRT2ToLCDA)) {
>  			tempbx ^= (SetCRT2ToLCD | XGI_SetCRT2ToLCDA |
>  				   SetCRT2ToDualEdge);
> diff --git a/drivers/staging/xgifb/vb_table.h b/drivers/staging/xgifb/vb_table.h
> index 45f2c99..86f1b37 100644
> --- a/drivers/staging/xgifb/vb_table.h
> +++ b/drivers/staging/xgifb/vb_table.h
> @@ -58,8 +58,9 @@ static const unsigned char XGI27_cr41[24][3] = {
>  	{0xC4, 0x40, 0x84}, /* 1 CR8A */
>  	{0xC4, 0x40, 0x84}, /* 2 CR8B */
>  	{0xB3, 0x13, 0xa4}, /* 3 CR40[7],
> -				 CR99[2:0],
> -				 CR45[3:0]*/
> +			     *   CR99[2:0],
> +			     *   CR45[3:0]
> +			     */
>  	{0xf0, 0xf5, 0xf0}, /* 4 CR59 */
>  	{0x90, 0x90, 0x24}, /* 5 CR68 */
>  	{0x77, 0x67, 0x44}, /* 6 CR69 */
> @@ -101,9 +102,11 @@ const struct XGI_ExtStruct XGI330_EModeIDTable[] = {
>  	{0x38, 0x0a1b, 0x0508, 0x08, 0x00, 0x16},
>  	{0x3a, 0x0e3b, 0x0609, 0x09, 0x00, 0x1e},
>  	{0x3c, 0x0e3b, 0x070a, 0x0a, 0x00, 0x22}, /* mode 1600x1200
> -						   add CRT2MODE [2003/10/07] */
> +						   * add CRT2MODE [2003/10/07]
> +						   */
>  	{0x3d, 0x0e7d, 0x070a, 0x0a, 0x00, 0x22}, /* mode 1600x1200
> -						   add CRT2MODE */
> +						   * add CRT2MODE
> +						   */
>  	{0x40, 0x9a1c, 0x0000, 0x00, 0x04, 0x00},
>  	{0x41, 0x9a1d, 0x0000, 0x00, 0x04, 0x00},
>  	{0x43, 0x0a1c, 0x0306, 0x06, 0x05, 0x06},
> @@ -129,7 +132,8 @@ const struct XGI_ExtStruct XGI330_EModeIDTable[] = {
>  	{0x64, 0x0a7f, 0x0508, 0x08, 0x00, 0x16},
>  	{0x65, 0x0eff, 0x0609, 0x09, 0x00, 0x1e},
>  	{0x66, 0x0eff, 0x070a, 0x0a, 0x00, 0x22}, /* mode 1600x1200
> -						   add CRT2MODE */
> +						   * add CRT2MODE
> +						   */
>  	{0x68, 0x067b, 0x080b, 0x0b, 0x00, 0x29},
>  	{0x69, 0x06fd, 0x080b, 0x0b, 0x00, 0x29},
>  	{0x6b, 0x07ff, 0x080b, 0x0b, 0x00, 0x29},
> @@ -223,38 +227,38 @@ const struct XGI_CRT1TableStruct XGI_CRT1Table[] = {
>  	  0x0D, 0x3E, 0xE0, 0x83, 0xDF, 0x0E, 0x90} }, /* 0xb */
>  	{ {0x65, 0x4F, 0x89, 0x57, 0x9F, 0x00, 0x01, 0x00,
>  	  0xFB, 0x1F, 0xE6, 0x8A, 0xDF, 0xFC, 0x10} }, /* 0xc */
> -	{ {0x7B, 0x63, 0x9F, 0x6A, 0x93, 0x00, 0x05, 0x00, /* ;
> -						0D (800x600,56Hz) */
> -	  0x6F, 0xF0, 0x58, 0x8A, 0x57, 0x70, 0xA0} },     /* ;
> -						(VCLK 36.0MHz) */
> -	{ {0x7F, 0x63, 0x83, 0x6C, 0x1C, 0x00, 0x06, 0x00, /* ;
> -						0E (800x600,60Hz) */
> -	  0x72, 0xF0, 0x58, 0x8C, 0x57, 0x73, 0xA0} },     /* ;
> -						(VCLK 40.0MHz) */
> -	{ {0x7D, 0x63, 0x81, 0x6E, 0x1D, 0x00, 0x06, 0x00, /* ;
> -						0F (800x600,72Hz) */
> -	  0x98, 0xF0, 0x7C, 0x82, 0x57, 0x99, 0x80} },     /* ;
> -						(VCLK 50.0MHz) */
> -	{ {0x7F, 0x63, 0x83, 0x69, 0x13, 0x00, 0x06, 0x00, /* ;
> -						10 (800x600,75Hz) */
> -	  0x6F, 0xF0, 0x58, 0x8B, 0x57, 0x70, 0xA0} },     /* ;
> -						(VCLK 49.5MHz) */
> -	{ {0x7E, 0x63, 0x82, 0x6B, 0x13, 0x00, 0x06, 0x00, /* ;
> -						11 (800x600,85Hz) */
> -	  0x75, 0xF0, 0x58, 0x8B, 0x57, 0x76, 0xA0} },     /* ;
> -						(VCLK 56.25MHz) */
> -	{ {0x81, 0x63, 0x85, 0x6D, 0x18, 0x00, 0x06, 0x60, /* ;
> -						12 (800x600,100Hz) */
> -	  0x7A, 0xF0, 0x58, 0x8B, 0x57, 0x7B, 0xA0} },     /* ;
> -						(VCLK 75.8MHz) */
> -	{ {0x83, 0x63, 0x87, 0x6E, 0x19, 0x00, 0x06, 0x60, /* ;
> -						13 (800x600,120Hz) */
> -	  0x81, 0xF0, 0x58, 0x8B, 0x57, 0x82, 0xA0} },     /* ;
> -						(VCLK 79.411MHz) */
> -	{ {0x85, 0x63, 0x89, 0x6F, 0x1A, 0x00, 0x06, 0x60, /* ;
> -						14 (800x600,160Hz) */
> -	  0x91, 0xF0, 0x58, 0x8B, 0x57, 0x92, 0xA0} },     /* ;
> -						(VCLK 105.822MHz) */
> +	{ {0x7B, 0x63, 0x9F, 0x6A, 0x93, 0x00, 0x05, 0x00,
> +						/* 0D (800x600,56Hz) */
> +	  0x6F, 0xF0, 0x58, 0x8A, 0x57, 0x70, 0xA0} },

This doesn't look correct to me, does it to you?  Please fix this and
just put the comment at the far right, or on the line before the block
of data.

thanks,

greg k-h
