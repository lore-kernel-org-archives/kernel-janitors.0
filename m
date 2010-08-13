From: wfp5p@viridian.itc.virginia.edu (Bill Pemberton)
Date: Fri, 13 Aug 2010 12:58:24 +0000
Subject: Re: [patch] usb/serial/ssu100: uninitialized variable
Message-Id: <20100813125824.87BC52389B@viridian.itc.virginia.edu>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20100813123811.GA31262@bicker>
References: <20100813123811.GA31262@bicker>
In-Reply-To: <20100813123811.GA31262@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> 
> GCC complains about the original code, because we're using an
> unintialized variable "flag".  I think we should be setting flag based
> on the UART_LSR_BRK_ERROR_BITS but I'm not sure...  I don't have this
> hardware.  Probably passing TTY_NORMAL is better than the current code?
> 

I took that function from ftdi_sio and stripped a lot out of it
while developing the driver.  I see I missed adding back in the logic
dealing with setting flag correctly.  I'll work up a patch to properly
deal with it.

-- 
Bill
