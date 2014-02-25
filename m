From: Steven Whitehouse <swhiteho@redhat.com>
Date: Tue, 25 Feb 2014 10:07:20 +0000
Subject: Re: [patch] fs: NULL dereference in posix_acl_to_xattr()
Message-Id: <1393322840.2771.6.camel@menhir>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140214090549.GA15629@elgon.mountain>
In-Reply-To: <20140214090549.GA15629@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com, kernel-janitors@vger.kernel.org

Hi,

On Fri, 2014-02-14 at 12:05 +0300, Dan Carpenter wrote:
> This patch moves the dereference of "buffer" after the check for NULL.
> The only place which passes a NULL parameter is gfs2_set_acl().
> 
> Cc: stable <stable@vger.kernel.org>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

I've not heard anything from Al, so at least for the time being, I'm
putting this in the GFS2 tree, that way it will at least get some
exposure in -next,

Steve.

> diff --git a/fs/posix_acl.c b/fs/posix_acl.c
> index 11c54fd51e16..9e363e41dacc 100644
> --- a/fs/posix_acl.c
> +++ b/fs/posix_acl.c
> @@ -723,7 +723,7 @@ posix_acl_to_xattr(struct user_namespace *user_ns, const struct posix_acl *acl,
>  		   void *buffer, size_t size)
>  {
>  	posix_acl_xattr_header *ext_acl = (posix_acl_xattr_header *)buffer;
> -	posix_acl_xattr_entry *ext_entry = ext_acl->a_entries;
> +	posix_acl_xattr_entry *ext_entry;
>  	int real_size, n;
>  
>  	real_size = posix_acl_xattr_size(acl->a_count);
> @@ -731,7 +731,8 @@ posix_acl_to_xattr(struct user_namespace *user_ns, const struct posix_acl *acl,
>  		return real_size;
>  	if (real_size > size)
>  		return -ERANGE;
> -	
> +
> +	ext_entry = ext_acl->a_entries;
>  	ext_acl->a_version = cpu_to_le32(POSIX_ACL_XATTR_VERSION);
>  
>  	for (n=0; n < acl->a_count; n++, ext_entry++) {


