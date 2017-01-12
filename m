From: Michal Hocko <mhocko@kernel.org>
Date: Thu, 12 Jan 2017 19:33:27 +0000
Subject: Re: [patch linux-next] userfaultfd: hugetlbfs: unmap the correct pointer
Message-Id: <20170112193327.GB8558@dhcp22.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170112192052.GB12157@mwanda>
In-Reply-To: <20170112192052.GB12157@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Jan Kara <jack@suse.cz>, Ross Zwisler <ross.zwisler@linux.intel.com>, Lorenzo Stoakes <lstoakes@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Dan Williams <dan.j.williams@intel.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On Thu 12-01-17 22:20:52, Dan Carpenter wrote:
> kunmap_atomic() and kunmap() take different pointers.  People often get
> these mixed up.
> 
> Fixes: 16374db2e9a0 ("userfaultfd: hugetlbfs: fix __mcopy_atomic_hugetlb retry/error processing")

This looks like a linux-next sha1. This is not stable and will change...

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 6012a05..dfd3604 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4172,7 +4172,7 @@ long copy_huge_page_from_user(struct page *dst_page,
>  				(const void __user *)(src + i * PAGE_SIZE),
>  				PAGE_SIZE);
>  		if (allow_pagefault)
> -			kunmap(page_kaddr);
> +			kunmap(dst_page + 1);

I guess you meant dst_page + i

>  		else
>  			kunmap_atomic(page_kaddr);
>  

-- 
Michal Hocko
SUSE Labs
