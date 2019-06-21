From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 21 Jun 2019 14:52:16 +0000
Subject: Re: Coccinelle: Add a SmPL script for the reconsideration of redundant dev_err() calls
Message-Id: <alpine.DEB.2.20.1906211651550.3740@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05d85182-7ec3-8fc1-4bcd-fd2528de3a40@web.de>
 <alpine.DEB.2.21.1906202046550.3087@hadrien>
 <34d528db-5582-5fe2-caeb-89bcb07a1d30@web.de>
 <alpine.DEB.2.21.1906202110310.3087@hadrien>
 <13890878-9e5f-f297-7f7c-bcc1212d83b7@web.de>
 <alpine.DEB.2.20.1906211119430.3740@hadrien>
 <452fc5f1-bcaa-c9a5-9600-0278594e5e6f@web.de>
In-Reply-To: <452fc5f1-bcaa-c9a5-9600-0278594e5e6f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, Ding Xiang <dingxiang@cmss.chinamobile.com>, Coccinelle <cocci@systeme.lip6.fr>



On Fri, 21 Jun 2019, Markus Elfring wrote:

> > I still don't see the point of specifying return.  Why not just S, where S
> > is a statement metavariable?
>
> Do you find the following SmPL change specification more appropriate?

It looks better.

>
> @deletion depends on patch@
> expression e;
> statement s;
> @@
>  e = devm_ioremap_resource(...);
>  if (IS_ERR(e))
> (
> -{
> -   dev_err(...);
>     s
> -}
> |
>  {
>  <+...
> -   dev_err(...);
>  ...+>
>  }
> )
