From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 23 Sep 2016 12:17:43 +0000
Subject: Re: GPU-DRM-TILCDC: Less function calls in tilcdc_convert_slave_node() after error detection
Message-Id: <48278d51-67b6-2c95-71e4-e922072ad9e9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <2f3f7ad7-16a0-1dfb-d073-0d993cd767ee@users.sourceforge.net>
 <0be7fee0-64f7-fa02-0337-51376677343e@users.sourceforge.net>
 <e9b443c7-2947-46d5-462f-58c175b774bc@ti.com>
 <d9b20442-3f84-82bd-d600-e3045a21da99@users.sourceforge.net>
 <CAF6AEGsHS9P0XyVH=So9woCkp9u8mUgL1QrCFNzgWdy26_4rDw@mail.gmail.com>
 <3b791118-2977-f607-b816-dd5e833cfc75@users.sourceforge.net>
 <CAF6AEGsh34CNfP6kwGV7nHFfPGp=Vbvja=_6FDuc0XPChJ2Kaw@mail.gmail.com>
In-Reply-To: <CAF6AEGsh34CNfP6kwGV7nHFfPGp=Vbvja=_6FDuc0XPChJ2Kaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Clark <robdclark@gmail.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Julia Lawall <julia.lawall@lip6.fr>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>

>> I see a need to improve not only correctness there but also a bit of
>> software efficiency.
> 
> If you can measure any performance difference and present some results
> (esp. considering that this is something that just happens when the
> driver is loaded), then we'll talk.

Are you really interested to increase your software development attention
for a quicker exception handling implementation in this function?


> Until then, please don't send this sort of patch.  Thank you.

Will benchmark statistics change such a change rejection ever?

Regards,
Markus
