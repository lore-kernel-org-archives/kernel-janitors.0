From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 29 Jun 2020 08:10:47 +0000
Subject: Re: [PATCH 1/2] usb: mtu3: disable USB2 LPM
Message-Id: <20200629081047.GB1221843@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
 <af16d716-8bb3-ea1f-e410-b27443f74c31@web.de>
In-Reply-To: <af16d716-8bb3-ea1f-e410-b27443f74c31@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org

On Mon, Jun 29, 2020 at 09:30:58AM +0200, Markus Elfring wrote:
> > A SuperSpeed device shall include the USB 2.0 extension descriptor
> > and shall support LPM when operating in USB 2.0 HS mode(see usb3.2
> > spec9.6.2.1). But we always don't support it, so disable it by
> > default, otherwise device will enter LPM suspend mode when
> > connected to Win10 system.
> 
> How do you think about a wording variant like the following?
> 
>    Change description:
>    A SuperSpeed device shall include the USB 2.0 extension descriptor
>    and shall support Link Power Management when operating in USB 2.0
>    High Speed mode. (See also: USB 3.2 specification 9.6.2.1)
>    But we do not support it generally. Thus disable this functionality
>    by default.
>    Otherwise, the device will enter LPM suspend mode when connected
>    to Win10 system.
> 
> 
> Would you like to add the tag “Fixes” to the commit message?
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
