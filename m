From: Joe Perches <joe@perches.com>
Date: Tue, 04 Jan 2011 05:20:02 +0000
Subject: Re: [patch] Staging: xgfib: put parenthesis in the right place
Message-Id: <1294118402.6617.8.camel@Joe-Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110104045807.GZ1886@bicker>
In-Reply-To: <20110104045807.GZ1886@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2011-01-04 at 07:58 +0300, Dan Carpenter wrote:
> diff --git a/drivers/staging/xgifb/vb_setmode.c b/drivers/staging/xgifb/vb_setmode.c
> @@ -3954,7 +3954,7 @@ void XGI_GetCRT2ResInfo(unsigned short ModeNo, unsigned short ModeIdIndex,
>  unsigned char XGI_IsLCDDualLink(struct vb_device_info *pVBInfo)
>  {
>  
> -	if ((((pVBInfo->VBInfo & SetCRT2ToLCD) | SetCRT2ToLCDA))
> +	if ((pVBInfo->VBInfo & (SetCRT2ToLCD | SetCRT2ToLCDA))
>  			&& (pVBInfo->LCDInfo & SetLCDDualLink)) /* shampoo0129 */

Perhaps more legible and standard as:

	if ((pVBInfo->VBInfo & (SetCRT2ToLCD | SetCRT2ToLCDA)) &&
	    (pVBInfo->LCDInfo & SetLCDDualLink))


