From: Mikulas Patocka <mikulas@twibright.com>
Date: Mon, 01 Jan 2018 20:23:00 +0000
Subject: Re: [PATCH 12/12] hpfs: drop unneeded newline
Message-Id: <alpine.DEB.2.02.1801012120300.14344@leontynka>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr> <1514386305-7402-13-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514386305-7402-13-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Wed, 27 Dec 2017, Julia Lawall wrote:

> hpfs_error prints a newline at the end of the message string, so the
> message string does not need to include a newline explicitly.  Done
> using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Reviewed-by: Mikulas Patocka <mikulas@twibright.com>

> ---
>  fs/hpfs/dnode.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/hpfs/dnode.c b/fs/hpfs/dnode.c
> index a4ad18a..fc1809b 100644
> --- a/fs/hpfs/dnode.c
> +++ b/fs/hpfs/dnode.c
> @@ -914,7 +914,8 @@ struct hpfs_dirent *map_dirent(struct inode *inode, dnode_secno dno,
>  	struct hpfs_dirent *de_end;
>  	int c1, c2 = 0;
>  
> -	if (!S_ISDIR(inode->i_mode)) hpfs_error(inode->i_sb, "map_dirent: not a directory\n");
> +	if (!S_ISDIR(inode->i_mode))
> +		hpfs_error(inode->i_sb, "map_dirent: not a directory");
>  	again:
>  	if (hpfs_sb(inode->i_sb)->sb_chk)
>  		if (hpfs_stop_cycles(inode->i_sb, dno, &c1, &c2, "map_dirent")) return NULL;
> 
> 
