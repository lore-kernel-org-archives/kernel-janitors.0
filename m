From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 15 Jul 2013 20:06:53 +0000
Subject: Re: request_region return value check
Message-Id: <20130715200653.GB5152@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130714173056.GA50500@gmail.com>
In-Reply-To: <20130714173056.GA50500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jul 15, 2013 at 10:35:27PM +0530, Vivek Subbarao wrote:
> On Mon, Jul 15, 2013 at 04:20:26PM +0300, Dan Carpenter wrote:
> > On Sun, Jul 14, 2013 at 11:00:58PM +0530, Vivek Subbarao wrote:
> > > There are many places where the return value from request_region is not
> > > checked for null value. This is required right ? I am just checking
> > > before I can send patched fixing them
> > 
> > Most of the time, but not always.
> > 
> > Sometimes people know it will succeed.  The first one I looked at
> > in drivers/acpi/acpi_processor.c the caller doesn't care if it
> > succeeds and there is a comment explaining why.
> >
> I see a lot of calls to request_region in __init calls. For example
> there is a call in netwinder-hw.c:wb977_init. Should they be checking
> for the return value ?

This is a very well defined specific hardware and they know it won't
fail or if it were to fail then the system couldn't boot anyway so
returning an error code doesn't do any good.

regards,
dan carpenter
