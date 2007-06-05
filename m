From: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 05 Jun 2007 04:08:24 +0000
Subject: [KJ] Re: [PATCH] bugfix GFP_KERNEL -> GFP_ATOMIC in spin_locked
Message-Id: <20070604210824.dfb7c2d9.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87odjvu1on.fsf@wanadoo.fr>
	<20070604210018.0eaa20a0.akpm@linux-foundation.org>
In-Reply-To: <20070604210018.0eaa20a0.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yoann Padioleau <padator@wanadoo.fr>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-scsi@vger.kernel.org, Seokmann Ju <seokmann.ju@lsil.com>, Sumant Patro <sumant.patro@lsi.com>, linux-usb-devel@lists.sourceforge.net

On Mon, 4 Jun 2007 21:00:18 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> > diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
> > index 544098d..9ec38e3 100644
> > --- a/drivers/usb/serial/io_ti.c
> > +++ b/drivers/usb/serial/io_ti.c
> > @@ -2351,7 +2351,7 @@ static int restart_read(struct edgeport_
> >  		urb->complete = edge_bulk_in_callback;
> >  		urb->context = edge_port;
> >  		urb->dev = edge_port->port->serial->dev;
> > -		status = usb_submit_urb(urb, GFP_KERNEL);
> > +		status = usb_submit_urb(urb, GFP_ATOMIC);
> >  	}
> >  	edge_port->ep_read_urb_state = EDGE_READ_URB_RUNNING;
> >  	edge_port->shadow_mcr |= MCR_RTS;
> > diff --git a/drivers/usb/serial/ti_usb_3410_5052.c b/drivers/usb/serial/ti_usb_3410_5052.c
> > index 4203e2b..10dc36f 100644
> > --- a/drivers/usb/serial/ti_usb_3410_5052.c
> > +++ b/drivers/usb/serial/ti_usb_3410_5052.c
> > @@ -1559,7 +1559,7 @@ static int ti_restart_read(struct ti_por
> >  		urb->complete = ti_bulk_in_callback;
> >  		urb->context = tport;
> >  		urb->dev = tport->tp_port->serial->dev;
> > -		status = usb_submit_urb(urb, GFP_KERNEL);
> > +		status = usb_submit_urb(urb, GFP_ATOMIC);
> >  	}
> >  	tport->tp_read_urb_state = TI_READ_URB_RUNNING;
> >  
> > diff --git a/drivers/usb/serial/whiteheat.c b/drivers/usb/serial/whiteheat.c
> > index 27c5f8f..1b01207 100644
> > --- a/drivers/usb/serial/whiteheat.c
> > +++ b/drivers/usb/serial/whiteheat.c
> > @@ -1116,7 +1116,7 @@ static int firm_send_command (struct usb
> >  	memcpy (&transfer_buffer[1], data, datasize);
> >  	command_port->write_urb->transfer_buffer_length = datasize + 1;
> >  	command_port->write_urb->dev = port->serial->dev;
> > -	retval = usb_submit_urb (command_port->write_urb, GFP_KERNEL);
> > +	retval = usb_submit_urb (command_port->write_urb, GFP_ATOMIC);
> >  	if (retval) {
> >  		dbg("%s - submit urb failed", __FUNCTION__);
> >  		goto exit;
> > @@ -1316,7 +1316,7 @@ static int start_command_port(struct usb
> >  		usb_clear_halt(serial->dev, command_port->read_urb->pipe);
> >  
> >  		command_port->read_urb->dev = serial->dev;
> > -		retval = usb_submit_urb(command_port->read_urb, GFP_KERNEL);
> > +		retval = usb_submit_urb(command_port->read_urb, GFP_ATOMIC);
> >  		if (retval) {
> >  			err("%s - failed submitting read urb, error %d", __FUNCTION__, retval);
> >  			goto exit;
> > @@ -1363,7 +1363,7 @@ static int start_port_read(struct usb_se
> >  		wrap = list_entry(tmp, struct whiteheat_urb_wrap, list);
> >  		urb = wrap->urb;
> >  		urb->dev = port->serial->dev;
> > -		retval = usb_submit_urb(urb, GFP_KERNEL);
> > +		retval = usb_submit_urb(urb, GFP_ATOMIC);
> >  		if (retval) {
> >  			list_add(tmp, &info->rx_urbs_free);
> >  			list_for_each_safe(tmp, tmp2, &info->rx_urbs_submitted) {
> 
> This part might make sense so I'll queue it for the USB guys to look at.
> 
> 

Everything in USB appears to already be fixed, apart from the io_ti.c bug.


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
