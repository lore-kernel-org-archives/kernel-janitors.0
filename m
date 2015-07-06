From: Johan Hovold <johan@kernel.org>
Date: Mon, 06 Jul 2015 10:33:10 +0000
Subject: Re: [PATCH] USB-mxuport: Delete an unnecessary check before the function call "release_firmware"
Message-Id: <20150706103310.GC32202@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <558FF1EC.2060605@users.sourceforge.net>
In-Reply-To: <558FF1EC.2060605@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sun, Jun 28, 2015 at 03:09:00PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 28 Jun 2015 14:59:04 +0200
> 
> The release_firmware() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/usb/serial/mxuport.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
> index 460a406..92f7aee 100644
> --- a/drivers/usb/serial/mxuport.c
> +++ b/drivers/usb/serial/mxuport.c
> @@ -1101,8 +1101,7 @@ static int mxuport_probe(struct usb_serial *serial,
>  	 */
>  	usb_set_serial_data(serial, (void *)id->driver_info);
>  out:
> -	if (fw_p)
> -		release_firmware(fw_p);
> +	release_firmware(fw_p);
>  	return err;
>  }

You sent the exact same patch last year and it was rejected then as it
does not improve readability:

	https://www.marc.info/?l=linux-usb&m1682024201419&w=3

So I'll drop this one again.

Johan
