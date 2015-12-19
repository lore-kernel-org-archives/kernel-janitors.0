From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 19 Dec 2015 21:04:14 +0000
Subject: Re: [PATCH] USB-FHCI: Use a signed return type for fhci_create_ep()
Message-Id: <20151219210414.GW5284@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5675BAE0.2010304@users.sourceforge.net>
 <20151219202706.GT5284@mwanda>
 <5675C426.7040602@users.sourceforge.net>
In-Reply-To: <5675C426.7040602@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sat, Dec 19, 2015 at 09:55:02PM +0100, SF Markus Elfring wrote:
> > Just make it an int.
> 
> Thanks for your suggestion.
> 
> Will any more software developers prefer this data type
> at some source code places?
> 

Use s32 if the hardware spec specifies that you must.  Otherwise prefer
ordinary types.

> 
> > The caller also casts it to u32...
> 
> Do you want to get rid of similar casts in affected functions?

If you want, that would be great.  I just enjoy complaining generally,
though.  :P

regards,
dan carpenter

