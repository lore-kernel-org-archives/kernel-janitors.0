From: Theodore Ts'o <tytso@mit.edu>
Date: Wed, 19 Sep 2012 03:51:32 +0000
Subject: Re: ext4: convert file system to meta_bg if needed during resizing
Message-Id: <20120919035132.GB18707@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120918114634.GA12383@elgon.mountain>
In-Reply-To: <20120918114634.GA12383@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>

On Tue, Sep 18, 2012 at 02:46:35PM +0300, Dan Carpenter wrote:
>   1775          struct ext4_inode_info *ei = 0;
>                                         ^^^^^^
> Sparse is going to complain.  Not sure why Fengguang hasn't emailed you.

>   1791                  ei = EXT4_I(inode);
>                         ^^^^^^^^^^^^^^^^^^
> We only set "ei" if EXT4_FEATURE_COMPAT_RESIZE_INODE.
> ...

>   1829                  nr = le32_to_cpu(ei->i_data[EXT4_DIND_BLOCK]);
>                                          ^^^^^^^^^^
> Null deref.  Perhaps inode implies EXT4_FEATURE_COMPAT_RESIZE_INODE?

Inode does imply EXT4_FEATURE_COMPAT_RESIZE_INODE, but I should make
the code cleaner.

Thanks for pointing this out.

							- Ted
