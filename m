From: Wim Van Sebroeck <wim@iguana.be>
Date: Sun, 17 Nov 2013 19:06:31 +0000
Subject: Re: [patch v2] watchdog: pcwd_usb: overflow in usb_pcwd_send_command()
Message-Id: <20131117190631.GG10136@spo001.leaseweb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <527BA351.10705@roeck-us.net> <20131108092419.GA22389@elgon.mountain>
In-Reply-To: <20131108092419.GA22389@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>

Hi Dan,

> We changed "buf" from being an array of 6 chars to being a pointer this
> sizeof(buf) needs to be updated as well.
> 
> Fixes: 2ddb8089a7e5 ('watchdog: pcwd_usb: Use allocated buffer for usb_control_msg')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Fix the bug that Guenter Roeck pointed out in v1.

This was added to linux-watchdog-next.

Kind regards,
Wim.

