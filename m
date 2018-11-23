From: David Hildenbrand <david@redhat.com>
Date: Fri, 23 Nov 2018 10:37:55 +0000
Subject: Re: [PATCH] mm: debug: Fix a width vs precision bug in printk
Message-Id: <831d66e9-7cf7-00a5-0a40-b7a7109dddbf@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181123072135.gqvblm2vdujbvfjs@kili.mountain>
In-Reply-To: <20181123072135.gqvblm2vdujbvfjs@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>
Cc: Pavel Tatashin <pasha.tatashin@oracle.com>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On 23.11.18 08:21, Dan Carpenter wrote:
> We had intended to only print dentry->d_name.len characters but there is
> a width vs precision typo so if the name isn't NUL terminated it will
> read past the end of the buffer.
> 
> Fixes: 408ddbc22be3 ("mm: print more information about mapping in __dump_page")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
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
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 

Thanks,

David / dhildenb
