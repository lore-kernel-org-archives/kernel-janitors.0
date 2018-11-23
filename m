From: Michal Hocko <mhocko@kernel.org>
Date: Fri, 23 Nov 2018 09:01:25 +0000
Subject: Re: [PATCH] mm: debug: Fix a width vs precision bug in printk
Message-Id: <20181123090125.GC8625@dhcp22.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181123072135.gqvblm2vdujbvfjs@kili.mountain>
In-Reply-To: <20181123072135.gqvblm2vdujbvfjs@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Pavel Tatashin <pasha.tatashin@oracle.com>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On Fri 23-11-18 10:21:35, Dan Carpenter wrote:
> We had intended to only print dentry->d_name.len characters but there is
> a width vs precision typo so if the name isn't NUL terminated it will
> read past the end of the buffer.

OK, it took me quite some time to grasp what you mean here. The code
works as expected because d_name.len and dname.name are in sync so there
no spacing going to happen. Anyway what you propose is formally more
correct I guess.
 
> Fixes: 408ddbc22be3 ("mm: print more information about mapping in __dump_page")

This sha is an unstable sha for mmotm patch.

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Michal Hocko <mhocko@suse.com>

Thanks!

> ---
>  mm/debug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/debug.c b/mm/debug.c
> index d18c5cea3320..faf856b652b6 100644
> --- a/mm/debug.c
> +++ b/mm/debug.c
> @@ -80,7 +80,7 @@ void __dump_page(struct page *page, const char *reason)
>  		if (mapping->host->i_dentry.first) {
>  			struct dentry *dentry;
>  			dentry = container_of(mapping->host->i_dentry.first, struct dentry, d_u.d_alias);
> -			pr_warn("name:\"%*s\" ", dentry->d_name.len, dentry->d_name.name);
> +			pr_warn("name:\"%.*s\" ", dentry->d_name.len, dentry->d_name.name);
>  		}
>  	}
>  	BUILD_BUG_ON(ARRAY_SIZE(pageflag_names) != __NR_PAGEFLAGS + 1);
> -- 
> 2.11.0
> 

-- 
Michal Hocko
SUSE Labs
