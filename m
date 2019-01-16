From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Jan 2019 08:54:55 +0000
Subject: Re: [PATCH -next] binderfs: fix error return code in binderfs_fill_super()
Message-Id: <20190116085455.GD4482@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547607664-5612-1-git-send-email-weiyongjun1@huawei.com>
 <20190116062546.ufoeresnwz3wyxiu@brauner.io>
In-Reply-To: <20190116062546.ufoeresnwz3wyxiu@brauner.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Brauner <christian@brauner.io>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, devel@driverdev.osuosl.org, tkjos@android.com, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, arve@android.com, joel@joelfernandes.org, maco@android.com

On Wed, Jan 16, 2019 at 07:25:47AM +0100, Christian Brauner wrote:
> On Wed, Jan 16, 2019 at 03:01:04AM +0000, Wei Yongjun wrote:
> > Fix to return a negative error code -ENOMEM from the new_inode() and
> > d_make_root() error handling cases instead of 0, as done elsewhere in
> > this function.
> > 
> > Fixes: 3ad20fe393b3 ("binder: implement binderfs")
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

Btw, your style is why you have this bug.  I don't have strong feelings
about this either way, I'm just pointing it out.

regards,
dan carpenter
