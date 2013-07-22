From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Jul 2013 13:02:55 +0000
Subject: Re: [patch] btrfs/raid56: fix and cleanup some error paths
Message-Id: <20130722130255.GH5636@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130722065515.GB14617@longonot.mountain>
 <51ECF184.9030305@cn.fujitsu.com>
In-Reply-To: <51ECF184.9030305@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miao Xie <miaox@cn.fujitsu.com>
Cc: Chris Mason <chris.mason@fusionio.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jul 22, 2013 at 04:47:00PM +0800, Miao Xie wrote:
> On mon, 22 Jul 2013 09:55:15 +0300, Dan Carpenter wrote:
> > The alloc_rbio() frees "raid_map" and "bbio" on error, so there is a
> > potential double free bug in raid56_parity_write().  The
> > raid56_parity_write() and raid56_parity_recover() functions should still
> > free "raid_map" and "bbio" on error if other errors occur though, so I
> > have added some more calls to kfree().
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> >From the viewpoint of the readability, it is better to free raid_map and bbio
> in the caller, I think. But it is up to you.

Normally, yes, you are right, but in this case the code makes sense
as is.  We would have to free it in btrfs_map_bio() but we actually
allocate it in __btrfs_map_block().  It would be just as weird as
the current code.

The current code is not ugly, it's just that complicated things
require complicated code.

regards,
dan carpenter

