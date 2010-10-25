From: Alan Stern <stern@rowland.harvard.edu>
Date: Mon, 25 Oct 2010 01:43:47 +0000
Subject: Re: potential NULL dereference in sysfs_merge_group()
Message-Id: <Pine.LNX.4.44L0.1010242141310.25577-100000@netrider.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101024215504.GV5985@bicker>
In-Reply-To: <20101024215504.GV5985@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 24 Oct 2010, Dan Carpenter wrote:

> Hi Alan,
> 
> There is a bug in sysfs_merge_group() where it doesn't handle a NULL
> grp parameter properly.  The only caller in the kernel passes in a valid
> grp pointer so it doesn't affect anything yet.
> 
> fs/sysfs/group.c +175 sysfs_merge_group(15)
> 	error: we previously assumed 'grp' could be null.
>    168		if (grp)
>                     ^^^
> 	assumes that grp can be NULL.
> 
>    169			dir_sd = sysfs_get_dirent(kobj->sd, NULL, grp->name);
>    170		else
>    171			dir_sd = sysfs_get(kobj->sd);
>    172		if (!dir_sd)
>    173			return -ENOENT;
>    174	
>    175		for ((i = 0, attr = grp->attrs); *attr && !error; (++i, ++attr))
>                                     ^^^^^
> 	grp is dereferenced here.
> 
>    176			error = sysfs_add_file(dir_sd, *attr, SYSFS_KOBJ_ATTR);
> 
> I'm not sure how you want to handle this.

You're right, and I'm embarrassed not to have seen it before.

Since there's no point in calling this function if there are no 
attributes, we should require that grp always be non-NULL.  The initial 
test can be removed.  The same is true for sysfs_unmerge_group().

Alan Stern

