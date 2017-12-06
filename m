From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Dec 2017 17:51:29 +0000
Subject: Re: USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer()
Message-Id: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>, linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, Daniel Drake <drake@endlessm.com>, Dmitry Fleytman <dmitry@daynix.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> The system will come to a grinding halt anyway if it can't allocate 24 or 40 bytes.

Maybe.


> Which is BTW more or less the amount of memory saved by killing
> the useless (error) message.

Would you dare to resend this update suggestion after such a view?

Regards,
Markus
