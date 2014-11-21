From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 21 Nov 2014 17:59:00 +0000
Subject: Re: USB: serial: Deletion of an unnecessary check before the function call "release_firmware"
Message-Id: <alpine.DEB.2.10.1411211857590.2433@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <546F5831.5060404@users.sourceforge.net> <alpine.DEB.2.10.1411211625380.2433@hadrien> <546F5ED7.1000206@users.sourceforge.net>
In-Reply-To: <546F5ED7.1000206@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



On Fri, 21 Nov 2014, SF Markus Elfring wrote:

> >> diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
> >> index ab1d690..3653ec1 100644
> >> --- a/drivers/usb/serial/mxuport.c
> >> +++ b/drivers/usb/serial/mxuport.c
> >> @@ -1101,8 +1101,7 @@ static int mxuport_probe(struct usb_serial *serial,
> >>  	 */
> >>  	usb_set_serial_data(serial, (void *)id->driver_info);
> >>  out:
> >> -	if (fw_p)
> >> -		release_firmware(fw_p);
> >> +	release_firmware(fw_p);
> >
> > I think that the if should stay.
>
> I have got an other opinion.
>
>
> > There were two cases on the allocation, so there should be two cases
> > on the release.
>
> I find that this implementation detail does not really matter for the
> necessity of a null pointer check directly before such a function call.

Conceptually, if it is clear 10 lines above that nothing was allocated,
and there is a fallback to existing data (according to the comment above)
it is strange to be releasing something.

julia
