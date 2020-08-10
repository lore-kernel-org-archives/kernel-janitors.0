From: Jonathan Corbet <corbet@lwn.net>
Date: Mon, 10 Aug 2020 14:19:14 +0000
Subject: Re: [PATCH v2] documentation: coccinelle: Improve command example for make C={1, 2}
Message-Id: <20200810081914.37224551@lwn.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ffe8c50d-0bb5-9477-a20c-96aa7bb45067@web.de>
In-Reply-To: <ffe8c50d-0bb5-9477-a20c-96aa7bb45067@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Sumera Priyadarsini <sylphrenadin@gmail.com>, Coccinelle <cocci@systeme.lip6.fr>, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Masahiro Yamada <masahiroy@kernel.org>, Matthew Wilcox <willy@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

On Mon, 10 Aug 2020 09:30:18 +0200
Markus Elfring <Markus.Elfring@web.de> wrote:

> > Modify coccinelle documentation to further clarify
> > the usage of the makefile C variable flag by coccicheck.  
> 
> How do you think about a wording variant like the following
> for the change description?
> 
>    Clarify the usage of the make variable “C” for coccicheck.
> 
> 
> > +C flag is used. The C flag is a variable used by the makefile  
> 
> Can such a wording approach trigger understanding difficulties?
> [...]

Markus, please don't harass our contributors.  This patch is an
improvement and, unless Julia disagrees, I am happy to apply it.

jon
