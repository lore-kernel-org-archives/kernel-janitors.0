From: Dave Kleikamp <dave.kleikamp@oracle.com>
Date: Thu, 18 Oct 2012 19:26:25 +0000
Subject: Re: [shaggy:loop_v3 20/22] fs/nfs/nfs4file.c:120:50-51: aio_read: first occurrence line 124, second
Message-Id: <508057E1.6040101@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121018025121.GG21995@yliu-dev.sh.intel.com>
In-Reply-To: <20121018025121.GG21995@yliu-dev.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/17/2012 09:51 PM, Yuanhan Liu wrote:
> Hi Dave,
> 
> FYI, there are coccinelle warnings in
> 
> tree:   git://github.com/kleikamp/linux-shaggy loop_v3
> head:   b8ee8b4bb91520b2c4a1f567977a737e9e71c449
> commit: 92d2ac3e5a2136d9dfdad4cd10c948c49db6502b [20/22] nfs: add support for read_iter, write_iter
> 
> + fs/nfs/nfs4file.c:120:50-51: aio_read: first occurrence line 124, second occurrence line 126
> + fs/nfs/nfs4file.c:120:50-51: aio_write: first occurrence line 125, second occurrence line 127

These tools catch everything! Trivial to fix.

Thanks,
Shaggy

> 
> vim +120 fs/nfs/nfs4file.c
> 
> 05990d1b Trond Myklebust 2012-09-11  104  		if (!ret && !datasync)
> 05990d1b Trond Myklebust 2012-09-11  105  			/* application has asked for meta-data sync */
> 05990d1b Trond Myklebust 2012-09-11  106  			ret = pnfs_layoutcommit_inode(inode, true);
> 05990d1b Trond Myklebust 2012-09-11  107  		mutex_unlock(&inode->i_mutex);
> dcfc4f25 Trond Myklebust 2012-09-11  108  		/*
> dcfc4f25 Trond Myklebust 2012-09-11  109  		 * If nfs_file_fsync_commit detected a server reboot, then
> dcfc4f25 Trond Myklebust 2012-09-11  110  		 * resend all dirty pages that might have been covered by
> dcfc4f25 Trond Myklebust 2012-09-11  111  		 * the NFS_CONTEXT_RESEND_WRITES flag
> dcfc4f25 Trond Myklebust 2012-09-11  112  		 */
> dcfc4f25 Trond Myklebust 2012-09-11  113  		start = 0;
> dcfc4f25 Trond Myklebust 2012-09-11  114  		end = LLONG_MAX;
> 05990d1b Trond Myklebust 2012-09-11  115  	} while (ret = -EAGAIN);
> 05990d1b Trond Myklebust 2012-09-11  116  
> ce4ef7c0 Bryan Schumaker 2012-07-16  117  	return ret;
> ce4ef7c0 Bryan Schumaker 2012-07-16  118  }
> ce4ef7c0 Bryan Schumaker 2012-07-16  119  
> ce4ef7c0 Bryan Schumaker 2012-07-16 @120  const struct file_operations nfs4_file_operations = {
> ce4ef7c0 Bryan Schumaker 2012-07-16  121  	.llseek		= nfs_file_llseek,
> ce4ef7c0 Bryan Schumaker 2012-07-16  122  	.read		= do_sync_read,
> ce4ef7c0 Bryan Schumaker 2012-07-16  123  	.write		= do_sync_write,
> ce4ef7c0 Bryan Schumaker 2012-07-16  124  	.aio_read	= nfs_file_read,
> ce4ef7c0 Bryan Schumaker 2012-07-16  125  	.aio_write	= nfs_file_write,
> 92d2ac3e Dave Kleikamp   2012-10-15  126  	.aio_read	= nfs_file_read,
> 92d2ac3e Dave Kleikamp   2012-10-15  127  	.aio_write	= nfs_file_write,
> 92d2ac3e Dave Kleikamp   2012-10-15  128  	.read_iter	= nfs_file_read_iter,
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Center
> Fengguang Wu, Yuanhan Liu                              Intel Corporation
> 
