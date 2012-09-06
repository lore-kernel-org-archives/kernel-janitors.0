From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Thu, 06 Sep 2012 02:56:12 +0000
Subject: Re: [powerpc:next 24/29] drivers/atm/fore200e.h:263:3: error: redefinition of typedef 'opcode_t' wit
Message-Id: <1346900172.19098.17.camel@pasglop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120906021929.GA16076@localhost>
In-Reply-To: <20120906021929.GA16076@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: linuxppc-dev@lists.ozlabs.org, Meelis Roos <mroos@linux.ee>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Thu, 2012-09-06 at 10:19 +0800, Fengguang Wu wrote:
> Hi Ananth,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/benh/powerpc.git next
> head:   8b64a9dfb091f1eca8b7e58da82f1e7d1d5fe0ad
> commit: 8b7b80b9ebb46dd88fbb94e918297295cf312b59 [24/29] powerpc: Uprobes port to powerpc
> config: powerpc-allmodconfig (attached as .config)
> 
> All related error/warning messages:
> 
> In file included from drivers/atm/fore200e.c:70:0:
> drivers/atm/fore200e.h:263:3: error: redefinition of typedef 'opcode_t' with different type
> arch/powerpc/include/asm/probes.h:25:13: note: previous declaration of 'opcode_t' was here

This is a bit more annoying. Ananth, do we need that to be called
opcode_t for generic reasons or can we make it ppc_opcode_t ? If it has
to remain, I suppose we can try to change that ATM driver to use a
different type name...

(CC'ing Dave and Meelis who from the git history *might* have HW access
to test a possible patch).

Cheers,
Ben.


