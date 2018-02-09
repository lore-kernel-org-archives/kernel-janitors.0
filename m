From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Feb 2018 14:10:20 +0000
Subject: Re: scripts/coccinelle/misc/shift.cocci: Refactoring?
Message-Id: <a241776d-85bf-cbf1-067b-fbd0b80c0e5e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1518094434-12852-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1518094434-12852-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr, Julia Lawall <julia.lawall@lip6.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>

> +|
> +WARN_ON(x op@p y)
> +|
> +WARN_ON_ONCE(x op@p y)
> +|

Can it be nice to work with nested SmPL disjunctions so that a bit of
duplicate SmPL code will be reduced?


> +coccilib.org.print_todo(j0[0], msg)

Will it be nicer to pass a string literal instead of a variable for the message
as a method parameter?

Regards,
Markus
