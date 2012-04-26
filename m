From: Emil Goode <emilgoode@gmail.com>
Date: Thu, 26 Apr 2012 21:30:38 +0000
Subject: Re: [PATCH] GFS2: Return -ENOMEM only if kmalloc fails
Message-Id: <1335475838.3035.4.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1335474778-6252-1-git-send-email-emilgoode@gmail.com>
	 <201204262314.02683.oliver@neukum.org>
In-Reply-To: <201204262314.02683.oliver@neukum.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oliver Neukum <oliver@neukum.org>
Cc: swhiteho@redhat.com, cluster-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I forgot the braces, embarrassing!
I see your point, thanks.

Best regards, Emil

On Thu, 2012-04-26 at 23:14 +0200, Oliver Neukum wrote:
> Am Donnerstag, 26. April 2012, 23:12:58 schrieb Emil Goode:
> > The error variable should be assigned the value of -ENOMEM
> > after the NULL check and not before.
> > 
> > Signed-off-by: Emil Goode <emilgoode@gmail.com>
> > ---
> >  fs/gfs2/acl.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/gfs2/acl.c b/fs/gfs2/acl.c
> > index 230eb0f..90f6328 100644
> > --- a/fs/gfs2/acl.c
> > +++ b/fs/gfs2/acl.c
> > @@ -174,8 +174,8 @@ int gfs2_acl_chmod(struct gfs2_inode *ip, struct iattr *attr)
> >  
> >  	len = posix_acl_to_xattr(acl, NULL, 0);
> >  	data = kmalloc(len, GFP_NOFS);
> > -	error = -ENOMEM;
> >  	if (data = NULL)
> > +		error = -ENOMEM;
> >  		goto out;
> 
> Hint: read about the syntax of the if statement.
> Secondly, consider how the compiler can optimize the original.
> 
> 	Regards
> 		Oliver


