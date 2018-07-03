From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Jul 2018 12:23:09 +0000
Subject: Re: [PATCH] gnss: fix potential error pointer dereference
Message-Id: <20180703122309.x6m4hrawpg2tb2bu@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180703115921.7h35wi73oym3use5@kili.mountain>
 <20180703121143.GP9802@localhost>
In-Reply-To: <20180703121143.GP9802@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jul 03, 2018 at 02:11:43PM +0200, Johan Hovold wrote:
> On Tue, Jul 03, 2018 at 02:59:22PM +0300, Dan Carpenter wrote:
> > The gnss_allocate_device() function returns a mix of NULL and error
> > pointers on error.  It should only return one or the other.  Since the
> > callers both check for NULL, I've modified it to return NULL on error.
> > 
> > Fixes: 10f146639fee ("gnss: add receiver type support")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Ouch, thanks for catching this!
> 
> I think you got the wrong commit for the fixes tag above, however. That
> should be:
> 
> Fixes: 2b6a44035143 ("gnss: add GNSS receiver subsystem")
> 

Oops.  That's what I intended, yes.  I will resend.

regards,
dan carpenter

