From: Alan Stern <stern@rowland.harvard.edu>
Date: Fri, 22 Sep 2017 20:50:47 +0000
Subject: Re: [PATCH v2 1/2] USB: devio: Prevent integer overflow in proc_do_submiturb()
Message-Id: <Pine.LNX.4.44L0.1709221650170.6943-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170922204324.i2i2g6zzt5s4kyen@mwanda>
In-Reply-To: <20170922204324.i2i2g6zzt5s4kyen@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 22 Sep 2017, Dan Carpenter wrote:

> There used to be an integer overflow check in proc_do_submiturb() but
> we removed it.  It turns out that it's still required.  The
> uurb->buffer_length variable is a signed integer and it's controlled by
> the user.  It can lead to an integer overflow when we do:
> 
> 	num_sgs = DIV_ROUND_UP(uurb->buffer_length, USB_SG_SIZE);
> 
> If we strip away the macro then that line looks like this:
> 
> 	num_sgs = (uurb->buffer_length + USB_SG_SIZE - 1) / USB_SG_SIZE;
>                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> It's the first addition which can overflow.
> 
> Fixes: 1129d270cbfb ("USB: Increase usbfs transfer limit")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Cast the ->buffer_length to unsigned int which is more readable than
>     relying on type promotion.

For both 1/2 and 2/2:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

