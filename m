From: Dave Kleikamp <dave.kleikamp@oracle.com>
Date: Thu, 18 Oct 2012 19:28:31 +0000
Subject: Re: [shaggy:loop_v3 20/22] fs/nfs/direct.c:142:5: error: too many arguments to function 'nfs_file_di
Message-Id: <5080585F.8040204@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121018025953.GH21995@yliu-dev.sh.intel.com>
In-Reply-To: <20121018025953.GH21995@yliu-dev.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/17/2012 09:59 PM, Yuanhan Liu wrote:
> Hi Dave,
> 
> FYI, kernel build failed on
> 
> tree:   git://github.com/kleikamp/linux-shaggy loop_v3
> head:   b8ee8b4bb91520b2c4a1f567977a737e9e71c449
> commit: 92d2ac3e5a2136d9dfdad4cd10c948c49db6502b [20/22] nfs: add support for read_iter, write_iter
> config: i386-randconfig-m015 (attached as .config)
> 
> All error/warnings:
> 
> fs/nfs/direct.c: In function 'nfs_direct_IO':
> fs/nfs/direct.c:142:5: warning: passing argument 2 of 'nfs_file_direct_read' from incompatible pointer type [enabled by default]
> In file included from fs/nfs/direct.c:51:0:
> include/linux/nfs_fs.h:448:16: note: expected 'struct iov_iter *' but argument is of type 'const struct iovec *'
> fs/nfs/direct.c:142:5: error: too many arguments to function 'nfs_file_direct_read'
> In file included from fs/nfs/direct.c:51:0:
> include/linux/nfs_fs.h:448:16: note: declared here
> fs/nfs/direct.c:144:5: warning: passing argument 2 of 'nfs_file_direct_write' from incompatible pointer type [enabled by default]
> In file included from fs/nfs/direct.c:51:0:
> include/linux/nfs_fs.h:450:16: note: expected 'struct iov_iter *' but argument is of type 'const struct iovec *'
> fs/nfs/direct.c:144:5: error: too many arguments to function 'nfs_file_direct_write'

My bad on this one. I didn't build with CONFIG_NFS_SWAP set.

Thanks,
Shaggy

> In file included from fs/nfs/direct.c:51:0:
> include/linux/nfs_fs.h:450:16: note: declared here
> fs/nfs/direct.c: In function 'nfs_direct_read_schedule':
> fs/nfs/direct.c:454:4: error: invalid use of undefined type 'struct bio_vec'
> fs/nfs/direct.c:454:31: error: dereferencing pointer to incomplete type
> fs/nfs/direct.c:456:8: error: invalid use of undefined type 'struct bio_vec'
> fs/nfs/direct.c:456:12: error: dereferencing pointer to incomplete type
> fs/nfs/direct.c:457:8: error: invalid use of undefined type 'struct bio_vec'
> fs/nfs/direct.c:457:12: error: dereferencing pointer to incomplete type
> fs/nfs/direct.c: In function 'nfs_direct_write_schedule':
> fs/nfs/direct.c:886:4: error: invalid use of undefined type 'struct bio_vec'
> fs/nfs/direct.c:886:31: error: dereferencing pointer to incomplete type
> fs/nfs/direct.c:888:4: error: invalid use of undefined type 'struct bio_vec'
> fs/nfs/direct.c:888:45: error: dereferencing pointer to incomplete type
> fs/nfs/direct.c:889:8: error: invalid use of undefined type 'struct bio_vec'
> fs/nfs/direct.c:889:12: error: dereferencing pointer to incomplete type
> 
> vim +142 fs/nfs/direct.c
> 
> 0f072177 Dave Kleikamp 2012-10-15  136  
> a564b8f0 Mel Gorman    2012-07-31  137  	VM_BUG_ON(iocb->ki_left != PAGE_SIZE);
> a564b8f0 Mel Gorman    2012-07-31  138  	VM_BUG_ON(iocb->ki_nbytes != PAGE_SIZE);
> a564b8f0 Mel Gorman    2012-07-31  139  
> a564b8f0 Mel Gorman    2012-07-31  140  	if (rw = READ || rw = KERNEL_READ)
> 0f072177 Dave Kleikamp 2012-10-15  141  		return nfs_file_direct_read(iocb, iov, iter->nr_segs, pos,
> a564b8f0 Mel Gorman    2012-07-31 @142  				rw = READ ? true : false);
> 0f072177 Dave Kleikamp 2012-10-15  143  	return nfs_file_direct_write(iocb, iov, iter->nr_segs, pos,
> a564b8f0 Mel Gorman    2012-07-31  144  				rw = WRITE ? true : false);
> a564b8f0 Mel Gorman    2012-07-31  145  #endif /* CONFIG_NFS_SWAP */
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Center
> Fengguang Wu, Yuanhan Liu                              Intel Corporation
> 
