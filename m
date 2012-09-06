From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 06 Sep 2012 03:18:01 +0000
Subject: Re: [powerpc:next 11/29] arch/powerpc/platforms/pseries/iommu.c:1064:2: error: implicit declaration
Message-Id: <20120906031801.GA16913@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120906022003.GB16076@localhost>
 <1346899471.19098.14.camel@pasglop>
 <1346899754.19098.15.camel@pasglop>
 <20120906030326.GA16800@localhost>
 <1346900756.19098.20.camel@pasglop>
In-Reply-To: <1346900756.19098.20.camel@pasglop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

On Thu, Sep 06, 2012 at 01:05:56PM +1000, Benjamin Herrenschmidt wrote:
> On Thu, 2012-09-06 at 11:03 +0800, Fengguang Wu wrote:
> > 
> > No problem. Sorry I didn't know that. Will test HEAD commits only for
> > this branch in future.
> 
> Actually, I'd rather you continue doing bisection tests, it's good, I
> can whack on the head of people who submit stuff with breakage.

OK.

> In fact, next time around, I'll try to be more pro-active at putting
> things in my rebase-able test branch so you get a chance to run your
> tests on it and we can find & fix these before it hits next. I'll let
> you know when I do it.

That would be great.

> In the meantime, maybe just blacklist those commits ?

Should not necessary if I understand you right. FYI the build system
will auto ignore all notified build errors and skip compiled commits.


Thanks,
Fengguang
