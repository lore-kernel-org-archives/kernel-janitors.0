From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat, 16 May 2020 06:30:45 +0000
Subject: Re: [PATCH][next] USB: EHCI: ehci-mv: fix less than zero comparison of an unsigned int
Message-Id: <20200516063045.GA3846431@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200515165453.104028-1-colin.king@canonical.com>
 <20200515172121.GA5498@rowland.harvard.edu>
In-Reply-To: <20200515172121.GA5498@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Colin King <colin.king@canonical.com>, Zhang Shengju <zhangshengju@cmss.chinamobile.com>, Tang Bin <tangbin@cmss.chinamobile.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, May 15, 2020 at 01:21:21PM -0400, Alan Stern wrote:
> On Fri, May 15, 2020 at 05:54:53PM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The comparison of hcd->irq to less than zero for an error check will
> > never be true because hcd->irq is an unsigned int.  Fix this by
> > assigning the int retval to the return of platform_get_irq and checking
> > this for the -ve error condition and assigning hcd->irq to retval.
> > 
> > Addresses-Coverity: ("Unsigned compared against 0")
> > Fixes: c856b4b0fdb5 ("USB: EHCI: ehci-mv: fix error handling in mv_ehci_probe()")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> 
> Thanks to Coverity for spotting this.  Any reason why it didn't spot 
> exactly the same mistake in the ohci-da8xx.c driver?

I think Coverity only runs on a limited kernel configuration and does
not build everything :(
