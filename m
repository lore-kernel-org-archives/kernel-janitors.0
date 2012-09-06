From: David Miller <davem@davemloft.net>
Date: Thu, 06 Sep 2012 03:41:35 +0000
Subject: Re: [powerpc:next 24/29] drivers/atm/fore200e.h:263:3: error: redefinition of typedef 'opcode_t' wit
Message-Id: <20120905.234135.1451998549380446225.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120906021929.GA16076@localhost>
 <1346900172.19098.17.camel@pasglop>
In-Reply-To: <1346900172.19098.17.camel@pasglop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benh@kernel.crashing.org
Cc: linuxppc-dev@lists.ozlabs.org, mroos@linux.ee, fengguang.wu@intel.com, kernel-janitors@vger.kernel.org

From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Thu, 06 Sep 2012 12:56:12 +1000

> (CC'ing Dave and Meelis who from the git history *might* have HW access
> to test a possible patch).

Hardware isn't necessary, just make sure the resulting binary is
identical both before and after the change.
