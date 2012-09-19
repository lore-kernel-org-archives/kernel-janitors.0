From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 19 Sep 2012 07:14:42 +0000
Subject: Re: usb-serial.c:1415 code aligned with following code on line 1416
Message-Id: <20120919071442.GB16905@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120919005700.GB10838@localhost>
In-Reply-To: <20120919005700.GB10838@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 19, 2012 at 08:57:00AM +0800, Fengguang Wu wrote:
> Hi Greg,
> 
> FYI, coccinelle warns about
> 
> drivers/usb/serial/usb-serial.c:1415:3-51: code aligned with following code on line 1416
> 
> vim +1415 drivers/usb/serial/usb-serial.c
> 
>   1412		/* we only set the reset_resume field if the serial_driver has one */
>   1413		for (sd = serial_drivers; *sd; ++sd) {
>   1414			if ((*sd)->reset_resume)
> > 1415				udriver->reset_resume = usb_serial_reset_resume;
> > 1416				break;
>   1417		}

Ah, nice catch, that's been there for a while now (since 3.5-rc1), I'll
go fix it up.

thanks,

greg k-h
