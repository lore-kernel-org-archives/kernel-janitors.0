From: Julia Lawall <julia.lawall@inria.fr>
Date: Tue, 27 Oct 2020 12:03:35 +0000
Subject: =?UTF-8?Q?Re=3A_=5BCocci=5D_Coccinelle=3A_Checking_the_relevanc?= =?UTF-8?Q?e_of_parentheses_in_=E2=
Message-Id: <alpine.DEB.2.22.394.2010271303190.2847@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-410386229-1603800215=:2847"
List-Id: <kernel-janitors.vger.kernel.org>
References: <78f8b08754dde286adf7e11e1eeb3bb8ad500d8b.camel@web.de>
 <acaed49b9195d47e252a0b67551f87e96324d004.camel@web.de>
 <45310257-201a-40ea-348f-b8e909c3775c@web.de>
 <alpine.DEB.2.22.394.2010271155330.2847@hadrien>
 <bfb3e786-a64f-ecaf-eb37-8bd6b53cf38a@web.de>
In-Reply-To: <bfb3e786-a64f-ecaf-eb37-8bd6b53cf38a@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Coccinelle <cocci@systeme.lip6.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-410386229-1603800215=:2847
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Tue, 27 Oct 2020, Markus Elfring wrote:

> >> … git grep -l -w \( -e for_each_node_by_type … -e for_each_node_with_property \) -- '*.c'
> >>
> >>
> >> How do you think about to omit these parentheses here?
> >
> > Does it make a difference?
>
> I find that it can be nicer to avoid the passing of unnecessary characters.
>
> * The compilation of the affected OCaml source files can eventually benefit
>   from another bit of clean-up, can't it?

I have no idea what this means.

julia

> * The called software components do also not need to fiddle with such extra data then.
>
> Regards,
> Markus
>
--8323329-410386229-1603800215=:2847--
