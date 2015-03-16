From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 16 Mar 2015 18:38:33 +0000
Subject: Re: [patch 2/2] serial: jsm: some off by one bugs
Message-Id: <20150316183833.GL10964@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150312170823.GB21911@mwanda>
 <20150316174743.GB6037@oc0812247204.ltc.br.ibm.com>
In-Reply-To: <20150316174743.GB6037@oc0812247204.ltc.br.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cascardo@linux.vnet.ibm.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.cz>, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-serial@vger.kernel.org

On Mon, Mar 16, 2015 at 02:47:43PM -0300, cascardo@linux.vnet.ibm.com wrote:
> On Thu, Mar 12, 2015 at 08:08:24PM +0300, Dan Carpenter wrote:
> > "brd->nasync" amd "brd->maxports" are the same.  They hold the number of
> > filled out channels in the brd->channels[] array.  These tests should
> > be ">=" instead of ">" so that we don't read one element past the end.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/tty/serial/jsm/jsm_cls.c b/drivers/tty/serial/jsm/jsm_cls.c
> > index bfb0681..4eb12a9 100644
> > --- a/drivers/tty/serial/jsm/jsm_cls.c
> > +++ b/drivers/tty/serial/jsm/jsm_cls.c
> > @@ -570,7 +570,7 @@ static inline void cls_parse_isr(struct jsm_board *brd, uint port)
> >  	 * verified in the interrupt routine.
> >  	 */
> > 
> > -	if (port > brd->nasync)
> > +	if (port >= brd->nasync)
> >  		return;
> > 
> >  	ch = brd->channels[port];
> > diff --git a/drivers/tty/serial/jsm/jsm_neo.c b/drivers/tty/serial/jsm/jsm_neo.c
> > index 7291c21..f413ef0 100644
> > --- a/drivers/tty/serial/jsm/jsm_neo.c
> > +++ b/drivers/tty/serial/jsm/jsm_neo.c
> 
> Hi, Dan.
> 
> It looks like you missed the fix for neo_parse_isr.
> 
> Would you send a v2 fixing that as well?

Yes.  Thanks for catching this.

regards,
dan carpenter

