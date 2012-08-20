From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 20 Aug 2012 16:28:13 +0000
Subject: Re: [memcg:since-3.5 41/99] (.text+0xa0998): undefined reference to `get_kernel_page'
Message-Id: <20120820162813.GA8642@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120819235924.GA25856@localhost>
In-Reply-To: <20120819235924.GA25856@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Aug 20, 2012 at 05:29:03PM +0200, Michal Hocko wrote:
> On Mon 20-08-12 22:29:19, Wu Fengguang wrote:
> > On Mon, Aug 20, 2012 at 04:12:31PM +0200, Michal Hocko wrote:
> > > On Mon 20-08-12 21:22:09, Wu Fengguang wrote:
> > > > On Mon, Aug 20, 2012 at 02:39:50PM +0200, Michal Hocko wrote:
> > > > > On Mon 20-08-12 10:06:30, Mel Gorman wrote:
> > > > > > On Mon, Aug 20, 2012 at 07:59:24AM +0800, Fengguang Wu wrote:
> > > > > > > Hi Mel,
> > > > > > > 
> > > > > > > FYI, kernel build failed on
> > > > > > > 
> > > > > > > tree:   git://github.com/mstsxfx/memcg-devel.git since-3.5
> > > > > > > head:   a49301bd151e60fc22dc5b934358a9bb80bed7b3
> > > > > > > commit: c4183d4ae946b7965f2657cf97da742c87fa9d96 [41/99] nfs: enable swap on NFS
> > > > > > > config: m32r-m32104ut_defconfig (attached as .config)
> > > > > > > 
> > > > > > > All related error/warning messages:
> > > > > > > 
> > > > > > > fs/built-in.o: In function `nfs_file_direct_read':
> > > > > > > (.text+0xa0998): undefined reference to `get_kernel_page'
> > > > > > > fs/built-in.o: In function `nfs_file_direct_write':
> > > > > > > (.text+0xa10b8): undefined reference to `get_kernel_page'
> > > > > > > 
> > > > > > 
> > > > > > Michal, as this is the memcg tree and not akpm or linux-next could this
> > > > > > build error be a merge problem in your tree?
> > > > > 
> > > > > Hmm, maybe my tree is missing some follow up fix but git diff sees
> > > > > nothin relevant. Neverheless I have noticed that both CONFIG_SWAP and
> > > > > CONFIG_NFS_SWAP are disabled. get_kernel_page is defined in mm/swap.c
> > > > > but that one should be compiled in regardless the SWAP configuration.
> > > > 
> > > > I find that at _that_ commit, get_kernel_page() is defined in
> > > > mm/memory.c which will only be compiled on CONFIG_MMU.
> > > > 
> > > > The get_kernel_page*() definitions are later moved to mm/swap.c by
> > > > 
> > > > commit 6503ced02700f5f561c8a2a66f5d93117fb230cd
> > > > Author:     Mel Gorman <mgorman@suse.de>
> > > > CommitDate: Thu Jul 26 11:25:53 2012 +0200
> > > > 
> > > >     mm-add-get_kernel_page-for-pinning-of-kernel-addresses-for-i-o-fix
> > >  
> > > But that means that it is not CONFIG_MMU dependent anymore, right?
> > 
> > Yes. It presents a problem for bisectability, however it seems only a
> > problem in the since-3.5 branch: the patches sent to Linus are
> > actually in good order. So it should be fine.
> 
> OK, I see so this is a bisectability test and the tip of the branch

Yeah.

> compiles without any issues, right?

It have some other issues instead. You didn't receive emails about
them because my system only complaint about "new" issues :-)

In file included from /c/wfg/linux/arch/m32r/boot/compressed/misc.c:25:0:
/c/wfg/linux/arch/m32r/boot/compressed/m32r_sio.c:11:13: warning: conflicting types for built-in function 'putc' [enabled by default]
  MODPOST 111 modules
ERROR: "memory_start" [fs/udf/udf.ko] undefined!
ERROR: "memory_end" [fs/udf/udf.ko] undefined!
ERROR: "memory_end" [drivers/scsi/sg.ko] undefined!
ERROR: "memory_start" [drivers/scsi/sg.ko] undefined!
ERROR: "memory_end" [drivers/i2c/i2c-dev.ko] undefined!
ERROR: "memory_start" [drivers/i2c/i2c-dev.ko] undefined!
  GZIP    arch/m32r/boot/compressed/vmlinux.bin.gz
make[2]: *** [__modpost] Error 1
make[1]: *** [modules] Error 2
make[1]: *** Waiting for unfinished jobs....
  LD      arch/m32r/boot/compressed/piggy.o
/usr/local/gcc-4.6.3-nolibc/m32r-linux/bin/m32r-linux-ld: target elf32-m32r not found

> > Btw, is it meaningful for me to test the bisectability of all the
> > memcg branches? If not, you may give me a list or pattern for me to
> > take care.
> 
> Well, I do not think that this kind of test makes sense for the tree
> because fixups are always done as a separate commits to prevent from
> rebasing. Andrew always folds the fixups into the final patch which is
> sent to Linus or who ever should push it further.

Yeah the build script have taken care of these follow-up fixes:

has_akpm_fix()
{       
        [[ $branch = 'next/akpm' || $branch =~ 'memcg/' ]] || return 1
        
        [[ $(git_commit_subject $commit) =~ (fix|build|error|warning) ]] && return 0
        [[ $(git_commit_changelog $commit) =~ (build|compile|gcc|sparse|error|warning) ]] && return 0
        
        next_commit=$(echo "$*" | sed -ne "$((iterated_commits+2))p")
        [[ $(git_commit_subject $next_commit) =~ (fix|build|error|warning) ]] && return 0
        [[ $(git_commit_changelog $next_commit) =~ (build|compile|gcc|sparse|error|warning) ]] && return 0
        return 1
}       

Thanks,
Fengguang
