From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 01 Jul 2019 12:47:25 +0000
Subject: Re: [PATCH v2] Coccinelle: Add a SmPL script for the reconsideration of redundant dev_err() calls
Message-Id: <alpine.DEB.2.20.1907011442390.4005@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05d85182-7ec3-8fc1-4bcd-fd2528de3a40@web.de>
 <2744a3fc-9e67-8113-1dd9-43669e06386a@web.de>
 <0b48a5c5-0814-6414-39ba-beb1b8b5253a@metux.net>
In-Reply-To: <0b48a5c5-0814-6414-39ba-beb1b8b5253a@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Markus Elfring <Markus.Elfring@web.de>, Ding Xiang <dingxiang@cmss.chinamobile.com>, Coccinelle <cocci@systeme.lip6.fr>



On Mon, 1 Jul 2019, Enrico Weigelt, metux IT consult wrote:

> On 01.07.19 10:10, Markus Elfring wrote:
>
> Hi folks,
>
> > +@script:python to_do depends on org@
> > +p << or.p;
> > +@@
> > +coccilib.org.print_todo(p[0],
> > +                        "WARNING: An error message is probably not needed here because the devm_ioremap_resource() function contains appropriate error reporting.")
> > +
> > +@script:python reporting depends on report@
> > +p << or.p;
> > +@@
> > +coccilib.report.print_report(p[0],
> > +                             "WARNING: An error message is probably not needed here because the devm_ioremap_resource() function contains appropriate error reporting.")
> > --
>
> By the way: do we have any mechanism for explicitly suppressing
> individual warnings (some kind of annotation), when the maintainer is
> sure that some particular case is a false-positive ?
> (I'm thinking of something similar to certain #praga directives for
> explicitly ignoring invididual warnings in specific lines of code)
>
> I believe such a feature, so we don't get spammed with the same false
> positives again and again.

0-day takes care of it on its own.  Probably other such bots do the same.
I'm not sure that it is a good idea to clutter the kernel code with such
annotations, especially since the whole point of Ccocinelle is that the
rules are easy to change.  We also made a tool named Herodotos for
collecting identical reports over time, but it seems to be not so easy to
use.

julia
