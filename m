From: Greg KH <greg@kroah.com>
Date: Mon, 25 Jan 2010 20:41:36 +0000
Subject: Re: [patch] usb: io_edgeport: eliminate get_string()
Message-Id: <20100125204136.GB22221@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100125115333.GD3061@bicker>
In-Reply-To: <20100125115333.GD3061@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jan 25, 2010 at 05:57:13PM +0100, Johan Hovold wrote:
> On Mon, Jan 25, 2010 at 02:53:33PM +0300, Dan Carpenter wrote:
> > Johan Hovold points out that get_string() is basically just a re-implimentation
> > of usb_string().  It is also buggy.  It does DMA on the stack and it doesn't
> > handle negative returns from usb_get_descriptor().  Plus unicode_to_ascii() is 
> > a rubbish function and moving to usb_string() avoids using it.
> > 
> > Let's eliminate get_string() entirely.
> > 
> > Reported-by: Johan Hovold <jhovold@gmail.com>
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > Cc: stable@kernel.org
> 
> Acked.
> 
> How do we generally deal with patches with multiple authors? This patch
> is a logical and obvious extension of the patch I submitted yesterday,
> which in turn was a fix (implemented from scratch) for two bugs pointed
> out by Dan.
> 
> This particular change is trivial of course, but are there any general
> guidelines for such cases?

No, not really.  If you can think of something that would work with git
as-is, I'm sure that there would be people interested.

thanks,

greg k-h
