From: Mel Gorman <mgorman@suse.de>
Date: Tue, 31 Jul 2012 13:53:45 +0000
Subject: Re: [next:akpm 147/308] ERROR: "get_kernel_page" [fs/nfs/nfs.ko] undefined!
Message-Id: <20120731135345.GQ612@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120731114516.GA17252@localhost>
In-Reply-To: <20120731114516.GA17252@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jul 31, 2012 at 07:45:16PM +0800, Fengguang Wu wrote:
> Hi Mel,
> 
> Kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
> head:   6e81859e67505899e9d6c4f5b1cd9fbcf65997bd
> commit: 2866c9bbc69e80d22caef0230ebc3d95df501b68 [147/308] nfs: enable swap on NFS
> config: blackfin-BF533-EZKIT_defconfig (attached as .config)
> 
> All related error/warning messages:
> 
> ERROR: "get_kernel_page" [fs/nfs/nfs.ko] undefined!
> 

This is a no MMU config. There should be a patch in-flight in Andrew's tree
called mm-add-get_kernel_page-for-pinning-of-kernel-addresses-for-i-o-fix
that fixes this by moving the missing functions from memory.c to swap.c

-- 
Mel Gorman
SUSE Labs
