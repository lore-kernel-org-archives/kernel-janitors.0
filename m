From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 18 Jul 2020 12:14:20 +0000
Subject: Re: [v2 1/4] coccinelle: api: extend memdup_user transformation with GFP_USER
Message-Id: <0a961d1e-6bd2-45fd-113e-9258fe00a16a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0b9f2c58-e124-22d2-d91d-62a6e831c880@web.de>
 <alpine.DEB.2.22.394.2007180841520.2538@hadrien>
 <fa0ec546-9aee-5c95-428c-a225a3521f6f@web.de>
 <alpine.DEB.2.22.394.2007181034530.2538@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2007181034530.2538@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@inria.fr>, Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>
Cc: Gilles Muller <Gilles.Muller@lip6.fr>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> You proposed essentially  \( A \| B \) \( | C \| \)

Will the software development attention grow for a topic
like “Extend support for handling of optional source code parts”?
https://github.com/coccinelle/coccinelle/issues/53

How do you think about another tiny example script for the semantic patch language?

@display@
constant A, B;
@@
*A
?| B


elfring@Sonne:~/Projekte/Coccinelle/Probe> spatch --parse-cocci optional_disjunction_test3-20200718.cocci
…
warning: incompatible arity found on line 4
incompatible minus and plus code starting on lines 4 and 4


Regards,
Markus
