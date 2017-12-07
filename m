From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 07 Dec 2017 08:45:38 +0000
Subject: Re: USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer()
Message-Id: <CAMuHMdUJMBS2Hwfc69MsOPk=8FxRs=45pp5TRsJdPUhQYDm+5A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
In-Reply-To: <97b0eeb8-834e-61ca-01dd-afbbf18697db@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, SF Markus Elfring <elfring@users.sourceforge.net>, USB list <linux-usb@vger.kernel.org>, Joe Perches <joe@perches.com>, Daniel Drake <drake@endlessm.com>, Dmitry Fleytman <dmitry@daynix.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan,

On Thu, Dec 7, 2017 at 9:35 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Thu, Dec 07, 2017 at 08:40:07AM +0100, Geert Uytterhoeven wrote:
>> On Wed, Dec 6, 2017 at 11:02 PM, Alan Stern <stern@rowland.harvard.edu> wrote:
>> > On Wed, 6 Dec 2017, SF Markus Elfring wrote:
>> >> >>> Does the existing memory allocation error message include the
>> >> >>> &udev->dev device name and driver name?  If it doesn't, there will be
>> >> >>> no way for the user to tell that the error message is related to the
>> >> >>> device failure.
>> >> >>
>> >> >> No, but the effect is similar.
>> >> >>
>> >> >> OOM does a dump_stack() so this function's call tree is shown.
>> >> >
>> >> > A call stack doesn't tell you which device was being handled.
>> >>
>> >> Do you find a default Linux allocation failure report insufficient then?
>> >>
>> >> Would you like to to achieve that the requested information can be determined
>> >> from a backtrace?
>> >
>> > It is not practical to do this.  The memory allocation routines do not
>> > for what purpose the memory is being allocated; hence when a failure
>> > occurs they cannot tell what device (or other part of the system) will
>> > be affected.
>>
>> If even allocation of 24 bytes fails, lots of other devices and other parts of
>> the system will start failing really soon...
>
> Small allocations never fail in the current kernel.

A few comments (this is in response to a patch from Markus, so there have
to be lots of questions and uncertainties ;-)
1. In the current kernel. What about the future?
2. If a small allocation cannot fail, what happens if the small memory slab
   is exhausted? A new page must be allocated, which will trigger an OOM,
   and some other part of the system will be killed and fail.
3. This driver uses GFP_ATOMIC, is that guaranteed to succeed? I think not.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
