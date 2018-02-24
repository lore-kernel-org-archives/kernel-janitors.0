From: jiangyiwen <jiangyiwen@huawei.com>
Date: Sat, 24 Feb 2018 02:47:27 +0000
Subject: Re: [V9fs-developer] [PATCH] fs/9p: don't set SB_NOATIME by default
Message-Id: <5A90D23F.5070601@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5A7D3C08.7020309@huawei.com>
In-Reply-To: <5A7D3C08.7020309@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: v9fs-developer@lists.sourceforge.net, viro@zeniv.linux.org.uk
Cc: ericvh@gmail.com, rminnich@sandia.gov, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Latchesar Ionkov <lucho@ionkov.net>, Greg Kurz <groug@kaod.org>

On 2018/2/9 14:13, jiangyiwen wrote:
> User use some syscall, for example mmap(v9fs_file_mmap), it will not
> update atime even if user's mnt_flags have MNT_NOATIME, because
> v9fs default set SB_NOATIME in v9fs_set_super.
> 
> For supporting access time is updated when user mount with relatime,
> we should clear SB_NOATIME by default.
> 
> Signed-off-by: Yiwen Jiang <jiangyiwen@huawei.com>
> ---
>  fs/9p/vfs_super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/9p/vfs_super.c b/fs/9p/vfs_super.c
> index af03c2a..48ce504 100644
> --- a/fs/9p/vfs_super.c
> +++ b/fs/9p/vfs_super.c
> @@ -94,7 +94,7 @@ static int v9fs_set_super(struct super_block *s, void *data)
>  	if (v9ses->cache)
>  		sb->s_bdi->ra_pages = (VM_MAX_READAHEAD * 1024)/PAGE_SIZE;
> 
> -	sb->s_flags |= SB_ACTIVE | SB_DIRSYNC | SB_NOATIME;
> +	sb->s_flags |= SB_ACTIVE | SB_DIRSYNC;
>  	if (!v9ses->cache)
>  		sb->s_flags |= SB_SYNCHRONOUS;
> 
Hi Alexander Viro and Eric,

My patch has already sent two weeks, but nobody help me
to review, I have a question about now who is the v9fs's
maintainer? Or who can help me review the patch?

I hope v9fs's maintainer can give me some advices or
merge into the mainline if it has no problem.

Thanks,
Yiwen.

