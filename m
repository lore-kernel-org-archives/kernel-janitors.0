From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 21 Nov 2014 15:26:12 +0000
Subject: Re: [PATCH 1/1] USB: serial: Deletion of an unnecessary check before the function call "release_firm
Message-Id: <alpine.DEB.2.10.1411211625380.2433@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <546F5831.5060404@users.sourceforge.net>
In-Reply-To: <546F5831.5060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



On Fri, 21 Nov 2014, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 21 Nov 2014 16:15:34 +0100
>
> The release_firmware() function tests whether its argument is NULL
> and then returns immediately. Thus the test around the call is not needed.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/usb/serial/mxuport.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
> index ab1d690..3653ec1 100644
> --- a/drivers/usb/serial/mxuport.c
> +++ b/drivers/usb/serial/mxuport.c
> @@ -1101,8 +1101,7 @@ static int mxuport_probe(struct usb_serial *serial,
>  	 */
>  	usb_set_serial_data(serial, (void *)id->driver_info);
>  out:
> -	if (fw_p)
> -		release_firmware(fw_p);
> +	release_firmware(fw_p);

I think that the if should stay.  There were two cases on the allocation,
so there should be two cases on the release.

julia

>  	return err;
>  }
>
> --
> 2.1.3
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
