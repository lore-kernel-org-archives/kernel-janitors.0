From: Greg KH <gregkh@linuxfoundation.org>
Date: Fri, 16 Aug 2013 18:57:02 +0000
Subject: Re: [PATCH 1/6] drivers:usb:host:xhci.h Removing xhci_hcd from argument
Message-Id: <20130816185702.GA8768@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376678922-15217-1-git-send-email-kumargauravgupta3@gmail.com>
In-Reply-To: <1376678922-15217-1-git-send-email-kumargauravgupta3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Aug 17, 2013 at 12:18:42AM +0530, Kumar Gaurav wrote:
> Removed struct xhci_hcd from xhci_readl fucntion as it's no more in use.
> ---
>  drivers/usb/host/xhci.h |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

When sending kernel patches, it helps to run them through the
scripts/checkpatch.pl tool first, before sending them out to the world.
It will point out problems that are in the patch that you can fix up
before someone like me points it out again :)

Care to run all of these through that tool and fix up the issues it
points out?

thanks,

greg k-h
