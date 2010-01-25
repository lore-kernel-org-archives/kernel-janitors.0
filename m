From: Johan Hovold <jhovold@gmail.com>
Date: Mon, 25 Jan 2010 20:54:16 +0000
Subject: Re: [patch] usb: io_edgeport: eliminate get_string()
Message-Id: <20100125205416.GA24856@localhost>
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

Should qualify that ack:

I don't think this patch should go to stable as it does not fix anything
severe. Worst case is that in the unlikely event that usb_control_msg
fails _and_ you have debugging enabled one may end up with 64 non-sense
characters in you log. There's no risk for any memory corruption
AFAICT.

The patch do however change the way communication is made at probe time
quite a bit (asking for language codes available, resends, first tries
to fetch strings using the maximum length then falls back to getting the
length first, etc.).

So except for the stable bit: 

Acked-by: Johan Hovold <jhovold@gmail.com>

