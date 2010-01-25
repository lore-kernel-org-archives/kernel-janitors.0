From: Greg KH <greg@kroah.com>
Date: Mon, 25 Jan 2010 20:40:55 +0000
Subject: Re: [patch] usb: io_edgeport: eliminate get_string()
Message-Id: <20100125204055.GA22221@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100125115333.GD3061@bicker>
In-Reply-To: <20100125115333.GD3061@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jan 25, 2010 at 02:53:33PM +0300, Dan Carpenter wrote:
> Johan Hovold points out that get_string() is basically just a re-implimentation
> of usb_string().  It is also buggy.  It does DMA on the stack and it doesn't
> handle negative returns from usb_get_descriptor().  Plus unicode_to_ascii() is 
> a rubbish function and moving to usb_string() avoids using it.
> 
> Let's eliminate get_string() entirely.

Hm, for some reason I couldn't use usb_string() when I originally wrote
this code (way back in 1999).  I can't recall what it is, but have you
tested this with an edgeport device to verify that it doesn't break
anything?

thanks,

greg k-h
