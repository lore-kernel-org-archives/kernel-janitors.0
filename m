From: Julia Lawall <julia.lawall@inria.fr>
Date: Thu, 30 Jul 2020 19:27:32 +0000
Subject: Re: [PATCH v4] coccinelle: api: add kvfree script
Message-Id: <alpine.DEB.2.22.394.2007302125580.2548@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75532a99-4498-c64a-de34-c9033782aa9e@web.de>
In-Reply-To: <75532a99-4498-c64a-de34-c9033782aa9e@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

> > +msg = "WARNING: kmalloc is used to allocate this memory at line %s" % (k[0].line)
> > +coccilib.org.print_todo(p[0], msg)
>
> * I find the diagnostic text insufficient.

I also find the message not very informative.

All of the other comments are not useful, and some are simply incorrect.

julia
