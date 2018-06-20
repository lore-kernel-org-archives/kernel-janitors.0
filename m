From: Mike Kravetz <mike.kravetz@oracle.com>
Date: Wed, 20 Jun 2018 15:25:04 +0000
Subject: Re: [PATCH] hugetlbfs: Fix an error code in init_hugetlbfs_fs()
Message-Id: <869220cd-d3f0-2be9-b333-46bbfea9af48@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180620110921.2s4krw4zjbnfniq5@kili.mountain>
In-Reply-To: <20180620110921.2s4krw4zjbnfniq5@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, David Howells <dhowells@redhat.com>
Cc: linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On 06/20/2018 04:09 AM, Dan Carpenter wrote:
> We accidentally deleted the error code assignment.
> 
> Fixes: 9b82d88c136c ("hugetlbfs: Convert to fs_context")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for catching this,
Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>

-- 
Mike Kravetz

> 
> diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
> index 9a5c9fcf54f5..91fadca3c8e6 100644
> --- a/fs/hugetlbfs/inode.c
> +++ b/fs/hugetlbfs/inode.c
> @@ -1482,8 +1482,10 @@ static int __init init_hugetlbfs_fs(void)
>  	i = 0;
>  	for_each_hstate(h) {
>  		mnt = mount_one_hugetlbfs(h);
> -		if (IS_ERR(mnt) && i = 0)
> +		if (IS_ERR(mnt) && i = 0) {
> +			error = PTR_ERR(mnt);
>  			goto out;
> +		}
>  		hugetlbfs_vfsmount[i] = mnt;
>  		i++;
>  	}
> 
