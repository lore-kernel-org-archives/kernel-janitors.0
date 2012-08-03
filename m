From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 03 Aug 2012 12:51:38 +0000
Subject: Re: [josef-btrfs:own-caching 10/12] fs/btrfs/disk-io.c:822:5: sparse: symbol 'btrfs_wq_btree_submit_
Message-Id: <20120803125138.GA19697@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120803000038.GA5734@localhost>
In-Reply-To: <20120803000038.GA5734@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 03, 2012 at 08:45:43AM -0400, Josef Bacik wrote:
> On Thu, Aug 02, 2012 at 06:00:38PM -0600, Fengguang Wu wrote:
> > Hi Josef,
> > 
> > There are new sparse warnings show up in
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/josef/btrfs-next.git own-caching
> > head:   c7fc403528c5a40ac1dad05296ba4835072bc03d
> > commit: b6579666166dc9043543fbae61ba81451aab628b [10/12] Btrfs: manage metadata cache ourselves
> > 
> > All sparse warnings:
> > 
> > + fs/btrfs/disk-io.c:822:5: sparse: symbol 'btrfs_wq_btree_submit_bio' was not declared. Should it be static?
> > + fs/btrfs/disk-io.c:921:5: sparse: symbol 'merge_bio' was not declared. Should it be static?
> > + fs/btrfs/disk-io.c:1049:5: sparse: symbol 'write_iolock_eb' was not declared. Should it be static?
> >   fs/btrfs/disk-io.c:2805:17: sparse: incompatible types in comparison expression (different address spaces)
> >   fs/btrfs/disk-io.c:2980:25: sparse: incompatible types in comparison expression (different address spaces)
> > 
> > vim +822 fs/btrfs/disk-io.c
> >    819			bio_endio(async->bio, ret);
> >    820	}
> >    821	
> >  > 822	int btrfs_wq_btree_submit_bio(struct btrfs_root *root, int rw,
> >    823				      struct bio *bio, int mirror_num)
> >    824	{
> >    825		struct btrfs_fs_info *fs_info = root->fs_info;
> > 
> > Please consider folding the attached diff :-)
> 
> Wow Fengguang you really like using the bleeding edge stuff eh? :)  I've folded
> this in, thanks.

Thanks :)  These static warnings are pretty common, and it's dumb
enough to write a script to generate the fix (of course build tested ;).

Thanks,
Fengguang
