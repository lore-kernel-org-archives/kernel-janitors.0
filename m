From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 23 Sep 2016 11:19:47 +0000
Subject: Re: GPU-DRM-TILCDC: Less function calls in tilcdc_convert_slave_node() after error detection
Message-Id: <3b791118-2977-f607-b816-dd5e833cfc75@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <2f3f7ad7-16a0-1dfb-d073-0d993cd767ee@users.sourceforge.net>
 <0be7fee0-64f7-fa02-0337-51376677343e@users.sourceforge.net>
 <e9b443c7-2947-46d5-462f-58c175b774bc@ti.com>
 <d9b20442-3f84-82bd-d600-e3045a21da99@users.sourceforge.net>
 <CAF6AEGsHS9P0XyVH=So9woCkp9u8mUgL1QrCFNzgWdy26_4rDw@mail.gmail.com>
In-Reply-To: <CAF6AEGsHS9P0XyVH=So9woCkp9u8mUgL1QrCFNzgWdy26_4rDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Clark <robdclark@gmail.com>
Cc: Jyri Sarha <jsarha@ti.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Julia Lawall <julia.lawall@lip6.fr>, Tomi Valkeinen <tomi.valkeinen@ti.com>

> iirc, there are Coccinelle rules that find code with unnecessary null
> checks and removes them.

This kind of software change is not needed here.

I find that a corresponding return value check happens one function call
too late.


> Although you probably made this complex enough that cocinelle would
> not find it.  That is not a complement.

I imagine that scripts for the semantic patch language can find more
source code places where questionable disjunctions are used so far.
Would you dare to split any more condition checks?


> One should not make error handling/cleanup more complex than needed.

I see a need to improve not only correctness there but also a bit of
software efficiency.

Regards,
Markus
