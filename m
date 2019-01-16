From: Christian Brauner <christian@brauner.io>
Date: Wed, 16 Jan 2019 06:28:26 +0000
Subject: Re: [PATCH -next] binderfs: fix error return code in binderfs_fill_super()
Message-Id: <20190116062825.thzsb5edkihepgm4@brauner.io>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547607664-5612-1-git-send-email-weiyongjun1@huawei.com>
 <20190116062546.ufoeresnwz3wyxiu@brauner.io>
In-Reply-To: <20190116062546.ufoeresnwz3wyxiu@brauner.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, maco@android.com, joel@joelfernandes.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 16, 2019 at 07:25:46AM +0100, Christian Brauner wrote:
> On Wed, Jan 16, 2019 at 03:01:04AM +0000, Wei Yongjun wrote:
> > Fix to return a negative error code -ENOMEM from the new_inode() and
> > d_make_root() error handling cases instead of 0, as done elsewhere in
> > this function.
> > 
> > Fixes: 3ad20fe393b3 ("binder: implement binderfs")

This Fixes tag is technically wrong since this codepath was introduced
by a commit that is still sitting in Greg's char-misc-linus branch. Not
sure how to handle that though. Might just leave it.

> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> >  drivers/android/binderfs.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
> > index 9518e2e..2bf4b2b 100644
> > --- a/drivers/android/binderfs.c
> > +++ b/drivers/android/binderfs.c
> > @@ -519,8 +519,10 @@ static int binderfs_fill_super(struct super_block *sb, void *data, int silent)
> >  	sb->s_fs_info = info;
> >  
> >  	inode = new_inode(sb);
> > -	if (!inode)
> > +	if (!inode) {
> > +		ret = -ENOMEM;
> 
> Hey, thanks for the patch. Just a nit:
> can you please just do?
> 
> 	ret = -ENOMEM;
>         inode = new_inode(sb);
> 
> This is more consistent with how we do it everywhere else and let's us
> avoid shoving ret = -ENOMEM into two places.
> 
> Thanks!
> Christian
> 
> >  		goto err_without_dentry;
> > +	}
> >  
> >  	inode->i_ino = FIRST_INODE;
> >  	inode->i_fop = &simple_dir_operations;
> > @@ -530,8 +532,10 @@ static int binderfs_fill_super(struct super_block *sb, void *data, int silent)
> >  	set_nlink(inode, 2);
> >  
> >  	sb->s_root = d_make_root(inode);
> > -	if (!sb->s_root)
> > +	if (!sb->s_root) {
> > +		ret = -ENOMEM;
> >  		goto err_without_dentry;
> > +	}
> >  
> >  	ret = binderfs_binder_ctl_create(sb);
> >  	if (ret)
> > 
> > 
> > 
