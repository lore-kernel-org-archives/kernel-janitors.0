From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 17 Feb 2019 11:48:02 +0000
Subject: Re: [PATCH v6] coccinelle: semantic code search for missing put_device()
Message-Id: <alpine.DEB.2.21.1902171246560.2444@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <HK0PR02MB36344E2B29CEB195892F6420B2610@HK0PR02MB3634.apcprd02.prod.outlook.com>
 <8e7ba7c0-b7fe-a1f0-d28b-0c716ecbcfdb@web.de>
 <alpine.DEB.2.21.1902171235570.2444@hadrien>
 <1c152067-0135-79d7-1285-4bb9925054c8@web.de>
In-Reply-To: <1c152067-0135-79d7-1285-4bb9925054c8@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Coccinelle <cocci@systeme.lip6.fr>, Cheng Shengyu <cheng.shengyu@zte.com.cn>, Wen Yang <wen.yang99@zte.com.cn>



On Sun, 17 Feb 2019, Markus Elfring wrote:

> >>> +@search exists@
> >>> +local idexpression id;
> >>> +expression x,e,e1;
> >>> +position p1,p2;
> >>> +type T,T1,T2;
> >>> +@@
> >>> +
> >>> +id = of_find_device_by_node@p1(x)
> >>> +... when != e = id
> >>
> >> I suggest to increase your software development attention also for
> >> another implementation detail.
> >> Source code analysis triggers challenges for safe data flow handling.
> >> the semantic patch language supports search specifications for
> >> the exclusion of specific assignments.
> >>
> >> Does this SmPL code contain a questionable order for the source
> >> and target metavariables?
> >> Can the following variant be more appropriate?
> >>
> >> + ... when != id = e
> >
> > This is possible, but I think unlikely.
>
> Would you dare to interpret my update suggestion (reordering of two identifiers)
> as a required SmPL script correction?

I didn't suggest to reorder anything.  Both are needed.

And, no I don't consider it to be a required suggestion.  In practice,
reassigning such a variable is very unlikely.

julia
