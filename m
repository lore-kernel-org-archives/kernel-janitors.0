From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Fri, 13 Jul 2012 08:50:24 +0000
Subject: Re: [nf-next:mmap-netlink 65/68] net/netfilter/nfnetlink_queue_core.c:407:23: warning: unused variab
Message-Id: <20120713085024.GB19678@1984>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120712235145.GD5608@localhost>
In-Reply-To: <20120712235145.GD5608@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jul 13, 2012 at 10:37:19AM +0200, Florian Westphal wrote:
> Fengguang Wu <fengguang.wu@intel.com> wrote:
> > tree:   git://150.214.188.80/nf-next mmap-netlink
> > head:   c7e7243d0b69e2323dde057c28f1102d00e5a3c6
> > commit: b55f8ac10d3ef4c4379afabaa1f766de4d81a8a5 [65/68] nfqueue: extend spinlocked section for mmap'd sockets
> > 
> > All warnings:
> > 
> > net/netfilter/nfnetlink_queue_core.c: In function 'nfqnl_enqueue_packet':
> > net/netfilter/nfnetlink_queue_core.c:407:23: warning: unused variable 'size' [-Wunused-variable]
> 
> Thanks for reporting.
> 
> Pablo, please consider squashing this in with the original patch
> before submitting for inclusion:
> 
> From: Florian Westphal <fw@strlen.de>
> Date: Fri, 13 Jul 2012 09:59:30 +0200
> Subject: [PATCH] netfilter: nf_queue: kill unused variable
> 
> In function 'nfqnl_enqueue_packet':
> warning: unused variable 'size' [-Wunused-variable]
> 
> caused by commit b55f8ac10d3ef4c4379afabaa1f766de4d81a8a5
> (nfqueue: extend spinlocked section for mmap'd sockets)
> 
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Signed-off-by: Florian Westphal <fw@strlen.de>

Thanks Florian, I'll do.
