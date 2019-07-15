From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 15 Jul 2019 06:11:00 +0000
Subject: Re: m68k: One function call less in cf_tlb_miss()
Message-Id: <f9af74a1-dc4a-5ad9-9da3-8fba4b4f179c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c5713aa4-d290-0f7d-7de8-82bcdf74ee95@web.de>
 <alpine.LNX.2.21.1907060951060.67@nippy.intranet>
 <CAMuHMdWd31ch+eSje4ww=_JFSZgnxRAUAvS0TCHXq0nzLeVfgg@mail.gmail.com>
 <e75a25de-861a-8ab8-ffe7-c83572d6e553@web.de>
 <CAMuHMdU+sDjiTZph1gfii=WoWQ2c+jTvvqjq4mVSbFAi0eb_VA@mail.gmail.com>
In-Reply-To: <CAMuHMdU+sDjiTZph1gfii=WoWQ2c+jTvvqjq4mVSbFAi0eb_VA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, kernel-janitors@vger.kernel.org
Cc: Finn Thain <fthain@telegraphics.com.au>, Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>

> You better do,

It can eventually happen again under other circumstances.


> it can be a good learning experience!

This can be also possible.


>> * Can the suggested small refactoring matter for a specific software combination there?
>> * Would you like to clarify this change possibility a bit more?
>
> -EPARSE

I am curious where you got parsing (or more understanding) difficulties
for these questions.

Regards,
Markus
