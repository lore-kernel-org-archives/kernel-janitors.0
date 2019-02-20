From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Feb 2019 06:10:09 +0000
Subject: Re: [PATCH -next] btrfs: Fix type conversion in btrfs_read_root_item
Message-Id: <20190220061009.GN17104@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190220030840.188854-1-yuehaibing@huawei.com>
 <20190220055621.GM17104@kadam>
In-Reply-To: <20190220055621.GM17104@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Feb 20, 2019 at 08:58:43AM +0300, Dan Carpenter wrote:
> On Wed, Feb 20, 2019 at 03:08:40AM +0000, YueHaibing wrote:
> > btrfs_item_size_nr return value is u32, convert it to int may result
> > in truncation.Also read_extent_buffer expect a unsigned param, so
> > min_t should use type u32 to compare.
> > 
> > Fixes: 8ea05e3a4262 ("Btrfs: introduce subvol uuids and times")
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > ---
> >  fs/btrfs/root-tree.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/btrfs/root-tree.c b/fs/btrfs/root-tree.c
> > index 02d1a57af78b..893d12fbfda0 100644
> > --- a/fs/btrfs/root-tree.c
> > +++ b/fs/btrfs/root-tree.c
> > @@ -21,12 +21,12 @@ static void btrfs_read_root_item(struct extent_buffer *eb, int slot,
> >  				struct btrfs_root_item *item)
> >  {
> >  	uuid_le uuid;
> > -	int len;
> > +	u32 len;
> >  	int need_reset = 0;
> >  
> >  	len = btrfs_item_size_nr(eb, slot);
> >  	read_extent_buffer(eb, item, btrfs_item_ptr_offset(eb, slot),
> > -			min_t(int, len, (int)sizeof(*item)));
>                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Yeah, min_t() should normally cast to unsigned and the extra cast is
> silly.
> 

Btw, I shouldn't have had to dig through the patch to find the *real*
reason you wrote it.  A better description would have said:

    There is a messy cast here:

	min_t(int, len, (int)sizeof(*item)));

    min_t() should normally cast to unsigned.  It's not possible for
    "len" to be negative, but if it were then then we definitely
    wouldn't want to pass negatives to read_extent_buffer().  Also there
    is an extra cast.

    This patch shouldn't affect runtime, it's just a clean up.

regards,
dan carpenter
