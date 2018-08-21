From: Johan Hovold <johan@kernel.org>
Date: Tue, 21 Aug 2018 09:39:32 +0000
Subject: Re: [PATCH] USB: serial: io_ti: array underflow in edge_interrupt_callback()
Message-Id: <20180821093932.GF14967@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180814090715.z4amswxtv5cwdria@kili.mountain>
In-Reply-To: <20180814090715.z4amswxtv5cwdria@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 14, 2018 at 12:07:15PM +0300, Dan Carpenter wrote:
> A malicious USB device could set port_number to -3 and we would
> underflow the edge_serial->serial->port[] array.

Good catch!

> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
> index 6d1d6efa3055..fa2af18c6efe 100644
> --- a/drivers/usb/serial/io_ti.c
> +++ b/drivers/usb/serial/io_ti.c
> @@ -1629,7 +1629,7 @@ static void edge_interrupt_callback(struct urb *urb)
>  	struct device *dev;
>  	unsigned char *data = urb->transfer_buffer;
>  	int length = urb->actual_length;
> -	int port_number;
> +	unsigned int port_number;

I'd prefer fixing the macro to never return a negative port number in
the first place instead of relying on conversion rules. These devices
only come with one or two ports and, while the protocol documentation is
hard to come by, it seems what we really want to do is just to check the
7th bit and thus change:

-#define TIUMP_GET_PORT_FROM_CODE(c)    (((c) >> 4) - 3)
+#define TIUMP_GET_PORT_FROM_CODE(c)    (((c) >> 6) & 0x01)

I only have a one-port device to test with, but I can at least confirm
that bits 0x30 are always set and that that's probably why subtraction
was used instead of masking out the relevant bit (i.e. it happened to
work).

This also avoids error messages such as

	bad port number 4294967293

should the ignored bits (0xb0) have unexpected values (e.g. 0).

>  	int function;
>  	int retval;
>  	__u8 lsr;

Turns out we had the same issue in ti_usb_3410_5052 which is based on
io_ti, but where a recent change converted the port macro to a static
helper. In case you found this using your static checkers, you may want
to look into why it didn't catch that one.

I'll submit two fixes to address this as per above.

Thanks,
Johan
