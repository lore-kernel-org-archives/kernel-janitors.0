From: Vegard Nossum <vegard.nossum@gmail.com>
Date: Thu, 12 Jun 2008 21:05:02 +0000
Subject: Removal of static per-cpu variables that are initialized to zero
Message-Id: <20080612210502.GA3283@damson.getinternet.no>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

If you're reading this, it's probably because you're also the recipient of
a patch that removes some occurences of "static DEFINE_PER_CPU ... = 0;".

It seemed more natural to put the rationale in one place, so please respond
to this e-mail if you want to discuss something that applies to the whole
series. (The separate patches don't have all the Ccs, to save you from
getting too many annoying trivial patches. I'll Cc everything to the kernel-
janitors list, however.)

This is following a discussion on LKML where David Miller confirmed that the
initialization of these variables were a work-around for an old version of
gcc (3.1) on sparc only, which would otherwise place the symbols in the wrong
section. In either case, there are now so many other places in the kernel
which _don't_ initialize static per-cpu variables that it seems pointless to
leave these around (it wouldn't make a difference in practice).

Cheers.


The patches:
      kprobes: remove intialization of static per-cpu variable
      rcu: remove initialization of static per-cpu variable
      taskstats: remove initialization of static per-cpu variable
      softirq: remove initialization of static per-cpu variable
      net: remove initialization of static per-cpu variables
      mm: remove initialization of static per-cpu variables


Vegard
