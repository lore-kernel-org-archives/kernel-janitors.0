From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 21 Jul 2007 13:54:26 +0000
Subject: another project:  reducing the EXPERIMENTAL clutter in the Kconfig
Message-Id: <Pine.LNX.4.64.0707210944340.22717@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  one of the points raised in a recent thread on LKML is that there is
an overabundance of kernel features that are still tagged as
"EXPERIMENTAL" in the various Kconfig files that have clearly matured
way beyond that, but no one's bothered to ever go back and remove that
designation.

  you can see a lot of this by running something like:

$ grep -w -B3 -A2 EXPERIMENTAL $(find . -name Kconfig*) | less

from the top of the source tree.  i mean, consider:

...
./net/ipv6/netfilter/Kconfig:menu "IPv6: Netfilter Configuration (EXPERIMENTAL)"
./net/ipv6/netfilter/Kconfig:   depends on INET && IPV6 && NETFILTER && EXPERIMENTAL
...

  is IPv6 filtering really still experimental?  in addition, there's
plenty of inconsistency where a feature is *tagged* as experimental
but doesn't *display* as such, as in:

./net/ipv6/netfilter/Kconfig-config IP6_NF_IPTABLES
./net/ipv6/netfilter/Kconfig-   tristate "IP6 tables support (required for filtering)"
./net/ipv6/netfilter/Kconfig:   depends on INET && IPV6 && EXPERIMENTAL

there's plenty of potential cleanup in terms of making things like
that consistent but, at the very least, there's certainly enough to do
in terms of just *stripping* unnecessary EXPERIMENTAL dependencies out
of the files where it's not appropriate any more.

  if someone's interested, a place to start might be to do this on a
subsystem by subsystem basis -- find a subsystem that's still tagged
as EXPERIMENTAL, email the maintainer and ask if that's still
appropriate and, if not, offer to submit a patch to change it.  it can
all be done little by little.  any takers?

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
