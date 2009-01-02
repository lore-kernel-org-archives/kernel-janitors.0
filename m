From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 02 Jan 2009 10:53:52 +0000
Subject: Re: [PATCH 1/2] sound: Use usb_set/get_intfdata
Message-Id: <s5hd4f6htbz.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0901011814080.20447@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0901011814080.20447@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: perex@perex.cz, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

At Thu, 1 Jan 2009 18:14:35 +0100 (CET),
Julia Lawall wrote:
> 
> From: Julia Lawall <julia@diku.dk>
> 
> Use the USB functions usb_get_intfdata and usb_set_intfdata instead of
> dev_get_drvdata and dev_set_drvdata, respectively.
> 
> The semantic patch that makes this change for the usb_get_intfdata case is
> as follows: (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @header@
> @@
> 
> #include <linux/usb.h>
> 
> @same depends on header@
> position p;
> @@
> 
> usb_get_intfdata@p(...) { ... }
> 
> @depends on header@
> position _p!=same.p;
> identifier _f;
> struct usb_interface*intf;
> @@
> 
> _f@_p(...) { <+...
> - dev_get_drvdata(&intf->dev)
> + usb_get_intfdata(intf)
> ...+> }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied now.  Thanks.


Takashi
