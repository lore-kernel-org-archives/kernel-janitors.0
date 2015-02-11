From: ebiederm@xmission.com (Eric W. Biederman)
Date: Wed, 11 Feb 2015 14:02:40 +0000
Subject: Re: [PATCH] fs: proc: inode.c: remove unnecessary type cast
Message-Id: <878ug4k0lb.fsf@x220.int.ebiederm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1423655925-15853-1-git-send-email-baspeters93@gmail.com>
In-Reply-To: <1423655925-15853-1-git-send-email-baspeters93@gmail.com> (Bas
	Peters's message of "Wed, 11 Feb 2015 12:58:45 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bas Peters <baspeters93@gmail.com>
Cc: akpm@linux-foundation.org, oleg@redhat.com, adobriyan@gmail.com, gorcunov@openvz.org, viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Bas Peters <baspeters93@gmail.com> writes:

> Issue was detected using Coccinelle.

I believe Al Viro wrote that deliberately.

> Signed-off-by: Bas Peters <baspeters93@gmail.com>
> ---
>  fs/proc/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/proc/inode.c b/fs/proc/inode.c
> index 8420a2f..e16ee87 100644
> --- a/fs/proc/inode.c
> +++ b/fs/proc/inode.c
> @@ -57,7 +57,7 @@ static struct inode *proc_alloc_inode(struct super_block *sb)
>  	struct proc_inode *ei;
>  	struct inode *inode;
>  
> -	ei = (struct proc_inode *)kmem_cache_alloc(proc_inode_cachep, GFP_KERNEL);
> +	ei = kmem_cache_alloc(proc_inode_cachep, GFP_KERNEL);
>  	if (!ei)
>  		return NULL;
>  	ei->pid = NULL;

Eric
