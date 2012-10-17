From: Dave Kleikamp <dave.kleikamp@oracle.com>
Date: Wed, 17 Oct 2012 17:45:55 +0000
Subject: Re: [shaggy:loop_v3 10/22] fs/udf/file.c:134:2: warning: initialization from incompatible pointer ty
Message-Id: <507EEED3.6040907@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121017155046.GB21995@yliu-dev.sh.intel.com>
In-Reply-To: <20121017155046.GB21995@yliu-dev.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/17/2012 10:50 AM, Yuanhan Liu wrote:
> Hi Dave,
> 
> FYI, there are new compile warnings show up in
> 
> tree:   git://github.com/kleikamp/linux-shaggy loop_v3
> head:   b8ee8b4bb91520b2c4a1f567977a737e9e71c449
> commit: 0f07217750df7e56a7c11f9aeea1bf6f19fea621 [10/22] dio: Convert direct_IO to use iov_iter
> config: i386-randconfig-m013 (attached as .config)
> 
> All warnings:
> 
> fs/udf/file.c:134:2: warning: initialization from incompatible pointer type [enabled by default]
> fs/udf/file.c:134:2: warning: (near initialization for 'udf_adinicb_aops.direct_IO') [enabled by default]

Just missed this one in the forest of compiler output. Note to self:
pass the -s flag to make.

Thanks again,
Shaggy

> 
> vim +134 fs/udf/file.c
> 
> be021ee4 Nick Piggin       2007-10-16  118  	return simple_write_end(file, mapping, pos, len, copied, page, fsdata);
> ^1da177e Linus Torvalds    2005-04-16  119  }
> ^1da177e Linus Torvalds    2005-04-16  120  
> 5eec54fc Ian Abbott        2012-09-05  121  static ssize_t udf_adinicb_direct_IO(int rw, struct kiocb *iocb,
> 5eec54fc Ian Abbott        2012-09-05  122  				     const struct iovec *iov,
> 5eec54fc Ian Abbott        2012-09-05  123  				     loff_t offset, unsigned long nr_segs)
> 5eec54fc Ian Abbott        2012-09-05  124  {
> 5eec54fc Ian Abbott        2012-09-05  125  	/* Fallback to buffered I/O. */
> 5eec54fc Ian Abbott        2012-09-05  126  	return 0;
> 5eec54fc Ian Abbott        2012-09-05  127  }
> 5eec54fc Ian Abbott        2012-09-05  128  
> f5e54d6e Christoph Hellwig 2006-06-28  129  const struct address_space_operations udf_adinicb_aops = {
> 28de7948 Cyrill Gorcunov   2007-07-21  130  	.readpage	= udf_adinicb_readpage,
> 28de7948 Cyrill Gorcunov   2007-07-21  131  	.writepage	= udf_adinicb_writepage,
> 9c2fc0de Jan Kara          2012-09-05  132  	.write_begin	= udf_adinicb_write_begin,
> 9c2fc0de Jan Kara          2012-09-05  133  	.write_end	= udf_adinicb_write_end,
> 5eec54fc Ian Abbott        2012-09-05 @134  	.direct_IO	= udf_adinicb_direct_IO,
> ^1da177e Linus Torvalds    2005-04-16  135  };
> ^1da177e Linus Torvalds    2005-04-16  136  
> 543ade1f Badari Pulavarty  2006-09-30  137  static ssize_t udf_file_aio_write(struct kiocb *iocb, const struct iovec *iov,
> cb00ea35 Cyrill Gorcunov   2007-07-19  138  				  unsigned long nr_segs, loff_t ppos)
> ^1da177e Linus Torvalds    2005-04-16  139  {
> ^1da177e Linus Torvalds    2005-04-16  140  	ssize_t retval;
> 543ade1f Badari Pulavarty  2006-09-30  141  	struct file *file = iocb->ki_filp;
> 5096e933 Josef Sipek       2006-12-08  142  	struct inode *inode = file->f_path.dentry->d_inode;
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Center
> Fengguang Wu, Yuanhan Liu                              Intel Corporation
> 
