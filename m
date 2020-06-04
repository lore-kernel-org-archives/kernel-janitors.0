From: Julia Lawall <julia.lawall@inria.fr>
Date: Thu, 04 Jun 2020 15:56:38 +0000
Subject: Re: [PATCH] coccinelle: api: add kzfree script
Message-Id: <alpine.DEB.2.21.2006041755360.2577@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-914190676-1591286199=:2577"
List-Id: <kernel-janitors.vger.kernel.org>
References: <96653281-3812-8b44-0dd8-6e7540a26a89@web.de>
In-Reply-To: <96653281-3812-8b44-0dd8-6e7540a26a89@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-914190676-1591286199=:2577
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Thu, 4 Jun 2020, Markus Elfring wrote:

> > Check for memset() with 0 followed by kfree().
>
> I suggest to simplify the SmPL code a bit like the following.
>
>
> > +virtual context
> > +virtual org
> > +virtual report
> > +virtual patch
>
> +virtual context, org, report, patch

This is pointless.

>
>
> …
> > +@@
> > +
> > +(
> > +* memset(E, 0, ...);
> > +|
> > +* memset(E, '\0', ...);
> > +)
> > +* kfree(E)@p;
>
> +@@
> +*memset(E, 0, ...);
> +*kfree(E)@p;
>
>
> How does the SmPL asterisk functionality fit to the operation
> modes “org” and “report”?

make coccicheck uses the option --no-show-diff for the org and report
modes.

>
> > +@@
> > +
> > +(
> > +- memset(E, 0, ...);
> > +|
> > +- memset(E, '\0', ...);
> > +)
> > +- kfree(E);
> > ++ kzfree(E);
>
> +@@
> +-memset(E, 0, ...);
> +-kfree
> ++kzfree
> +       (E);
>
> I got the impression that the specification of a SmPL disjunction
> could be omitted because of the technical detail that the isomorphism
> “zero_multiple_format” should handle such an use case already.
>
> Would you like to tolerate any extra source code between these function calls?

I already addressed these issues.

julia
--8323329-914190676-1591286199=:2577--
