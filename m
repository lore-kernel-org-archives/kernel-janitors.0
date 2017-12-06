From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Dec 2017 21:33:26 +0000
Subject: Re: USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer()
Message-Id: <a823c472-7826-3fbd-0197-5246a2cd5368@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
In-Reply-To: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Cc: Joe Perches <joe@perches.com>, Daniel Drake <drake@endlessm.com>, Dmitry Fleytman <dmitry@daynix.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>>> Does the existing memory allocation error message include the 
>>> &udev->dev device name and driver name?  If it doesn't, there will be 
>>> no way for the user to tell that the error message is related to the 
>>> device failure.
>>
>> No, but the effect is similar.
>>
>> OOM does a dump_stack() so this function's call tree is shown.
> 
> A call stack doesn't tell you which device was being handled.

Do you find a default Linux allocation failure report insufficient then?

Would you like to to achieve that the requested information can be determined
from a backtrace?

Regards,
Markus
