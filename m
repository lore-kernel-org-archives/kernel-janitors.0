From: Mike Kravetz <mike.kravetz@oracle.com>
Date: Mon, 14 Dec 2020 19:27:50 +0000
Subject: Re: [PATCH] hugetlb: Fix an error code in hugetlb_reserve_pages()
Message-Id: <dff4211a-687c-a3e1-fdf6-1562581e0da4@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9NGZWnZl5/Mt99R@mwanda>
In-Reply-To: <X9NGZWnZl5/Mt99R@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Mina Almasry <almasrymina@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Rientjes <rientjes@google.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On 12/11/20 2:13 AM, Dan Carpenter wrote:
> Preserve the error code from region_add() instead of returning success.
> 
> Fixes: 0db9d74ed884 ("hugetlb: disable region_add file_region coalescing")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis.  Untested.

Thanks Dan.

> 
>  mm/hugetlb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 1f3bf1710b66..ac2e48b9f1d7 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5113,6 +5113,7 @@ int hugetlb_reserve_pages(struct inode *inode,
>  
>  		if (unlikely(add < 0)) {
>  			hugetlb_acct_memory(h, -gbl_reserve);
> +			ret = add;
>  			goto out_put_pages;
>  		} else if (unlikely(chg > add)) {
>  			/*
> 


That error path is VERY unlikely to be taken, but is indeed incorrect.

When looking at this, I noticed that callers of hugetlb_reserve_pages only
check for 0 or !0.  This changed as the code evolved to add reservation
cgroup support.  The routine type can be changed to a bool and simplified
some.  I'll send that as a follow up patch not for stable.

Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
-- 
Mike Kravetz
