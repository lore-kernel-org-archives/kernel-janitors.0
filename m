From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 21 Jun 2019 09:21:11 +0000
Subject: Re: Coccinelle: Add a SmPL script for the reconsideration of redundant dev_err() calls
Message-Id: <alpine.DEB.2.20.1906211119430.3740@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05d85182-7ec3-8fc1-4bcd-fd2528de3a40@web.de>
 <alpine.DEB.2.21.1906202046550.3087@hadrien>
 <34d528db-5582-5fe2-caeb-89bcb07a1d30@web.de>
 <alpine.DEB.2.21.1906202110310.3087@hadrien>
 <13890878-9e5f-f297-7f7c-bcc1212d83b7@web.de>
In-Reply-To: <13890878-9e5f-f297-7f7c-bcc1212d83b7@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Ding Xiang <dingxiang@cmss.chinamobile.com>, Coccinelle <cocci@systeme.lip6.fr>



On Fri, 21 Jun 2019, Markus Elfring wrote:

> > I think that something like
> >
> > if (IS_ERR(e))
> > {
> > <+...
> > *dev_err(...)
> > ...+>
> > }
> >
> > would be more appropriate.  Whether there is a return or not doesn't
> > really matter.
>
> Do you find the following SmPL change specification useful and acceptable?
>
>
> @deletion depends on patch@
> expression e;
> @@
>  e = devm_ioremap_resource(...);
>  if (IS_ERR(e))
> (
> -{
> -   dev_err(...);
>     return (...);

I still don't see the point of specifying return.  Why not just S, where S
is a statement metavariable?

julia

> -}
> |{

I realize that you confuse conciseness with readability, but it would
really look better to have the | on a line by itself.

julia

>  <+...
> -   dev_err(...);
>  ...+>
>  }
> )
>
>
> Would this approach need a version check for the Coccinelle software?

Why would that be necessary?
