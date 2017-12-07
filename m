From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 07 Dec 2017 13:38:19 +0000
Subject: Re: USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer()
Message-Id: <9c32b2f1-a4d2-a079-f93c-ef6efe909449@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
In-Reply-To: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Cc: Joe Perches <joe@perches.com>, Daniel Drake <drake@endlessm.com>, Dmitry Fleytman <dmitry@daynix.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Oliver Neukum <oneukum@suse.com>, Peter Chen <peter.chen@nxp.com>

>>>> OOM does a dump_stack() so this function's call tree is shown.
>>>
>>> A call stack doesn't tell you which device was being handled.
>>
>> Do you find a default Linux allocation failure report insufficient then?
>>
>> Would you like to to achieve that the requested information can be determined
>> from a backtrace?
> 
> It is not practical to do this.

I imagine that this depends on details if a backtrace could eventually
be configured for your specific needs.


> The memory allocation routines do not for what purpose
> the memory is being allocated;

Do you want an improved accounting for these purposes?


> hence when a failure occurs they cannot tell what device
> (or other part of the system) will be affected.

I know that other programs can provide dumps for function call
stacks where the parameters which were passed in previous calls
could be decoded to some degree.


> That's why we have a secondary error message.

I am curious on how the relevance of such messages will be interpreted
by other developers in this software area.

Regards,
Markus
