From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 01 Nov 2018 07:16:13 +0000
Subject: Re: [PATCH] mm/gup_benchmark: prevent integer overflow in ioctl
Message-Id: <20181101071613.7x3smxwz5wo57n2m@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181025061546.hnhkv33diogf2uis@kili.mountain>
 <CF4F3932-68A1-4D92-9E4F-6DCD3A3A0447@oracle.com>
In-Reply-To: <CF4F3932-68A1-4D92-9E4F-6DCD3A3A0447@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: William Kucharski <william.kucharski@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Keith Busch <keith.busch@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Kees Cook <keescook@chromium.org>, YueHaibing <yuehaibing@huawei.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On Thu, Nov 01, 2018 at 12:38:22AM -0600, William Kucharski wrote:
> 
> 
> > On Oct 25, 2018, at 12:15 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > 
> > The concern here is that "gup->size" is a u64 and "nr_pages" is unsigned
> > long.  On 32 bit systems we could trick the kernel into allocating fewer
> > pages than expected.
> > 
> > Fixes: 64c349f4ae78 ("mm: add infrastructure for get_user_pages_fast() benchmarking")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > mm/gup_benchmark.c | 3 +++
> > 1 file changed, 3 insertions(+)
> > 
> > diff --git a/mm/gup_benchmark.c b/mm/gup_benchmark.c
> > index debf11388a60..5b42d3d4b60a 100644
> > --- a/mm/gup_benchmark.c
> > +++ b/mm/gup_benchmark.c
> > @@ -27,6 +27,9 @@ static int __gup_benchmark_ioctl(unsigned int cmd,
> > 	int nr;
> > 	struct page **pages;
> > 
> > +	if (gup->size > ULONG_MAX)
> > +		return -EINVAL;
> > +
> > 	nr_pages = gup->size / PAGE_SIZE;
> > 	pages = kvcalloc(nr_pages, sizeof(void *), GFP_KERNEL);
> > 	if (!pages)
> 
> Given gup->size is in bytes, if your goal is to avoid an overflow of nr_pages on 32-bit
> systems, shouldn't you be checking something like:
> 
>     if ((gup_size / PAGE_SIZE) > ULONG_MAX)

My patch lets people allocate 4MB.  (U32_MAX / 4096 * sizeof(void *)).
Surely, that's enough?  I liked my check because it avoids the divide so
it's faster and it is a no-op on 64bit systems.

regards,
dan carpenter
