From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Thu, 06 Sep 2012 03:05:56 +0000
Subject: Re: [powerpc:next 11/29] arch/powerpc/platforms/pseries/iommu.c:1064:2: error: implicit declaration
Message-Id: <1346900756.19098.20.camel@pasglop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120906022003.GB16076@localhost>
 <1346899471.19098.14.camel@pasglop> <1346899754.19098.15.camel@pasglop>
 <20120906030326.GA16800@localhost>
In-Reply-To: <20120906030326.GA16800@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

On Thu, 2012-09-06 at 11:03 +0800, Fengguang Wu wrote:
> 
> No problem. Sorry I didn't know that. Will test HEAD commits only for
> this branch in future.

Actually, I'd rather you continue doing bisection tests, it's good, I
can whack on the head of people who submit stuff with breakage.

In fact, next time around, I'll try to be more pro-active at putting
things in my rebase-able test branch so you get a chance to run your
tests on it and we can find & fix these before it hits next. I'll let
you know when I do it.

In the meantime, maybe just blacklist those commits ?

Cheers,
Ben.


