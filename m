From: Greg KH <gregkh@linuxfoundation.org>
Date: Fri, 16 Aug 2013 18:55:55 +0000
Subject: Re: [PATCH 4/6] for fixing xhci_readl call in xhci_ring.c after removing xhci_hcd from function defi
Message-Id: <20130816185555.GA8677@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376679068-15404-1-git-send-email-kumargauravgupta3@gmail.com>
In-Reply-To: <1376679068-15404-1-git-send-email-kumargauravgupta3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 16, 2013 at 11:53:56AM -0700, Greg KH wrote:
> On Sat, Aug 17, 2013 at 12:21:08AM +0530, Kumar Gaurav wrote:
> > ---
> >  drivers/usb/host/xhci-ring.c |   12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> -ENO_SIGNED_OFF_BY :(
> 
> Also, where are the 5 other patches?

Nevermind, slow email server, sorry, I got them now.

greg k-h
