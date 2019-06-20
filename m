From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 20 Jun 2019 19:12:20 +0000
Subject: Re: Coccinelle: Add a SmPL script for the reconsideration of redundant dev_err() calls
Message-Id: <alpine.DEB.2.21.1906202110310.3087@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05d85182-7ec3-8fc1-4bcd-fd2528de3a40@web.de>
 <alpine.DEB.2.21.1906202046550.3087@hadrien>
 <34d528db-5582-5fe2-caeb-89bcb07a1d30@web.de>
In-Reply-To: <34d528db-5582-5fe2-caeb-89bcb07a1d30@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Ding Xiang <dingxiang@cmss.chinamobile.com>, Coccinelle <cocci@systeme.lip6.fr>



On Thu, 20 Jun 2019, Markus Elfring wrote:

> >> +@display depends on context@
> >> +expression e;
> >> +@@
> >> + e = devm_ioremap_resource(...);
> >> + if (IS_ERR(e))
> >> + {
> >> +*   dev_err(...);
> >> +    return (...);
> >> + }
> >
> > Why do you assume that there is exactly one dev_err and one return after
> > the test?
>
> I propose to start with the addition of a simple source code search pattern.
> Would you prefer to clarify a more advanced approach?

I think that something like

if (IS_ERR(e))
{
<+...
*dev_err(...)
...+>
}

would be more appropriate.  Whether there is a return or not doesn't
really matter.

>
>
> >> +@script:python to_do depends on org@
> >> +p << or.p;
> >> +@@
> >> +coccilib.org.print_todo(p[0],
> >> +                        "WARNING: An error message is probably not needed here because the previously called function contains appropriate error reporting.")
> >
> > "the previously called function" would be better as "devm_ioremap_resource".
>
> Would you like to get the relevant function name dynamically determined?

I have no idea what you consider "the relevant function name" to be.  If
it is always devm_ioremap_resource then it would seem that it does not
need to be dynamically determined.

julia
