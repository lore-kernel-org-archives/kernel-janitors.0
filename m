From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 28 Jun 2020 14:13:39 +0000
Subject: Re: [PATCH] usb: gadget: function: printer: The device interface is reset and should return error co
Message-Id: <20200628141339.GA3131191@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <37bf94a0-92a0-ca4e-a4e4-5dd44aef2b88@web.de>
In-Reply-To: <37bf94a0-92a0-ca4e-a4e4-5dd44aef2b88@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Zhang Qiang <qiang.zhang@windriver.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Felipe Balbi <felipe.balbi@linux.intel.com>

On Sun, Jun 28, 2020 at 03:43:10PM +0200, Markus Elfring wrote:
> I suggest to choose a more succinct patch subject.
> 
> 
> > After the device is disconnected from the host side, the interface of
> > the device is reset. If the userspace operates the device again,
> > an error code should be returned.
> 
> Please use an imperative wording for the commit message.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?idq9fdd32921fb7e3208db8832d32ae1c2d68900f#n151
> 
> 
> > Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> 
> Did you really specify your real name here?
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
