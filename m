From: Greg KH <gregkh@linuxfoundation.org>
Date: Fri, 16 Aug 2013 18:59:57 +0000
Subject: Re: [PATCH 6/6] for fixing xhci_readl call in xhci_dbg.c after removing xhci_hcd from function defin
Message-Id: <20130816185957.GD8768@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Aug 17, 2013 at 12:24:47AM +0530, Kumar Gaurav wrote:
> ---
>  drivers/usb/host/xhci-dbg.c |   36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)

Why is this needed?  And isn't it needed earlier in this series, as the
build is broken there, right?  No patch can introduce a build error,
sorry.

thanks,

greg k-h
