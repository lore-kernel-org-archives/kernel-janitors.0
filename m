From: Alan Stern <stern@rowland.harvard.edu>
Date: Thu, 21 Sep 2017 14:40:53 +0000
Subject: Re: [PATCH] USB: devio: Prevent integer overflow in proc_do_submiturb()
Message-Id: <Pine.LNX.4.44L0.1709211038070.1423-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170921071622.ue2oqayfivloxk7w@mwanda>
In-Reply-To: <20170921071622.ue2oqayfivloxk7w@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 21 Sep 2017, Dan Carpenter wrote:

> On Thu, Sep 21, 2017 at 10:17:03AM -0400, Alan Stern wrote:
> > On Thu, 21 Sep 2017, Dan Carpenter wrote:
> > 
> > > There used to be an integer overflow check in proc_do_submiturb() but
> > > it accidentally got removed.  We need to put it back.  The
> > 
> > The removal was deliberate, not accidental.  :-)
> > 
> > > uurb->buffer_length variable is a signed integer and it's controlled by
> > > the user.  It can lead to an integer overflow when we do:
> > > 
> > > 	num_sgs = DIV_ROUND_UP(uurb->buffer_length, USB_SG_SIZE);
> > 
> > Sorry, I don't understand.  How can division by 16384 lead to an
> > integer overflow?
> 
> It looks like this when you unwrap the macro:
> 
> 	num_sgs = (uurb->buffer_length + USB_SG_SIZE - 1) / USB_SG_SIZE;
>                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This first addition can overflow.

Ah, very good point.  Okay:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Would you like to submit a second patch addressing the other problems I 
outlined?

Alan Stern

