From: Sabin Rapan <sabin.rapan@gmail.com>
Date: Mon, 24 Sep 2018 06:10:26 +0000
Subject: Re: [PATCH] vfs: namespace: error pointer dereference in do_remount()
Message-Id: <1c94b8cc-44df-d837-f07b-2d7186117a21@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180907122534.ojogke2alt3ldbom@kili.mountain>
In-Reply-To: <20180907122534.ojogke2alt3ldbom@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alexander Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org


This patch also fixes the syzbot bug (BUG: unable to handle kernel paging
request in do_mount)
(https://syzkaller.appspot.com/bug?ida1b50e30eb1634e75688903289148fe2a042c1d)

Short description of the syzbot reproducer:
* do_mount() is called with remount flag
* vfs_new_fs_context() is called and tries to allocate a new context
* slab allocation fails due to injected fault
* an invalid context is passed to parse_monolithic_mount_data()
* kernel crash due to invalid pointer access

On 07.09.2018 15:25, Dan Carpenter wrote:
> We need to check if vfs_new_fs_context() returns an error pointer.
> 
> Fixes: fd0002870b45 ("vfs: Implement a filesystem superblock creation/configuration context")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/fs/namespace.c b/fs/namespace.c
> index a240e20093e0..841517520c08 100644
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
> @@ -2384,6 +2384,8 @@ static int do_remount(struct path *path, int ms_flags, int sb_flags,
>  	fc = vfs_new_fs_context(path->dentry->d_sb->s_type,
>  				path->dentry, sb_flags, MS_RMT_MASK,
>  				FS_CONTEXT_FOR_RECONFIGURE);
> +	if (IS_ERR(fc))
> +		return PTR_ERR(fc);
>  
>  	err = parse_monolithic_mount_data(fc, data, data_size);
>  	if (err < 0)
> 
