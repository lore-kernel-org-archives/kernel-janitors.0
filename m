From: Greg KH <greg@kroah.com>
Date: Wed, 18 Feb 2004 00:10:09 +0000
Subject: Re: [Kernel-janitors] [patch 2.6.2] some stv680 fixes
Message-Id: <20040218001009.GA4702@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200402152006.15059.domen@coderock.org>
In-Reply-To: <200402152006.15059.domen@coderock.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Feb 15, 2004 at 08:06:14PM +0100, Domen Puncer wrote:
> Hi.
> 
> - swapRGB is already initialized to 0
> - change "swapRGB_on = 1" to match in-source documentation
> - submit urb with GFP_ATOMIC (interrupt context) - this made driver
>    unusable because of "might_sleep" messages.
> - group some "case"s
> - release vdev on fail
> - remove "kfree(0)" checking
> 
> Compiles, works.

Thanks, I've applied this to my trees and will pass it on.

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
