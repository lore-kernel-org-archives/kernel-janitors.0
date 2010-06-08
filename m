From: Evgeniy Polyakov <zbr@ioremap.net>
Date: Tue, 08 Jun 2010 12:40:31 +0000
Subject: Re: [PATCH] drivers/staging/pohmelfs: fix compile warning
Message-Id: <20100608124031.GA31804@ioremap.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1275788460.10961.18.camel@lenovo>
In-Reply-To: <1275788460.10961.18.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Javier.

Patch looks good, thank you.

On Sat, Jun 05, 2010 at 09:41:00PM -0400, Javier Martinez Canillas (martinez.javier@gmail.com) wrote:
> A really trivial patch to solve a warning when compiling staging/pohmelfs
> 
> Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>

Greg, please apply.

> ---
>  drivers/staging/pohmelfs/inode.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
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
> -- 
> 1.7.0.4
> 
> 

-- 
	Evgeniy Polyakov
