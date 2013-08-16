From: Greg KH <gregkh@linuxfoundation.org>
Date: Fri, 16 Aug 2013 18:58:39 +0000
Subject: Re: [PATCH 2/6] drivers/usb/host/xhci.c Fixing xhci_readl call
Message-Id: <20130816185839.GC8768@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376678958-15316-1-git-send-email-kumargauravgupta3@gmail.com>
In-Reply-To: <1376678958-15316-1-git-send-email-kumargauravgupta3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Aug 17, 2013 at 12:19:18AM +0530, Kumar Gaurav wrote:
> Fixed xhci_readl call issue as per definition modified in patch
> 0019-drivers-usb-host-xhci.h-Removing-xhci_hcd-from-argum.patch

What patch is that?  It looks like a filename, not a git commit id.  Can
you please fix this up?

> Signed-off-by: Kumar Gaurav <kumargauravgupta3@gmail.com>

Yeah, a signed-off-by line!  (hint, please put that in your other
patches as well.)

thanks,

greg k-h
