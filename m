From: Josef Bacik <jbacik@fusionio.com>
Date: Tue, 07 Aug 2012 16:58:06 +0000
Subject: Re: [josef-btrfs:master 12/16] fs/btrfs/inode.c:78:19: sparse: symbol 'btrfs_dip_cachep' was not dec
Message-Id: <20120807165806.GC2141@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120807162015.GA10779@localhost>
In-Reply-To: <20120807162015.GA10779@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Aug 07, 2012 at 10:20:15AM -0600, Fengguang Wu wrote:
> Hi Josef,
> 
> FYI, there are new sparse warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/josef/btrfs-next.git master
> head:   1529b67c68e0ac3123a831815c26211d801ab975
> commit: 3f1d28fc7d56b5b6c77af4ca1f258dacdd508ce4 [12/16] Btrfs: use a slab for btrfs_dio_private
> 
> All sparse warnings:
> 
> + fs/btrfs/inode.c:78:19: sparse: symbol 'btrfs_dip_cachep' was not declared. Should it be static?
> 
> vim +78 fs/btrfs/inode.c
>     75	struct kmem_cache *btrfs_transaction_cachep;
>     76	struct kmem_cache *btrfs_path_cachep;
>     77	struct kmem_cache *btrfs_free_space_cachep;
>   > 78	struct kmem_cache *btrfs_dip_cachep;
>     79	
>     80	#define S_SHIFT 12
>     81	static unsigned char btrfs_type_by_mode[S_IFMT >> S_SHIFT] = {
> 
> Please consider folding the attached diff :-)
> 

Folded in, thanks!

Josef
