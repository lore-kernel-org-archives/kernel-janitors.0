From: Julia Lawall <julia.lawall@inria.fr>
Date: Tue, 27 Oct 2020 10:55:53 +0000
Subject: =?UTF-8?Q?Re=3A_=5BCocci=5D_Coccinelle=3A_Checking_the_relevanc?= =?UTF-8?Q?e_of_parentheses_in_=E2=
Message-Id: <alpine.DEB.2.22.394.2010271155330.2847@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1797633343-1603796154=:2847"
List-Id: <kernel-janitors.vger.kernel.org>
References: <78f8b08754dde286adf7e11e1eeb3bb8ad500d8b.camel@web.de>
 <acaed49b9195d47e252a0b67551f87e96324d004.camel@web.de>
 <45310257-201a-40ea-348f-b8e909c3775c@web.de>
In-Reply-To: <45310257-201a-40ea-348f-b8e909c3775c@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1797633343-1603796154=:2847
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Tue, 27 Oct 2020, Markus Elfring wrote:

> > Will any adjustments become relevant then accordingly?
>
> I have found out that the function “interpret” (OCaml code) constructs a command
> and executes it.
> https://github.com/coccinelle/coccinelle/blob/3c01dc1696dc5ccfb319673f205e491b572ee0be/parsing_cocci/git_grep.ml#L9
>
> I have tried a corresponding test display out. Thus I have got the impression
> that desired patterns are passed with extra parentheses.
>
> … git grep -l -w \( -e for_each_node_by_type … -e for_each_node_with_property \) -- '*.c'
>
>
> How do you think about to omit these parentheses here?

Does it make a difference?

julia
--8323329-1797633343-1603796154=:2847--
