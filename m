From: Joe Perches <joe@perches.com>
Date: Sun, 06 Jun 2010 03:10:57 +0000
Subject: Re: [PATCH] drivers/staging/pohmelfs: fix compile warning
Message-Id: <1275793857.11597.105.camel@Joe-Laptop.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1275788460.10961.18.camel@lenovo>
In-Reply-To: <1275788460.10961.18.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 2010-06-05 at 21:41 -0400, Javier Martinez Canillas wrote:
> A really trivial patch to solve a warning when compiling staging/pohmelfs

> diff --git a/drivers/staging/pohmelfs/inode.c b/drivers/staging/pohmelfs/inode.c
> index 643b413..20b0c68 100644
> --- a/drivers/staging/pohmelfs/inode.c
> +++ b/drivers/staging/pohmelfs/inode.c
> @@ -1266,7 +1266,7 @@ static void pohmelfs_put_super(struct super_block *sb)
>  {
>  	struct pohmelfs_sb *psb = POHMELFS_SB(sb);
>  	struct pohmelfs_inode *pi;
> -	unsigned int count;
> +	unsigned int count = 0;
>  	unsigned int in_drop_list = 0;
>  	struct inode *inode, *tmp;
>  

No warning with gcc 4.4.3.
What gcc version are you using?
Perhaps you should upgrade.


