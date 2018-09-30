From: Johan Hovold <johan@kernel.org>
Date: Sun, 30 Sep 2018 16:02:24 +0000
Subject: Re: [PATCH -next] USB: cypress_m8: remove set but not used variables 'actual_size, iflag'
Message-Id: <20180930160224.GG3332@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538214843-182555-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538214843-182555-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Sep 29, 2018 at 09:54:03AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/usb/serial/cypress_m8.c: In function 'cypress_send':
> drivers/usb/serial/cypress_m8.c:689:33: warning:
>  variable 'actual_size' set but not used [-Wunused-but-set-variable]
> 
> drivers/usb/serial/cypress_m8.c: In function 'cypress_set_termios':
> drivers/usb/serial/cypress_m8.c:866:18: warning:
>  variable 'iflag' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/usb/serial/cypress_m8.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/serial/cypress_m8.c b/drivers/usb/serial/cypress_m8.c
> index 31c6091..98dff12 100644
> --- a/drivers/usb/serial/cypress_m8.c
> +++ b/drivers/usb/serial/cypress_m8.c
> @@ -686,7 +686,7 @@ static int cypress_write(struct tty_struct *tty, struct usb_serial_port *port,
>  
>  static void cypress_send(struct usb_serial_port *port)
>  {
> -	int count = 0, result, offset, actual_size;
> +	int count = 0, result, offset;
>  	struct cypress_private *priv = usb_get_serial_port_data(port);
>  	struct device *dev = &port->dev;
>  	unsigned long flags;
> @@ -758,12 +758,6 @@ static void cypress_send(struct usb_serial_port *port)
>  	priv->write_urb_in_use = 1;
>  	spin_unlock_irqrestore(&priv->lock, flags);
>  
> -	if (priv->cmd_ctrl)
> -		actual_size = 1;
> -	else
> -		actual_size = count +
> -			      (priv->pkt_fmt = packet_format_1 ? 2 : 1);
> -

This looks like we have a bug in the driver, and sure enough we do.
Commit 9aa8dae7b1fa ("cypress_m8: use usb_fill_int_urb where
appropriate") incorrectly started setting the transfer length to the
size of the buffer.

I've prepared a fix to this.

>  	usb_serial_debug_data(dev, __func__, port->interrupt_out_size,
>  			      port->interrupt_out_urb->transfer_buffer);
>  
> @@ -863,7 +857,7 @@ static void cypress_set_termios(struct tty_struct *tty,
>  	struct cypress_private *priv = usb_get_serial_port_data(port);
>  	struct device *dev = &port->dev;
>  	int data_bits, stop_bits, parity_type, parity_enable;
> -	unsigned cflag, iflag;
> +	unsigned int cflag;
>  	unsigned long flags;
>  	__u8 oldlines;
>  	int linechange = 0;
> @@ -899,7 +893,6 @@ static void cypress_set_termios(struct tty_struct *tty,
>  	tty->termios.c_cflag &= ~(CMSPAR|CRTSCTS);
>  
>  	cflag = tty->termios.c_cflag;
> -	iflag = tty->termios.c_iflag;
>  
>  	/* check if there are new settings */
>  	if (old_termios) {

Would you mind resending just this chunk as a v2?

Thanks,
Johan
