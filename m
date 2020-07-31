From: Julia Lawall <julia.lawall@inria.fr>
Date: Fri, 31 Jul 2020 08:45:05 +0000
Subject: Re: [PATCH v4] coccinelle: api: add kvfree script
Message-Id: <alpine.DEB.2.22.394.2007311044340.2439@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-701465646-1596185105=:2439"
List-Id: <kernel-janitors.vger.kernel.org>
References: <75532a99-4498-c64a-de34-c9033782aa9e@web.de>
 <alpine.DEB.2.22.394.2007302125580.2548@hadrien>
 <96a71d0e-ae6f-9355-b02a-b1a084376f1e@web.de>
In-Reply-To: <96a71d0e-ae6f-9355-b02a-b1a084376f1e@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-701465646-1596185105=:2439
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Fri, 31 Jul 2020, Markus Elfring wrote:

> >>> +msg = "WARNING: kmalloc is used to allocate this memory at line %s" % (k[0].line)
> >>> +coccilib.org.print_todo(p[0], msg)
> >>
> >> * I find the diagnostic text insufficient.
> >
> > I also find the message not very informative.
>
> Is it interesting how quick such views can change?

Yes.  If one looks at something in context, one and understand it better
than the extract that you provided.

julia

> https://lore.kernel.org/cocci/alpine.DEB.2.22.394.2007302214160.2548@hadrien/
> https://systeme.lip6.fr/pipermail/cocci/2020-July/008041.html
> https://lkml.org/lkml/2020/7/30/1015
>
> “…
> Actually, the message looks fine.  Sorry for the noise about that.
> …”
>
>
> Can such notifications become more helpful?
>
> Regards,
> Markus
>
--8323329-701465646-1596185105=:2439--
