From: Evgeniy Dushistov <dushistov@mail.ru>
Date: Tue, 22 Mar 2016 13:41:09 +0000
Subject: Re: [patch] ufs: silence uninitialized warnings
Message-Id: <20160322134109.GA6918@whiterain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160322114001.GB4519@mwanda>
In-Reply-To: <20160322114001.GB4519@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 22, 2016 at 02:40:02PM +0300, Dan Carpenter wrote:
> Static checkers complain that we can use "tmp" without initializing it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/fs/ufs/util.h b/fs/ufs/util.h
> index 9541759..8aa8812 100644
> --- a/fs/ufs/util.h
> +++ b/fs/ufs/util.h
> @@ -88,7 +88,7 @@ ufs_get_fs_npsect(struct super_block *sb, struct ufs_super_block_first *usb1,
>  static inline u64
>  ufs_get_fs_qbmask(struct super_block *sb, struct ufs_super_block_third *usb3)
>  {
> -	__fs64 tmp;
> +	__fs64 tmp = 0;
>  
>  	switch (UFS_SB(sb)->s_flags & UFS_ST_MASK) {
>  	case UFS_ST_SUNOS:
> @@ -112,7 +112,7 @@ ufs_get_fs_qbmask(struct super_block *sb, struct ufs_super_block_third *usb3)
>  static inline u64
>  ufs_get_fs_qfmask(struct super_block *sb, struct ufs_super_block_third *usb3)
>  {
> -	__fs64 tmp;
> +	__fs64 tmp = 0;
>  
>  	switch (UFS_SB(sb)->s_flags & UFS_ST_MASK) {
>  	case UFS_ST_SUNOS:

In fact result of this function is saved, but not used.
May be better from cleanup point of view will be remove these two
functions and structure fields where their result was saved.

-- 
/Evgeniy
