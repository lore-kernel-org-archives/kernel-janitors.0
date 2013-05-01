From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 01 May 2013 10:32:40 +0000
Subject: Re: [PATCH] scripts: Coccinelle script for pci_free_consistent()
Message-Id: <alpine.DEB.2.02.1305011821230.1968@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130428190457.Horde.NTwcWjfi51YkygsVUIuvrA7@wimap.feld.cvut.cz>
In-Reply-To: <20130428190457.Horde.NTwcWjfi51YkygsVUIuvrA7@wimap.feld.cvut.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This has quite a lot of false positives.  For example in
drivers/firewire/nosy.c
at the return 0 just above the label fail_free_irq in the function
add_card.  Return 0 usually indicates success, and the allocated data is
usually saved somwhere before the success exit.  In nosy.c, the allocated
data is stored in a field of the lynx structure, and the lynx structure is
then stored in card_list, via a call to list_add_tail.

Maybe it would be sufficient not to mark a return with p2 when the return
does return 0.  You would thus have:

(
if (id = NULL) { ... }
|
return 0;
|
*return@p2 ...;
)

You might want to limit id to be a "local idexpression" instead of an
arbitrary expression.  If there is x->y = fn(...), x may be a parameter,
or may be a variable that is stored or freed in some other way, hiding the
call to pci_free_consistent.

Also, you don't need the <... ...> around the rule.

There is also a typo in your first keyword.

Anyway, you can make those changes and look at the result, and see what
the rate of false positives seems to be.  It would be good to put a
confidence level in your semantic patch as well.  You can see examples
in the Linux coccinelle directory.

julia

On Tue, 30 Apr 2013, strnape1@fel.cvut.cz wrote:

> Created coccinelle script for reporting missing pci_free_consistent() calls.
>
> Signed-off-by: Petr Strnad <strnape1@fel.cvut.cz>
> ---
> diff --git a/scripts/coccinelle/free/pci_free_consistent.cocci
> b/scripts/coccinelle/free/pci_free_consistent.cocci
> new file mode 100644
> index 0000000..1196485
> --- /dev/null
> +++ b/scripts/coccinelle/free/pci_free_consistent.cocci
> @@ -0,0 +1,32 @@
> +/// Find missing pci_free_consistent for every pci_alloc_consistent.
> +///
> +// Copyright: (C) 2013 Petr Strnad.  GPLv2.
> +// URL: http://coccinelle.lip6.fr/
> +// Keywords: pci_free_consisten, pci_alloc_consistent
> +// Options: --no-includes --include-headers
> +
> +virtual report
> +
> +@search@
> +expression id,x,y,z;
> +position p1,p2;
> +@@
> +
> +<...
> +id = pci_alloc_consistent@p1(x,y,z)
> +... when != pci_free_consistent(x,y,id,z)
> +    when forall
> +(
> +if (id = NULL) { ... }
> +|
> +*return@p2 ...;
> +)
> +...>
> +
> +@script:python depends on report@
> +p1 << search.p1;
> +p2 << search.p2;
> +@@
> +
> +msg = "ERROR: missing pci_free_consistent; pci_alloc_consistent on line %s
> and return without freeing on line %s" % (p1[0].line,p2[0].line)
> +coccilib.report.print_report(p2[0],msg)
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
