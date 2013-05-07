From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 May 2013 06:55:19 +0000
Subject: Re: [PATCH] scripts: Coccinelle script for pci_free_consistent()
Message-Id: <20130507065519.GB1360@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130428190457.Horde.NTwcWjfi51YkygsVUIuvrA7@wimap.feld.cvut.cz>
In-Reply-To: <20130428190457.Horde.NTwcWjfi51YkygsVUIuvrA7@wimap.feld.cvut.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


On Mon, May 06, 2013 at 11:20:43PM +0200, strnape1@fel.cvut.cz wrote:
> Hi,
> 
> I would love to, but to be honest Im a bit confused about the
> mailing lists - which one is the main Linux kernel mailing list?
> http://vger.kernel.org/vger-lists.html lists a lot of linux related
> ones and I also cant find any email for Michal Marek (only the
> mmarek@xxxxxxx version). The Coccinelle list is probably
> cocci(at)systeme.lip6.fr, so at least that I did find.
> Would appreciate any further info.
> 

It should be that ./scripts/get_maintainer.pl gives you the list
of people to email.  It doesn't work for a new file but you can
run it on the parent directory:

$ ./scripts/get_maintainer.pl -f scripts/coccinelle/free/
Julia Lawall <Julia.Lawall@lip6.fr> (supporter:COCCINELLE/Semant...)
Gilles Muller <Gilles.Muller@lip6.fr> (supporter:COCCINELLE/Semant...)
Nicolas Palix <nicolas.palix@imag.fr> (supporter:COCCINELLE/Semant...)
cocci@systeme.lip6.fr (moderated list:COCCINELLE/Semant...)
linux-kernel@vger.kernel.org (open list)

The kernel mailing list (LKML) is linux-kernel@vger.kernel.org.  The
bad thing is that Michal Marek <mmarek@suse.cz> is not in the list.
He should be added to the COCCINELLE section in the MAINTAINERS
file.

Btw, my normal rule for sending patches is that I only CC lkml if
there isn't another mailing list.  Everyone who cares about
coccinelle scripts is on the cocci@systeme.lip6.fr email list.  If
you email LKML then Andrew Morton will read it but literally no one
else reads the patches from LKML.

I always CC one public development mailing list so if there is
nothing else I do CC lkml.

regards,
dan carpenter

