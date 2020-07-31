From: Julia Lawall <julia.lawall@inria.fr>
Date: Fri, 31 Jul 2020 14:38:42 +0000
Subject: Re: [v4] coccinelle: api: add kvfree script
Message-Id: <alpine.DEB.2.22.394.2007311637570.2455@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75532a99-4498-c64a-de34-c9033782aa9e@web.de>
 <alpine.DEB.2.22.394.2007302125580.2548@hadrien>
 <96a71d0e-ae6f-9355-b02a-b1a084376f1e@web.de>
 <alpine.DEB.2.22.394.2007311044340.2439@hadrien>
 <06eaa1fe-5047-89f7-3995-a38d80030e7f@web.de>
In-Reply-To: <06eaa1fe-5047-89f7-3995-a38d80030e7f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>



On Fri, 31 Jul 2020, Markus Elfring wrote:

> >>>>> +msg = "WARNING: kmalloc is used to allocate this memory at line %s" % (k[0].line)
> >>>>> +coccilib.org.print_todo(p[0], msg)
> >>>>
> >>>> * I find the diagnostic text insufficient.
> >>>
> >>> I also find the message not very informative.
> >>
> >> Is it interesting how quick such views can change?
> >
> > Yes.  If one looks at something in context, one and understand it better
> > than the extract that you provided.
>
> Should the provided information (and its intention) be understandable from
> the diagnostic message alone already?

It is understandable from the message and from the positions that are
indicated.  That's good enough.

julia
