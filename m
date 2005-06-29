From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 29 Jun 2005 16:49:51 +0000
Subject: [KJ] cleanup-drivers_usb_serial_cypress_m8.patch
Message-Id: <200506292049.52068.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> Reading this driver I noticed some trailing whitespaces and tabs so I
> removed them with some 80th column fitting and a few more similar
> things.

> --- quilt.orig/drivers/usb/serial/cypress_m8.c
> +++ quilt/drivers/usb/serial/cypress_m8.c

> -			tty->termios->c_cflag = B4800 | CS8 | CREAD | HUPCL | CLOCAL;
> +			tty->termios->c_cflag = B4800 | CS8 | CREAD | HUPCL |
> +				CLOCAL;

Well, this should be changed to:

			tty->termios->c_cflag 					B4800 | CS8 | CREAD | HUPCL | CLOCAL;

> -			tty->termios->c_cflag = B9600 | CS8 | CREAD | HUPCL | CLOCAL;
> +			tty->termios->c_cflag = B9600 | CS8 | CREAD | HUPCL |
> +				CLOCAL;

> -			priv->diff_status |= priv->current_status ^ priv->prev_status;
> +			priv->diff_status |= priv->current_status ^
> +				priv->prev_status;

IMO, better
			priv->diff_status |				priv->current_status ^ priv->prev_status;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
