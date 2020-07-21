From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 21 Jul 2020 08:24:30 +0000
Subject: Re: [PATCH v3 1/3] coccinelle: api: extend memdup_user transformation with GFP_USER
Message-Id: <b271c2f0-3852-e557-b671-a6b44ad10c19@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Denis Efremov <efremov@linux.com>, Coccinelle <cocci@systeme.lip6.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <julia.lawall@inria.fr>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> Match GFP_USER and optional __GFP_NOWARN allocations with
> memdup_user.cocci rule.

I suggest to clarify software design consequences according to such information
a bit more.


I find it helpful if you would have included also my email address directly
in the message field “To” or “Cc”.
Are there further reasons to consider for the extension of the recipient lists?


> +-  to = \(kmalloc\|kzalloc\)
> +-		(size,\(GFP_KERNEL\|GFP_USER\|
> +-		      \(GFP_KERNEL\|GFP_USER\)|__GFP_NOWARN\));

* Would you ever dare to specify such a source code search pattern
  on a single line?

* I find the specification of SmPL disjunctions questionable
  for the determination of relevant flags.
  Could previous patch review trigger concerns and further considerations
  for the proper handling of optional source code parts?


> +*  to = \(kmalloc@p\|kzalloc@p\)
> +		(size,\(GFP_KERNEL\|GFP_USER\|
> +		      \(GFP_KERNEL\|GFP_USER\)|__GFP_NOWARN\));

Would you like to use the SmPL asterisk really only for a single line?


How will the chances evolve to continue the clarification also for
the open issue “Safer source code analysis by "memdup_user.cocci"”?
https://github.com/coccinelle/coccinelle/issues/78

Regards,
Markus
