From: Anders Larsen <al@alarsen.net>
Date: Tue, 03 Sep 2019 17:27:22 +0000
Subject: Re: [PATCH] fs/qnx: Delete unnecessary checks before brelse()
Message-Id: <21774224.cEpxz9ejUk@alarsen.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <056c8b8e-abaa-8856-4953-118d14048ddc@web.de>
In-Reply-To: <056c8b8e-abaa-8856-4953-118d14048ddc@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Deepa Dinamani <deepa.kernel@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeff Layton <jlayton@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>

On Tuesday, 2019-09-03 19:20 Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 3 Sep 2019 19:15:09 +0200
> 
> The brelse() function tests whether its argument is NULL
> and then returns immediately.
> Thus the tests around the shown calls are not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/qnx4/inode.c | 3 +--
>  fs/qnx6/inode.c | 6 ++----
>  2 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/qnx4/inode.c b/fs/qnx4/inode.c
> index e8da1cde87b9..018a4c657f7c 100644
> --- a/fs/qnx4/inode.c
> +++ b/fs/qnx4/inode.c
> @@ -118,8 +118,7 @@ unsigned long qnx4_block_map( struct inode *inode, long iblock )
>  				bh = NULL;
>  			}
>  		}
> -		if ( bh )
> -			brelse( bh );
> +		brelse(bh);
>  	}
> 
>  	QNX4DEBUG((KERN_INFO "qnx4: mapping block %ld of inode %ld = %ld\n",iblock,inode->i_ino,block));
> diff --git a/fs/qnx6/inode.c b/fs/qnx6/inode.c
> index 345db56c98fd..083170541add 100644
> --- a/fs/qnx6/inode.c
> +++ b/fs/qnx6/inode.c
> @@ -472,10 +472,8 @@ static int qnx6_fill_super(struct super_block *s, void *data, int silent)
>  out1:
>  	iput(sbi->inodes);
>  out:
> -	if (bh1)
> -		brelse(bh1);
> -	if (bh2)
> -		brelse(bh2);
> +	brelse(bh1);
> +	brelse(bh2);
>  outnobh:
>  	kfree(qs);
>  	s->s_fs_info = NULL;

Acked-by: Anders Larsen <al@alarsen.net>
