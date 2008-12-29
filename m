From: Alan Stern <stern@rowland.harvard.edu>
Date: Mon, 29 Dec 2008 19:54:25 +0000
Subject: Re: [PATCH 10/13] drivers/usb/gadget: use USB API functions rather
Message-Id: <Pine.LNX.4.44L0.0812291452580.1979-100000@iolanthe.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <200812291014.49779.david-b@pacbell.net>
References: <Pine.LNX.4.64.0812291122180.9555@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812291122180.9555@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Brownell <david-b@pacbell.net>
Cc: Julia Lawall <julia@diku.dk>, gregkh@suse.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 29 Dec 2008, David Brownell wrote:

> Those functions were supposed to go into <linux/usb/ch9.h>, as
> I recall, since they weren't specific to the host side stack.
> 
> Having them added to the wrong file is surely part of why
> they've only been used by host side drivers.  :)

Would you like to write a patch moving the functions to ch9.h?  Or 
would you like to ask Julia or me to do it?

Alan Stern

