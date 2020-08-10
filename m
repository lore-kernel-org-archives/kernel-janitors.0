From: Julia Lawall <julia.lawall@inria.fr>
Date: Mon, 10 Aug 2020 14:24:54 +0000
Subject: Re: [PATCH v2] documentation: coccinelle: Improve command example for make C={1, 2}
Message-Id: <alpine.DEB.2.22.394.2008101624380.2466@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1836737229-1597069495=:2466"
List-Id: <kernel-janitors.vger.kernel.org>
References: <ffe8c50d-0bb5-9477-a20c-96aa7bb45067@web.de>
 <20200810081914.37224551@lwn.net>
In-Reply-To: <20200810081914.37224551@lwn.net>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Markus Elfring <Markus.Elfring@web.de>, Randy Dunlap <rdunlap@infradead.org>, Nicolas Palix <nicolas.palix@imag.fr>, Sam Ravnborg <sam@ravnborg.org>, Coccinelle <cocci@systeme.lip6.fr>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1836737229-1597069495=:2466
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Mon, 10 Aug 2020, Jonathan Corbet wrote:

> On Mon, 10 Aug 2020 09:30:18 +0200
> Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > > Modify coccinelle documentation to further clarify
> > > the usage of the makefile C variable flag by coccicheck.
> >
> > How do you think about a wording variant like the following
> > for the change description?
> >
> >    Clarify the usage of the make variable “C” for coccicheck.
> >
> >
> > > +C flag is used. The C flag is a variable used by the makefile
> >
> > Can such a wording approach trigger understanding difficulties?
> > [...]
>
> Markus, please don't harass our contributors.  This patch is an
> improvement and, unless Julia disagrees, I am happy to apply it.

There will be a V3.  Thanks.

julia
--8323329-1836737229-1597069495=:2466--
