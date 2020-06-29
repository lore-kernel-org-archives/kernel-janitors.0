From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 29 Jun 2020 08:10:39 +0000
Subject: Re: [PATCH 2/2] usb: mtu3: fix NULL pointer dereference
Message-Id: <20200629081039.GA1221843@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
 <1593410434-19406-2-git-send-email-chunfeng.yun@mediatek.com>
 <99fc1f6e-7907-6723-612a-8b68ffa871e5@web.de>
In-Reply-To: <99fc1f6e-7907-6723-612a-8b68ffa871e5@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, Colin Ian King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org

On Mon, Jun 29, 2020 at 10:00:22AM +0200, Markus Elfring wrote:
> > Some pointers are dereferenced before successful checks.
> 
> I suggest to reconsider and improve the change description.
> 
> * Would a null pointer dereference be possible only with the variables “mep”
>   and “mreq” in the implementation of the function “mtu3_gadget_dequeue”?
> 
> * How do you think about to adjust any more variable initialisations?
> 
> * Will it become helpful to add the tag “Fixes” to the commit message?
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
