From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 20 Aug 2012 13:22:09 +0000
Subject: Re: [memcg:since-3.5 41/99] (.text+0xa0998): undefined reference to `get_kernel_page'
Message-Id: <20120820132209.GA6844@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120819235924.GA25856@localhost>
In-Reply-To: <20120819235924.GA25856@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Aug 20, 2012 at 02:39:50PM +0200, Michal Hocko wrote:
> On Mon 20-08-12 10:06:30, Mel Gorman wrote:
> > On Mon, Aug 20, 2012 at 07:59:24AM +0800, Fengguang Wu wrote:
> > > Hi Mel,
> > > 
> > > FYI, kernel build failed on
> > > 
> > > tree:   git://github.com/mstsxfx/memcg-devel.git since-3.5
> > > head:   a49301bd151e60fc22dc5b934358a9bb80bed7b3
> > > commit: c4183d4ae946b7965f2657cf97da742c87fa9d96 [41/99] nfs: enable swap on NFS
> > > config: m32r-m32104ut_defconfig (attached as .config)
> > > 
> > > All related error/warning messages:
> > > 
> > > fs/built-in.o: In function `nfs_file_direct_read':
> > > (.text+0xa0998): undefined reference to `get_kernel_page'
> > > fs/built-in.o: In function `nfs_file_direct_write':
> > > (.text+0xa10b8): undefined reference to `get_kernel_page'
> > > 
> > 
> > Michal, as this is the memcg tree and not akpm or linux-next could this
> > build error be a merge problem in your tree?
> 
> Hmm, maybe my tree is missing some follow up fix but git diff sees
> nothin relevant. Neverheless I have noticed that both CONFIG_SWAP and
> CONFIG_NFS_SWAP are disabled. get_kernel_page is defined in mm/swap.c
> but that one should be compiled in regardless the SWAP configuration.

I find that at _that_ commit, get_kernel_page() is defined in
mm/memory.c which will only be compiled on CONFIG_MMU.

The get_kernel_page*() definitions are later moved to mm/swap.c by

commit 6503ced02700f5f561c8a2a66f5d93117fb230cd
Author:     Mel Gorman <mgorman@suse.de>
CommitDate: Thu Jul 26 11:25:53 2012 +0200

    mm-add-get_kernel_page-for-pinning-of-kernel-addresses-for-i-o-fix

> I do not see this error on x86_64 with the above two disabled. Is it
> possible that this is something m32r specific? Possibly some confusion
> wrt. EXPORT_SYMBOL_GPL?

I tried EXPORT_SYMBOL, still the same. So it should be due to related
to CONFIG_MMU which is missing in m32104ut_defconfig.

Thanks,
Fengguang
