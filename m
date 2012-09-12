From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Sep 2012 08:50:57 +0000
Subject: Re: [balbi-usb:merge-result-for-greg 66/99] drivers/usb/core/hub.c:2654 usb_get_hub_port_power_state
Message-Id: <20120912085057.GC19396@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120912082622.GB27847@localhost>
In-Reply-To: <20120912082622.GB27847@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Sep 12, 2012 at 04:26:22PM +0800, Fengguang Wu wrote:
> Hi Felipe,
> 
> FYI, there are new smatch warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git merge-result-for-greg
> head:   23953bde3e4d6aa8780dc054f6ad9882ac63f4f4
> commit: e918fa161f510136fce45a524e934fe20e62c8b1 [66/99] Merge tag 'gadget-for-v3.7' into merge-result-for-greg
> 
> drivers/usb/core/hub.c:2654 usb_get_hub_port_power_state() error: doing dma on the stack ((null))

Smatch prints out a lot of these warnings.  I haven't looked at the
rules in a while, so maybe there is a bounce buffer somewhere where
it detects stack memory and allocates a DMA'able buffer?

It would be better if the function documentation for
usb_control_msg() said that the *data pointer had to be kmalloc()ed.

Also I wonder if Documentation/DMA-API-HOWTO.txt is out of data.
Are we allowed to DMA to vmalloc()ed memory yet?

regards,
dan carpenter

