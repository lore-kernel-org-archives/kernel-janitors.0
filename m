From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 05 Jun 2020 09:14:49 +0000
Subject: Re: [PATCH] usb: gadget: function: printer: Fix use-after-free in __lock_acquire()
Message-Id: <20200605091449.GA2321638@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5207d179-0a7d-b5ff-af34-102fb21028b5@web.de>
In-Reply-To: <5207d179-0a7d-b5ff-af34-102fb21028b5@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Zhang Qiang <qiang.zhang@windriver.com>
Cc: linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@kernel.org>, Kyungtae Kim <kt0755@gmail.com>

On Fri, Jun 05, 2020 at 10:57:55AM +0200, Markus Elfring wrote:
> > Fix this by increase object reference count.
> 
> I find this description incomplete according to the proposed changes.
> 
> Would you like to add the tag “Fixes” to the commit message?

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.  You seem to
have sent a nonsensical or otherwise pointless review comment to a patch
submission on a Linux kernel developer mailing list.

I strongly suggest that you not do this anymore.  Please do not bother
developers who are actively working to produce patches and features with
comments that, in the end, are a waste of time.

Patch submitter, please ignore this suggestion, it is not needed to be
followed at all, as the person/bot/AI that sent it is on almost all
Linux kernel maintainer's blacklists and is ignored by them.  Please
feel free to also do the same.

thanks,

greg k-h's patch email bot
