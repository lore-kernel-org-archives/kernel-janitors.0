From: Johan Hovold <johan@kernel.org>
Date: Thu, 30 Jan 2020 10:12:47 +0000
Subject: Re: [PATCH] USB: serial: ir-usb: Silence harmless uninitialized variable warning
Message-Id: <20200130101247.GB8871@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200129173037.cvrb3lcddsml54h5@kili.mountain>
In-Reply-To: <20200129173037.cvrb3lcddsml54h5@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 29, 2020 at 08:30:37PM +0300, Dan Carpenter wrote:
> The "actual_length" variable might be uninitialized on some failure
> paths.  It's harmless but static analysis tools like Smatch complain
> and at runtime the UBSan tool will likely complain as well.
> 
> Fixes: e7542bc382f8 ("USB: serial: ir-usb: make set_termios synchronous")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Nice catch, I'll queue this up for 5.6-rc.

> ---
>  drivers/usb/serial/ir-usb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/ir-usb.c b/drivers/usb/serial/ir-usb.c
> index 79d0586e2b33..172261a908d8 100644
> --- a/drivers/usb/serial/ir-usb.c
> +++ b/drivers/usb/serial/ir-usb.c
> @@ -448,7 +448,7 @@ static void ir_set_termios(struct tty_struct *tty,
>  			usb_sndbulkpipe(udev, port->bulk_out_endpointAddress),
>  			transfer_buffer, 1, &actual_length, 5000);
>  	if (ret || actual_length != 1) {
> -		if (actual_length != 1)
> +		if (!ret)
>  			ret = -EIO;
>  		dev_err(&port->dev, "failed to change line speed: %d\n", ret);
>  	}

Johan
