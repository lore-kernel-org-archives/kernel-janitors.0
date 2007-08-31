From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 31 Aug 2007 16:49:41 +0000
Subject: Re: [patch 3/3] fs/cramfs/inode.c: remove error variable
Message-Id: <20070831164941.GE29874@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200708301737.49018.lists-receive@programmierforen.de>
In-Reply-To: <200708301737.49018.lists-receive@programmierforen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 31.08.2007 [18:23:40 +0200], Richard Knutsson wrote:
> Nishanth Aravamudan wrote:
> >On 31.08.2007 [13:43:18 +0200], Richard Knutsson wrote:
> >  
> >>Andi Drebes wrote:
> >>    
> >>>This patch removes a variable from fs/cramfs/inode.c that is just used 
> >>>to store
> >>>a return value which is immediately read afterwards.
> >>>
> >>>Tested on an i386 box.
> >>>Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>
> >>>---
> >>>diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> >>>index 350680f..42d2cf8 100644
> >>>--- a/fs/cramfs/inode.c
> >>>+++ b/fs/cramfs/inode.c
> >>>@@ -372,7 +372,7 @@ static int cramfs_readdir(struct file *filp, void 
> >>>*dirent, filldir_t filldir)
> >>>		char *name;
> >>>		ino_t ino;
> >>>		mode_t mode;
> >>>-		int namelen, error;
> >>>+		int namelen;
> >>>
> >>>		mutex_lock(&read_mutex);
> >>>		de = cramfs_read(sb, OFFSET(inode) + offset, 
> >>>		sizeof(*de)+CRAMFS_MAXPATHLEN);
> >>>@@ -398,8 +398,7 @@ static int cramfs_readdir(struct file *filp, void 
> >>>*dirent, filldir_t filldir)
> >>>				break;
> >>>			namelen--;
> >>>		}
> >>>-		error = filldir(dirent, buf, namelen, offset, ino, mode >> 
> >>>12);
> >>>-		if (error)
> >>>+		if(filldir(dirent, buf, namelen, offset, ino, mode >> 12))
> >>> 
> >>>      
> >>Maybe picky but please leave it as "if (".
> >>    
> >
> >Beyond that, I just don't like this change. I thought the preferred way
> >for these types of statements was the previous version. That is:
> >
> >error = filldir(...);
> >if (error)
> >	error stuff
> >
> >Rather than a conditional with potential side-effects?
> >  
> Which side-effects are you thinking of? We quite often have:
> if (!if_this_fails_it_all_fails())
>    return -FAILED;
> 
> but we also have:
> if ((p = malloc(...)) = NULL)
>    ...
> 
> and that is a different story (IMHO).
> 
> But I don't mind either way...
> (the compiler will get rid of it anyway, right?)

There may not be side-effects here, you're right. And maybe I'm wrong.
But I also think code generally can be easier to read in the original
formatting. I would be curious to see the effect on the end-compiled
code, actually -- it does seem like the compiler should have some smarts
here.

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
