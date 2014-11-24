From: Johan Hovold <johan@kernel.org>
Date: Mon, 24 Nov 2014 09:10:03 +0000
Subject: Re: USB: serial: Deletion of an unnecessary check before the function call "release_firmware"
Message-Id: <20141124091003.GA6875@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <546F5831.5060404@users.sourceforge.net>
 <alpine.DEB.2.10.1411211625380.2433@hadrien>
 <546F5ED7.1000206@users.sourceforge.net>
 <alpine.DEB.2.10.1411211857590.2433@hadrien>
In-Reply-To: <alpine.DEB.2.10.1411211857590.2433@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Nov 21, 2014 at 06:59:00PM +0100, Julia Lawall wrote:
> On Fri, 21 Nov 2014, SF Markus Elfring wrote:
> 
> > >> diff --git a/drivers/usb/serial/mxuport.c b/drivers/usb/serial/mxuport.c
> > >> index ab1d690..3653ec1 100644
> > >> --- a/drivers/usb/serial/mxuport.c
> > >> +++ b/drivers/usb/serial/mxuport.c
> > >> @@ -1101,8 +1101,7 @@ static int mxuport_probe(struct usb_serial *serial,
> > >>  	 */
> > >>  	usb_set_serial_data(serial, (void *)id->driver_info);
> > >>  out:
> > >> -	if (fw_p)
> > >> -		release_firmware(fw_p);
> > >> +	release_firmware(fw_p);
> > >
> > > I think that the if should stay.
> >
> > I have got an other opinion.
> >
> >
> > > There were two cases on the allocation, so there should be two cases
> > > on the release.
> >
> > I find that this implementation detail does not really matter for the
> > necessity of a null pointer check directly before such a function call.
> 
> Conceptually, if it is clear 10 lines above that nothing was allocated,
> and there is a fallback to existing data (according to the comment above)
> it is strange to be releasing something.

I agree with Julia here and will not apply this one.

Thanks,
Johan
