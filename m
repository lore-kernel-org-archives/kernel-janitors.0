From: Felipe Balbi <me@felipebalbi.com>
Date: Sat, 20 Mar 2010 20:09:07 +0000
Subject: Re: [PATCH 03/24] usb/otg/isp1301_omap: Fix dangling pointer
Message-Id: <20100320200907.GA3861@gandalf>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1269094385-16114-1-git-send-email-w.sang@pengutronix.de>
 <1269094385-16114-4-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1269094385-16114-4-git-send-email-w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Sat, Mar 20, 2010 at 03:12:44PM +0100, Wolfram Sang wrote:
> Fix this i2c-driver which missed setting clientdata to NULL before freeing the
> structure it points to. Found by a semantic patch, but fixed by hand.
> 
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: David Brownell <dbrownell@users.sourceforge.net>
> Cc: Greg Kroah-Hartman <gregkh@suse.de>

Acked-by: Felipe Balbi <felipe.balbi@nokia.com>

Greg,

if you wish, you can take queue it already unless Dave has any comments.

-- 
balbi
