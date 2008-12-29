From: David Brownell <david-b@pacbell.net>
Date: Mon, 29 Dec 2008 20:22:48 +0000
Subject: Re: [PATCH 10/13] drivers/usb/gadget: use USB API functions rather than constants
Message-Id: <200812291222.48966.david-b@pacbell.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.44L0.0812291452580.1979-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.0812291452580.1979-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Julia Lawall <julia@diku.dk>, gregkh@suse.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Monday 29 December 2008, Alan Stern wrote:
> On Mon, 29 Dec 2008, David Brownell wrote:
> 
> > Those functions were supposed to go into <linux/usb/ch9.h>, as
> > I recall, since they weren't specific to the host side stack.
> > 
> > Having them added to the wrong file is surely part of why
> > they've only been used by host side drivers.  :)
> 
> Would you like to write a patch moving the functions to ch9.h?  Or 
> would you like to ask Julia or me to do it?

Someone other than me.  ;)

Maybe someone on K-J will want to volunteer with a patch
before either you or Julia...

- Dave

