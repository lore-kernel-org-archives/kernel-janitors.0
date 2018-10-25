From: "Kirill A. Shutemov" <kirill@shutemov.name>
Date: Thu, 25 Oct 2018 07:32:29 +0000
Subject: Re: [PATCH] mm/gup_benchmark: prevent integer overflow in ioctl
Message-Id: <20181025073229.dbsloufbem4p4arz@kshutemo-mobl1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181025061546.hnhkv33diogf2uis@kili.mountain>
In-Reply-To: <20181025061546.hnhkv33diogf2uis@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Keith Busch <keith.busch@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Kees Cook <keescook@chromium.org>, YueHaibing <yuehaibing@huawei.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On Thu, Oct 25, 2018 at 09:15:46AM +0300, Dan Carpenter wrote:
> The concern here is that "gup->size" is a u64 and "nr_pages" is unsigned
> long.  On 32 bit systems we could trick the kernel into allocating fewer
> pages than expected.
> 
> Fixes: 64c349f4ae78 ("mm: add infrastructure for get_user_pages_fast() benchmarking")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  mm/gup_benchmark.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/mm/gup_benchmark.c b/mm/gup_benchmark.c
> index debf11388a60..5b42d3d4b60a 100644
> --- a/mm/gup_benchmark.c
> +++ b/mm/gup_benchmark.c
> @@ -27,6 +27,9 @@ static int __gup_benchmark_ioctl(unsigned int cmd,
>  	int nr;
>  	struct page **pages;
>  
> +	if (gup->size > ULONG_MAX)
> +		return -EINVAL;
> +

Strictly speaking gup->size / PAGE_SIZE has to be <= ULONG_MAX, but it
should be fine this way too.

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov
