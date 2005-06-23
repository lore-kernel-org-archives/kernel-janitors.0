From: randy_dunlap <rdunlap@xenotime.net>
Date: Thu, 23 Jun 2005 21:45:31 +0000
Subject: Re: [KJ] [PATCH] (2/2) - trailing, 80th and similar things
Message-Id: <20050623144531.1db2b896.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62579593217774865=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050623193601.GB4790@voyager>
In-Reply-To: <20050623193601.GB4790@voyager>
To: kernel-janitors@vger.kernel.org

--===============62579593217774865==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Jun 2005 21:36:01 +0200 Carlo Perassi wrote:

| Reading this driver I noticed some trailing whitespaces and tabs so I
| removed them with some 80th column fitting and a few more similar
| things.
| 
| Signed-off-by: Carlo Perassi <carlo@linux.it>
| ---
|  drivers/usb/serial/cypress_m8.c |  216 ++++++++++++++++++++++------------------
|  1 files changed, 124 insertions(+), 92 deletions(-)
| 
| Index: linux-2.6.12/drivers/usb/serial/cypress_m8.c
| ===================================================================
| --- linux-2.6.12.orig/drivers/usb/serial/cypress_m8.c
| +++ linux-2.6.12/drivers/usb/serial/cypress_m8.c
| @@ -976,7 +986,8 @@
|  			case CS6: data_bits = 1; break;
|  			case CS7: data_bits = 2; break;
|  			case CS8: data_bits = 3; break;
| -			default: err("%s - CSIZE was set, but not CS5-CS8", __FUNCTION__); data_bits = 3;
| +			default: err("%s - CSIZE was set, but not CS5-CS8",
| +						 __FUNCTION__); data_bits = 3;

Don't put the "data_bits = value;" on the same line as the end of the
err() function.

| @@ -991,63 +1002,75 @@
|  	} else {
|  		baud_mask = (cflag & CBAUD);
|  		switch(baud_mask) {
| -			case B300: dbg("%s - setting baud 300bps", __FUNCTION__); break;
| -			case B600: dbg("%s - setting baud 600bps", __FUNCTION__); break;
| -			case B1200: dbg("%s - setting baud 1200bps", __FUNCTION__); break;
| -			case B2400: dbg("%s - setting baud 2400bps", __FUNCTION__); break;
| -			case B4800: dbg("%s - setting baud 4800bps", __FUNCTION__); break;
| -			case B9600: dbg("%s - setting baud 9600bps", __FUNCTION__); break;
| -			case B19200: dbg("%s - setting baud 19200bps", __FUNCTION__); break;
| -			case B38400: dbg("%s - setting baud 38400bps", __FUNCTION__); break;
| -			case B57600: dbg("%s - setting baud 57600bps", __FUNCTION__); break;
| -			case B115200: dbg("%s - setting baud 115200bps", __FUNCTION__); break;
| -			default: dbg("%s - unknown masked baud rate", __FUNCTION__);
| +			case B300: dbg("%s - setting baud 300bps",
| +						__FUNCTION__); break;
| +			case B600: dbg("%s - setting baud 600bps",
| +						__FUNCTION__); break;
| +			case B1200: dbg("%s - setting baud 1200bps",
| +						__FUNCTION__); break;
| +			case B2400: dbg("%s - setting baud 2400bps",
| +						__FUNCTION__); break;
| +			case B4800: dbg("%s - setting baud 4800bps",
| +						__FUNCTION__); break;
| +			case B9600: dbg("%s - setting baud 9600bps",
| +						__FUNCTION__); break;
| +			case B19200: dbg("%s - setting baud 19200bps",
| +						__FUNCTION__); break;
| +			case B38400: dbg("%s - setting baud 38400bps",
| +						__FUNCTION__); break;
| +			case B57600: dbg("%s - setting baud 57600bps",
| +						__FUNCTION__); break;
| +			case B115200: dbg("%s - setting baud 115200bps",
| +						__FUNCTION__); break;
| +			default: dbg("%s - unknown masked baud rate",
| +						__FUNCTION__);

Well, these are still ugly, sorry.  ISTM that we have to live with them
the way that they were or go completely to one statement per line.
I.e., put the "break;" on a line by itself, or even more, put the
"case" on a line by itself also:

			case B300:
				dbg("%s - setting baud 300bps",
						__FUNCTION__);
				break;

|  		}
|  		priv->line_control = (CONTROL_DTR | CONTROL_RTS);
|  	}
|  	spin_unlock_irqrestore(&priv->lock, flags);
|  	
| -	dbg("%s - sending %d stop_bits, %d parity_enable, %d parity_type, %d data_bits (+5)", __FUNCTION__,
| -	    stop_bits, parity_enable, parity_type, data_bits);
| -
| -	cypress_serial_control(port, baud_mask, data_bits, stop_bits, parity_enable,
| -			       parity_type, 0, CYPRESS_SET_CONFIG);
| -
| -	/* we perform a CYPRESS_GET_CONFIG so that the current settings are filled into the private structure
| -         * this should confirm that all is working if it returns what we just set */
| +	dbg("%s - sending %d stop_bits, %d parity_enable, %d parity_type, \
| +			%d data_bits (+5)", __FUNCTION__, stop_bits,
| +			parity_enable, parity_type, data_bits);

Yes, this dbg() looks cleaner, except that I don't think you want the \
followed by spaces/tabs before the "%d data bits".  What we usually do is
something like this:

| +	dbg("%s - sending %d stop_bits, %d parity_enable, %d parity_type, "
| +			"%d data_bits (+5)", __FUNCTION__, stop_bits,
| +			parity_enable, parity_type, data_bits);

| @@ -1110,7 +1133,8 @@
|  
|  		result = usb_submit_urb(port->interrupt_in_urb, GFP_ATOMIC);
|  		if (result)
| -			dev_err(&port->dev, "%s - failed submitting read urb, error %d\n", __FUNCTION__, result);
| +			dev_err(&port->dev, "%s - failed submitting read urb, \
| +					error %d\n", __FUNCTION__, result);
|  	}
|  }

Fix the string break (don't use \, use double-quotes).

|  	if (port->open_count > 0) {
|  	usb_fill_int_urb(port->interrupt_in_urb, port->serial->dev,

It looks like this function call above should be indented...

| -		usb_rcvintpipe(port->serial->dev, port->interrupt_in_endpointAddress),
| -		port->interrupt_in_urb->transfer_buffer,
| -		port->interrupt_in_urb->transfer_buffer_length,
| -		cypress_read_int_callback, port,
| -		interval);
| +			usb_rcvintpipe(port->serial->dev,
| +				port->interrupt_in_endpointAddress),
| +			port->interrupt_in_urb->transfer_buffer,
| +			port->interrupt_in_urb->transfer_buffer_length,
| +			cypress_read_int_callback, port, interval);
|  	result = usb_submit_urb(port->interrupt_in_urb, GFP_ATOMIC);
|  	if (result)
| -		dev_err(&urb->dev->dev, "%s - failed resubmitting read urb, error %d\n", __FUNCTION__, result);
| +		dev_err(&urb->dev->dev, "%s - failed resubmitting read urb, \
| +				error %d\n", __FUNCTION__, result);

Don't use \ to join the lines, just break it with double-quote marks
like I did above.


---
~Randy

--===============62579593217774865==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62579593217774865==--
