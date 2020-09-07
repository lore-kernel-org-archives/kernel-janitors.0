From: Julia Lawall <julia.lawall@inria.fr>
Date: Mon, 07 Sep 2020 17:31:40 +0000
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2=5D_Coccinelle=3A_api=3A_Add_SmPL?= =?UTF-8?Q?_script_=E2=80=9Cuse=5Fdevm
Message-Id: <alpine.DEB.2.22.394.2009071930510.2476@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <25b804fd-0d04-475d-f614-26c03c9fd544@web.de>
 <5f9fdd59-4b0b-1cb5-c3a2-92efc5bb3841@web.de>
 <4b505afc-ae48-d8eb-f4e1-8e3f7192f73d@web.de>
 <alpine.DEB.2.22.394.2009071900450.2476@hadrien>
 <8fb7782c-538b-b657-af13-da71124e6afa@web.de>
In-Reply-To: <8fb7782c-538b-b657-af13-da71124e6afa@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, Dejin Zheng <zhengdejin5@gmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Coccinelle <cocci@systeme.lip6.fr>



On Mon, 7 Sep 2020, Markus Elfring wrote:

> >> +++ b/scripts/coccinelle/api/use_devm_platform_get_and_ioremap_resource.cocci
> >> @@ -0,0 +1,48 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/// Simplify a function call combination by using a known wrapper function.
> >> +//
> >> +// Keywords: wrapper function conversion ioremap resources
> >> +// Confidence: High
> >
> > Shouldn't there be some options?  --no-includes and perhaps
> > --include-headers would seem reasonable.
>
> I imagine that the proposed source code transformation can work also without
> additional semantic patch command options.

It can.  But it will be more efficient and more exhaustive if you include
them.

julia
