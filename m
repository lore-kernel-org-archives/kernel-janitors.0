From: "Darrick J. Wong" <darrick.wong@oracle.com>
Date: Wed, 06 Nov 2019 15:56:31 +0000
Subject: Re: [PATCH][next] xfs: remove redundant assignment to variable error
Message-Id: <20191106155631.GJ4153244@magnolia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191106155248.266489-1-colin.king@canonical.com>
In-Reply-To: <20191106155248.266489-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-xfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Nov 06, 2019 at 03:52:48PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable error is being initialized with a value that is never read
> and is being re-assigned a couple of statements later on. The
> assignment is redundant and hence can be removed.
> 
> Addresses-Coverity: ("Unused value")

Er... is there a coverity id that goes with this?

Patch looks fine otherwise.

--D

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/xfs/xfs_super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index b3188ea49413..2302f67d1a18 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -1362,7 +1362,7 @@ xfs_fc_fill_super(
>  {
>  	struct xfs_mount	*mp = sb->s_fs_info;
>  	struct inode		*root;
> -	int			flags = 0, error = -ENOMEM;
> +	int			flags = 0, error;
>  
>  	mp->m_super = sb;
>  
> -- 
> 2.20.1
> 
