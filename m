From: Julia Lawall <julia.lawall@inria.fr>
Date: Thu, 22 Oct 2020 12:35:03 +0000
Subject: =?UTF-8?Q?Re=3A_Coccinelle=3A_Checking_the_influence_of_=E2?= =?UTF-8?Q?=80=9CGrep_query=E2=80=9D?=
Message-Id: <alpine.DEB.2.22.394.2010221434210.5113@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-24693990-1603370104=:5113"
List-Id: <kernel-janitors.vger.kernel.org>
References: <78f8b08754dde286adf7e11e1eeb3bb8ad500d8b.camel@web.de>
 <acaed49b9195d47e252a0b67551f87e96324d004.camel@web.de>
In-Reply-To: <acaed49b9195d47e252a0b67551f87e96324d004.camel@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-24693990-1603370104=:5113
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Thu, 22 Oct 2020, Markus Elfring wrote:

> > A disjunction is applied by this script for the semantic patch language.
> > This construct uses short-circuit evaluation. It has got the consequence
> > that the last element of the specified condition will only be checked
> > if all previous parts did not match. Such a technical detail leads to
> > a recommended ordering of condition parts if you would like to care for
> > optimal run time characteristics of SmPL code.
>
> I imagine that such information can trigger further software evolution
> at more places.
>
>
> > +++ b/scripts/coccinelle/iterators/for_each_child.cocci
>
> The software “Coccinelle 1.0.8-00177-g28737419” displays the following data.
>
> elfring@Sonne:~/Projekte/Linux/next-patched> spatch -D patch --parse-cocci
> scripts/coccinelle/iterators/for_each_child.cocci
> …
> Grep query
> for_each_node_with_property || for_each_node_by_type || for_each_node_by_name ||
> for_each_matching_node_and_match || for_each_matching_node ||
> for_each_compatible_node || for_each_child_of_node ||
> for_each_available_child_of_node
>
>
> I suggest to take another closer look at the presented ordering for
> these identifiers.
> It deviates from the proposed listing for the SmPL disjunction.
> Now I am curious if this difference can be meaningful.
>
> If the exact “grep” is performed, it might happen that short-circuit evaluation
> would be applied also by the corresponding software component (or known tool).
> Will any adjustments become relevant then accordingly?

It doesn't matter.  The purpose is just to select files that are relevent
for consideration.  If a file is selected for two reasons instead of one
reason, it doesn't matter; it's still selected.

julia
--8323329-24693990-1603370104=:5113--
