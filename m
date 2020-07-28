From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 28 Jul 2020 15:54:50 +0000
Subject: Re: [PATCH] m68k/amiga: Add missing platform_device_unregister() call in amiga_init_devices()
Message-Id: <20200728155450.GC4178776@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1e12105b-aa72-11a2-74f6-c789f8ceaaa3@web.de>
In-Reply-To: <1e12105b-aa72-11a2-74f6-c789f8ceaaa3@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Qinglang Miao <miaoqinglang@huawei.com>, linux-m68k@lists.linux-m68k.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>

On Tue, Jul 28, 2020 at 04:50:06PM +0200, Markus Elfring wrote:
> > Add the missing platform_device_unregister() before return
> > from amiga_init_devices() in the error handling case.
> 
> Will the tag “Fixes” become helpful for the commit message?
> 
> 
> …
> > +++ b/arch/m68k/amiga/platform.c
> > @@ -188,8 +188,10 @@  static int __init amiga_init_devices(void)
> >  			return PTR_ERR(pdev);
> >  		error = platform_device_add_data(pdev, &a1200_ide_pdata,
> >  						 sizeof(a1200_ide_pdata));
> > -		if (error)
> > +		if (error) {
> > +			platform_device_unregister(pdev);
> >  			return error;
> > +		}
> >  	}
> …
> 
> I suggest to add a jump target for the desired exception handling.
> 
>  		if (error)
> +			goto unregister_device;
> 
> 
> Regards,
> Markus

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
