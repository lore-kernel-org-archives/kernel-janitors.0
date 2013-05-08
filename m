From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 08 May 2013 14:49:32 +0000
Subject: Re: [PATCH] scripts: Coccinelle script for pci_free_consistent()
Message-Id: <alpine.DEB.2.02.1305081645180.2025@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130428190457.Horde.NTwcWjfi51YkygsVUIuvrA7@wimap.feld.cvut.cz>
In-Reply-To: <20130428190457.Horde.NTwcWjfi51YkygsVUIuvrA7@wimap.feld.cvut.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Here is a proposal.  Some features:

* It assumes that the result of pci_alloc_consistent is null tested, and
doesn't report any problems before that.

* It uses exists rather than forall, to find a bug when there is a problem
on just one execution path.

* It gives no warning if the return value is stored elsewhere or is freed
under some kinds of if.

* It recognizes 1 as a success value.

On linux-next, this gives 10 reports.  At least half of them are false
positives, mostly due to interprocedural effects, which this rule does not
at all take into account.

julia

/// Find missing pci_free_consistent for every pci_alloc_consistent.
///
// Confidence: Moderate
// Copyright: (C) 2013 Petr Strnad.  GPLv2.
// URL: http://coccinelle.lip6.fr/
// Keywords: pci_free_consistent, pci_alloc_consistent
// Options: --no-includes --include-headers

virtual report
virtual org

@search@
local idexpression id;
expression x,y,z,e;
position p1,p2;
type T;
@@

id = pci_alloc_consistent@p1(x,y,&z)
... when != e = id
if (id = NULL || ...) { ... return ...; }
... when != pci_free_consistent(x,y,id,z)
    when != if (id) { ... pci_free_consistent(x,y,id,z) ... }
    when != if (y) { ... pci_free_consistent(x,y,id,z) ... }
    when != e = (T)id
    when exists
(
return 0;
|
return 1;
|
return id;
|
return@p2 ...;
)

@script:python depends on report@
p1 << search.p1;
p2 << search.p2;
@@

msg = "ERROR: missing pci_free_consistent; pci_alloc_consistent on line %s and return without freeing on line %s" % (p1[0].line,p2[0].line)
coccilib.report.print_report(p2[0],msg)

@script:python depends on org@
p1 << search.p1;
p2 << search.p2;
@@

msg = "ERROR: missing pci_free_consistent; pci_alloc_consistent on line %s and return without freeing on line %s" % (p1[0].line,p2[0].line)
cocci.print_main(msg,p1)
cocci.print_secs("",p2)

