From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 19 Nov 2019 21:36:51 +0000
Subject: Re: [PATCH 2/4] coccinelle: platform_get_irq: handle 2-statement branches
Message-Id: <alpine.DEB.2.21.1911192235010.2592@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-319011006-1574199412=:2592"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1574184500-29870-3-git-send-email-Julia.Lawall@lip6.fr>
 <d178b6b3-7ef1-4ad7-a747-d65249a9667a@web.de>
In-Reply-To: <d178b6b3-7ef1-4ad7-a747-d65249a9667a@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-319011006-1574199412=:2592
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Tue, 19 Nov 2019, Markus Elfring wrote:

> > From: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> I wonder about this information.
> Would you like to use the tag “Suggested-by” instead?

Sorry, I seem to have done something quite wrong on this patch.  I will
fix it.

>
>
> …
> > +++ b/scripts/coccinelle/api/platform_get_irq.cocci
> > @@ -31,6 +31,25 @@ if ( \( ret < 0 \| ret <= 0 \) )
> …
> > +ret =
> > +(
> > +platform_get_irq
> > +|
> > +platform_get_irq_byname
> > +)(E, ...);
> > +
> > +if ( \( ret < 0 \| ret <= 0 \) )
> > +-{
> > +-dev_err(...);
> > +S
> > +-}
>
> How do you think about to use the following SmPL code variant?

And the benefit is what?

julia

> + ret =
> +(platform_get_irq
> +|platform_get_irq_byname
> +)(E, ...);
> +
> + if ( \( ret < 0 \| ret <= 0 \) )
> +-{
> +-dev_err(...);
> + S
> +-}
>
> Regards,
> Markus
>
--8323329-319011006-1574199412=:2592--
