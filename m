From: David Hildenbrand <david@redhat.com>
Date: Mon, 14 Dec 2020 09:37:12 +0000
Subject: Re: [PATCH] hugetlb: Fix an error code in hugetlb_reserve_pages()
Message-Id: <2a7ac28f-3623-a1ad-951f-58cf143a75b8@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9NGZWnZl5/Mt99R@mwanda>
In-Reply-To: <X9NGZWnZl5/Mt99R@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>, Mina Almasry <almasrymina@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Rientjes <rientjes@google.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On 11.12.20 11:13, Dan Carpenter wrote:
> Preserve the error code from region_add() instead of returning success.
> 
> Fixes: 0db9d74ed884 ("hugetlb: disable region_add file_region coalescing")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis.  Untested.
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

Was wioing if something like

return ret ? ret : add;

would be cleaner, but then I spotted "chg" ...

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb
