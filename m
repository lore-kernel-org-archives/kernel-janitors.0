From: Johan Hovold <johan@kernel.org>
Date: Thu, 28 Jan 2021 09:56:00 +0000
Subject: Re: [PATCH] USB: serial: mos7720: Fix error code in mos7720_write()
Message-Id: <YBKKMK9UfRjB52sW@hovoldconsulting.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YBKFW60qMJbtjvum@mwanda>
In-Reply-To: <YBKFW60qMJbtjvum@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jan 28, 2021 at 12:35:23PM +0300, Dan Carpenter wrote:
> This code should return -ENOMEM if the kmalloc() fails but instead
> it returns success.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The first error path is probably wrong as well?
> 
> drivers/usb/serial/mos7720.c
>   1077          /* try to find a free urb in the list */
>   1078          urb = NULL;
>   1079  
>   1080          for (i = 0; i < NUM_URBS; ++i) {
>   1081                  if (mos7720_port->write_urb_pool[i] &&
>   1082                      mos7720_port->write_urb_pool[i]->status != -EINPROGRESS) {
>   1083                          urb = mos7720_port->write_urb_pool[i];
>   1084                          dev_dbg(&port->dev, "URB:%d\n", i);
>   1085                          break;
>   1086                  }
>   1087          }
>   1088  
>   1089          if (urb = NULL) {
>   1090                  dev_dbg(&port->dev, "%s - no more free urbs\n", __func__);
>   1091                  goto exit;
> 
> Should return -ENODEV?

No, this bit is correct (modulo the missing locking and reliance on the
URB status). When there are no free URBs we want the tty layer to
retry later.

>   1092          }
> 
>  drivers/usb/serial/mos7720.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
> index ed347a6d50ba..aa55169796a3 100644
> --- a/drivers/usb/serial/mos7720.c
> +++ b/drivers/usb/serial/mos7720.c
> @@ -1094,8 +1094,10 @@ static int mos7720_write(struct tty_struct *tty, struct usb_serial_port *port,
>  	if (urb->transfer_buffer = NULL) {
>  		urb->transfer_buffer = kmalloc(URB_TRANSFER_BUFFER_SIZE,
>  					       GFP_ATOMIC);
> -		if (!urb->transfer_buffer)
> +		if (!urb->transfer_buffer) {
> +			bytes_sent = -ENOMEM;
>  			goto exit;
> +		}
>  	}
>  	transfer_size = min(count, URB_TRANSFER_BUFFER_SIZE);

Now applied, thanks.

Johan
