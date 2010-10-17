From: Joe Perches <joe@perches.com>
Date: Sun, 17 Oct 2010 18:54:17 +0000
Subject: Re: [PATCH 2/3] fs/ceph/xattr.c: Use kasprintf
Message-Id: <1287341657.20968.61.camel@Joe-Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287341311-11161-1-git-send-email-julia@diku.dk>
	 <1287341311-11161-3-git-send-email-julia@diku.dk>
In-Reply-To: <1287341311-11161-3-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Sage Weil <sage@newdream.net>, kernel-janitors@vger.kernel.org, ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2010-10-17 at 20:48 +0200, Julia Lawall wrote:
> Convert a sequence of kmalloc and memcpy to use kasprintf.  The argument is
> checked for being a string by the presence of a previous call to strlen.
[]
> diff --git a/fs/ceph/xattr.c b/fs/ceph/xattr.c
[]
> @@ -716,10 +716,9 @@ int ceph_setxattr(struct dentry *dentry, const char *name,
>  
>  	/* preallocate memory for xattr name, value, index node */
>  	err = -ENOMEM;
> -	newname = kmalloc(name_len + 1, GFP_NOFS);
> +	newname = kasprintf(GFP_NOFS, "%s", name);

This one is probably better converted to kmemdup
as name_len is already known and is used later
in the routine.

kstrdup is also a possibility.


