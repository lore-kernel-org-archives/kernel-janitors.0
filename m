From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Thu, 06 Sep 2012 02:49:14 +0000
Subject: Re: [powerpc:next 11/29] arch/powerpc/platforms/pseries/iommu.c:1064:2: error: implicit declaration
Message-Id: <1346899754.19098.15.camel@pasglop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120906022003.GB16076@localhost>
 <1346899471.19098.14.camel@pasglop>
In-Reply-To: <1346899471.19098.14.camel@pasglop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

On Thu, 2012-09-06 at 12:44 +1000, Benjamin Herrenschmidt wrote:
> On Thu, 2012-09-06 at 10:20 +0800, Fengguang Wu wrote:
> > Hi Michael,
> > 
> > FYI, kernel build failed on
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/benh/powerpc.git next
> > head:   8b64a9dfb091f1eca8b7e58da82f1e7d1d5fe0ad
> > commit: 474e3d569b63f7275cfec072d7ef7b2ffb8904c8 [11/29] powerpc/pseries: Remove uses of abs_to_virt() and virt_to_abs()
> > config: powerpc-allmodconfig (attached as .config)
> > 
> > All related error/warning messages:
> > 
> > arch/powerpc/platforms/pseries/iommu.c: In function 'enable_ddw':
> > arch/powerpc/platforms/pseries/iommu.c:1064:2: error: implicit declaration of function 'memblock_end_of_DRAM' [-Werror=implicit-function-declaration]
> > cc1: some warnings being treated as errors
> 
> Thanks. That seems to be building in my tree oddly, I didn't even have a
> warning. Maybe some conditional inclusion ? I will add a commit that
> adds an explicit #include of memblock.h

Ok, I see. It's a subtle bisection breakage, the next commit fixes it.
Oh well, I won't rebase for that, but thanks for the heads up.

Cheers,
Ben.


