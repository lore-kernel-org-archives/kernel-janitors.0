From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 26 May 2013 20:41:16 +0000
Subject: Re: [patch] f2fs: dereferencing an ERR_PTR
Message-Id: <20130526204116.GE23932@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130523100213.GA19107@elgon.mountain> <51A224AB.8010209@bfs.de>
In-Reply-To: <51A224AB.8010209@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

On Sun, May 26, 2013 at 05:05:15PM +0200, walter harms wrote:
> 
> 
> Am 23.05.2013 12:02, schrieb Dan Carpenter:
> > There is an error path where "dir" is an ERR_PTR.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> > index 5148d90..921aede 100644
> > --- a/fs/f2fs/recovery.c
> > +++ b/fs/f2fs/recovery.c
> > @@ -71,7 +71,8 @@ static int recover_dentry(struct page *ipage, struct inode *inode)
> >  out:
> >  	f2fs_msg(inode->i_sb, KERN_NOTICE, "recover_inode and its dentry: "
> >  			"ino = %x, name = %s, dir = %lx, err = %d",
> > -			ino_of_node(ipage), raw_inode->i_name, dir->i_ino, err);
> > +			ino_of_node(ipage), raw_inode->i_name,
> > +			IS_ERR(dir) ? 0 : dir->i_ino, err);
> >  	return err;
> >  }
> >  
> I am not an expert on  this matter so a simple question:
> dir->i_ino=0 is not valid ?

That is a valid question.  The trick is that we also print the err
code so error conditions should be pretty obvious.

regards,
dan carpenter

