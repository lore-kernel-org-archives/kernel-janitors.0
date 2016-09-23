From: Rob Clark <robdclark@gmail.com>
Date: Fri, 23 Sep 2016 11:31:22 +0000
Subject: Re: GPU-DRM-TILCDC: Less function calls in tilcdc_convert_slave_node() after error detection
Message-Id: <CAF6AEGsh34CNfP6kwGV7nHFfPGp=Vbvja=_6FDuc0XPChJ2Kaw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <2f3f7ad7-16a0-1dfb-d073-0d993cd767ee@users.sourceforge.net>
 <0be7fee0-64f7-fa02-0337-51376677343e@users.sourceforge.net>
 <e9b443c7-2947-46d5-462f-58c175b774bc@ti.com>
 <d9b20442-3f84-82bd-d600-e3045a21da99@users.sourceforge.net>
 <CAF6AEGsHS9P0XyVH=So9woCkp9u8mUgL1QrCFNzgWdy26_4rDw@mail.gmail.com>
 <3b791118-2977-f607-b816-dd5e833cfc75@users.sourceforge.net>
In-Reply-To: <3b791118-2977-f607-b816-dd5e833cfc75@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Julia Lawall <julia.lawall@lip6.fr>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>

On Fri, Sep 23, 2016 at 7:19 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>> iirc, there are Coccinelle rules that find code with unnecessary null
>> checks and removes them.
>
> This kind of software change is not needed here.
>
> I find that a corresponding return value check happens one function call
> too late.
>

I think you misunderstand my point.. which is that additional
conditional checks wrapping a function call to something that already
checks for null should be removed.. not introduced.

>
>> Although you probably made this complex enough that cocinelle would
>> not find it.  That is not a complement.
>
> I imagine that scripts for the semantic patch language can find more
> source code places where questionable disjunctions are used so far.
> Would you dare to split any more condition checks?
>
>
>> One should not make error handling/cleanup more complex than needed.
>
> I see a need to improve not only correctness there but also a bit of
> software efficiency.

If you can measure any performance difference and present some results
(esp. considering that this is something that just happens when the
driver is loaded), then we'll talk.  Until then, please don't send
this sort of patch.  Thank you.

BR,
-R

> Regards,
> Markus
