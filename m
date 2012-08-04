From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 04 Aug 2012 07:43:26 +0000
Subject: Re: [josef-btrfs:master 9/11] fs/btrfs/delayed-inode.c:1013:1-11: second lock on line 1013
Message-Id: <20120804074326.GA13700@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120803131659.GA20007@localhost>
In-Reply-To: <20120803131659.GA20007@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 03, 2012 at 05:11:32PM -0400, Josef Bacik wrote:
> On Fri, Aug 03, 2012 at 07:16:59AM -0600, Fengguang Wu wrote:
> > Hi Josef,
> > 
> > There are (old) coccinelle warnings in
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/josef/btrfs-next.git master
> > head:   233564d3f5bde271885f5b784b63cfe627bba0a5
> > commit: ec93ee7ac77b2e95934253823918c3c684c1a36c [9/11] Btrfs: barrier before waitqueue_active
> > 
> > All coccinelle warnings:
> > 
> > + fs/btrfs/delayed-inode.c:1013:1-11: second lock on line 1013
> > --
> > + fs/btrfs/volumes.c:2888:1-3: WARNING: PTR_RET can be used (patch attached)
> > 
> > vim +1013 fs/btrfs/delayed-inode.c
> >   1010		int ret = 0;
> >   1011	
> >   1012	do_again:
> > > 1013		mutex_lock(&node->mutex);
> >   1014		curr = __btrfs_first_delayed_deletion_item(node);
> >   1015		if (!curr)
> >   1016			goto delete_fail;
> > ...
> >   1031                 if (curr)
> > > 1032                         goto do_again;
> >   1033                 else
> >   1034                         goto delete_fail;
> > 
> 
> Ok that wasn't related to my patch so I'm not going to fold it in, do you want
> to send me a real patch with a Signed-off-by that I can apply?  Thanks,

Sure. I'll send one bug fix and another code cleanup for each of the
warnings.

Thanks,
Fengguang
