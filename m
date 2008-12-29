From: John Daiker <daikerjohn@gmail.com>
Date: Mon, 29 Dec 2008 20:49:07 +0000
Subject: Re: [PATCH 10/13] drivers/usb/gadget: use USB API functions rather
Message-Id: <495937C3.7090101@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.44L0.0812291452580.1979-100000@iolanthe.rowland.org> <200812291222.48966.david-b@pacbell.net>
In-Reply-To: <200812291222.48966.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Brownell <david-b@pacbell.net>
Cc: Alan Stern <stern@rowland.harvard.edu>, Julia Lawall <julia@diku.dk>, gregkh@suse.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 12/29/2008 12:22 PM, David Brownell wrote:

> On Monday 29 December 2008, Alan Stern wrote:
>    
>> On Mon, 29 Dec 2008, David Brownell wrote:
>>
>>      
>>> Those functions were supposed to go into<linux/usb/ch9.h>, as
>>> I recall, since they weren't specific to the host side stack.
>>>
>>> Having them added to the wrong file is surely part of why
>>> they've only been used by host side drivers.  :)
>>>        
>> Would you like to write a patch moving the functions to ch9.h?  Or
>> would you like to ask Julia or me to do it?
>>      
>
> Someone other than me.  ;)
>
> Maybe someone on K-J will want to volunteer with a patch
> before either you or Julia...
>
> - Dave
>    
So you're saying that these functions:
usb_endpoint_dir_in(epd)
usb_endpoint_dir_out(epd)
usb_endpoint_is_bulk_in(epd)
usb_endpoint_is_bulk_out(epd)
usb_endpoint_is_int_in(epd)
usb_endpoint_is_int_out(epd)
usb_endpoint_num(epd)
usb_endpoint_type(epd)
usb_endpoint_xfer_bulk(epd)
usb_endpoint_xfer_control(epd)
usb_endpoint_xfer_int(epd)
usb_endpoint_xfer_isoc(epd)

Should be defined in ch9.h instead of usb.h?

If that's the case, then I'll be glad to cook up a patch! :)

~John

