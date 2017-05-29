From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 May 2017 19:38:52 +0000
Subject: Re: [PATCH] MIPS: Octeon: Delete an error message for a failed memory allocation in octeon_irq_init_
Message-Id: <CAMuHMdXHuiaQ02Bmv_ig=kTTSHnhK=-64t9yv-rn5tFo=cn1hg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7995eb17-f2ec-54ad-f4d4-7b3dd8337d33@users.sourceforge.net>
 <1495565752.2093.69.camel@perches.com> <71a2ce6a-968c-b13c-95b0-610f0c1bab03@users.sourceforge.net>
 <1495655035.2093.86.camel@perches.com>
In-Reply-To: <1495655035.2093.86.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Dan Carpenter <dan.carpenter@oracle.com>, David Daney <david.daney@cavium.com>, =?UTF-8?B?UmFsZiBCw6RjaGxl?= <ralf@linux-mips.org>, "Steven J. Hill" <steven.hill@cavium.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, May 24, 2017 at 9:43 PM, Joe Perches <joe@perches.com> wrote:
> On Wed, 2017-05-24 at 18:01 +0200, SF Markus Elfring wrote:
>> I am curious if I will stumble on a similar change possibility once more
>> for remaining update candidates in other software areas.
>
> Only if you keep your eyes open to the possibilities.

It's like a puzzle: how to fold the if/else trees and forests to achieve
the longest linear path and the smallest indentation ;-)

And... goto (to the end/cleanup phase!) is your friend...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
