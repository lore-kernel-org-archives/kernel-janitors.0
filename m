From: Johan Hovold <johan@kernel.org>
Date: Tue, 03 Jul 2018 12:11:43 +0000
Subject: Re: [PATCH] gnss: fix potential error pointer dereference
Message-Id: <20180703121143.GP9802@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180703115921.7h35wi73oym3use5@kili.mountain>
In-Reply-To: <20180703115921.7h35wi73oym3use5@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Jul 03, 2018 at 02:59:22PM +0300, Dan Carpenter wrote:
> The gnss_allocate_device() function returns a mix of NULL and error
> pointers on error.  It should only return one or the other.  Since the
> callers both check for NULL, I've modified it to return NULL on error.
> 
> Fixes: 10f146639fee ("gnss: add receiver type support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Ouch, thanks for catching this!

I think you got the wrong commit for the fixes tag above, however. That
should be:

Fixes: 2b6a44035143 ("gnss: add GNSS receiver subsystem")

Not sure if you want to send a v2, or if Greg can fix that when
applying. Apart from that:

Acked-by: Johan Hovold <johan@kernel.org>

Johan
