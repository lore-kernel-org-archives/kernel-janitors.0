From: Martin Brandenburg <martin@omnibond.com>
Date: Mon, 22 May 2017 20:53:24 +0000
Subject: Re: [PATCH] orangefs: off by ones in xattr size checks
Message-Id: <CA+D=wkh+pshjp=1Y+PiEouPuOJ=HxuiMXSf1eNerLTk0UGRcLQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170522120831.GA27513@elgon.mountain>
In-Reply-To: <20170522120831.GA27513@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mike Marshall <hubcap@omnibond.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 5/22/17, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> A previous patch which claimed to remove off by ones actually introduced
> them.
>
> strlen() returns the length of the string not including the NUL
> character.  We are using strcpy() to copy "name" into a buffer which is
> ORANGEFS_MAX_XATTR_NAMELEN characters long.  We should make sure to
> leave space for the NUL, otherwise we're writing one character beyond
> the end of the buffer.
>
> Fixes: e675c5ec51fe ("orangefs: clean up oversize xattr validation")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Crap.  This is right.  The OrangeFS userspace tools and the kernel both
pass the zero byte.  The server itself and our database is perfectly
capable of handling any byte array.  The value can be passed unchanged
though (and you have left that).  We still pass xfstests generic/020
with this applied.

Reviewed-by: Martin Brandenburg <martin@omnibond.com>

>
> diff --git a/fs/orangefs/xattr.c b/fs/orangefs/xattr.c
> index 237c9c04dc3b..a34b25be39c5 100644
> --- a/fs/orangefs/xattr.c
> +++ b/fs/orangefs/xattr.c
> @@ -76,7 +76,7 @@ ssize_t orangefs_inode_getxattr(struct inode *inode, const
> char *name,
>  	if (S_ISLNK(inode->i_mode))
>  		return -EOPNOTSUPP;
>
> -	if (strlen(name) > ORANGEFS_MAX_XATTR_NAMELEN)
> +	if (strlen(name) >= ORANGEFS_MAX_XATTR_NAMELEN)
>  		return -EINVAL;
>
>  	fsuid = from_kuid(&init_user_ns, current_fsuid());
> @@ -169,7 +169,7 @@ static int orangefs_inode_removexattr(struct inode
> *inode, const char *name,
>  	struct orangefs_kernel_op_s *new_op = NULL;
>  	int ret = -ENOMEM;
>
> -	if (strlen(name) > ORANGEFS_MAX_XATTR_NAMELEN)
> +	if (strlen(name) >= ORANGEFS_MAX_XATTR_NAMELEN)
>  		return -EINVAL;
>
>  	down_write(&orangefs_inode->xattr_sem);
> @@ -233,7 +233,7 @@ int orangefs_inode_setxattr(struct inode *inode, const
> char *name,
>
>  	if (size > ORANGEFS_MAX_XATTR_VALUELEN)
>  		return -EINVAL;
> -	if (strlen(name) > ORANGEFS_MAX_XATTR_NAMELEN)
> +	if (strlen(name) >= ORANGEFS_MAX_XATTR_NAMELEN)
>  		return -EINVAL;
>
>  	internal_flag = convert_to_internal_xattr_flags(flags);
>
