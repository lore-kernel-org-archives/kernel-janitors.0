From: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
Date: Tue, 23 Nov 2010 07:22:21 +0000
Subject: Re: [patch] nilfs2: nilfs_iget_for_gc() returns ERR_PTR
Message-Id: <20101123.162221.51131187.ryusuke@osrg.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101123062602.GG1522@bicker>
In-Reply-To: <20101123062602.GG1522@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 23 Nov 2010 09:26:02 +0300, Dan Carpenter wrote:
> nilfs_iget_for_gc() returns an ERR_PTR() on failure and doesn't return
> NULL.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/fs/nilfs2/ioctl.c b/fs/nilfs2/ioctl.c
> index 3e90f86..5bf426f 100644
> --- a/fs/nilfs2/ioctl.c
> +++ b/fs/nilfs2/ioctl.c
> @@ -349,8 +349,8 @@ static int nilfs_ioctl_move_blocks(struct super_block *sb,
>  		ino = vdesc->vd_ino;
>  		cno = vdesc->vd_cno;
>  		inode = nilfs_iget_for_gc(sb, ino, cno);
> -		if (unlikely(inode = NULL)) {
> -			ret = -ENOMEM;
> +		if (unlikely(IS_ERR(inode))) {
> +			ret = PTR_ERR(inode);
>  			goto failed;
>  		}
>  		do {

Good catch!

This looks an -rc1 regression brought about by replacement of the gc
iget function.

I will send this fix upstream.  Thank you.

Ryusuke Konishi
