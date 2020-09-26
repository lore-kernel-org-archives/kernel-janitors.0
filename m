From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Sat, 26 Sep 2020 22:17:20 +0000
Subject: Re: [PATCH v3] mm/hmm/test: use after free in dmirror_allocate_chunk()
Message-Id: <20200926221720.GK9916@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d1b31586-426a-e0b1-803e-3eff30196c05@web.de>
 <20200926121402.GA7467@kadam>
In-Reply-To: <20200926121402.GA7467@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, Markus Elfring <Markus.Elfring@web.de>, Dan Williams <dan.j.williams@intel.com>, Wei Yongjun <weiyongjun1@huawei.com>, Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Sep 26, 2020 at 03:14:02PM +0300, Dan Carpenter wrote:
> The error handling code does this:
> 
> err_free:
> 	kfree(devmem);
>         ^^^^^^^^^^^^^
> err_release:
> 	release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
>                            ^^^^^^^^
> The problem is that when we use "devmem->pagemap.range.start" the
> "devmem" pointer is either NULL or freed.
> 
> Neither the allocation nor the call to request_free_mem_region() has to
> be done under the lock so I moved those to the start of the function.
> 
> Fixes: 1f9c4bb986d9 ("mm/memremap_pages: convert to 'struct range'")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
> v2: The first version introduced a locking bug
> v3: Markus Elfring pointed out that the Fixes tag was wrong.  This bug
> was in the original commit and then fixed and then re-introduced.  I was
> quite bothered by how this bug lasted so long in the source code, but
> now we know.  As soon as it is introduced we fixed it.
> 
> One problem with the kernel QC process is that I think everyone marks
> the bug as "old/dealt with" so it was only because I was added a new
> check for resource leaks that it was found when it was re-introduced.
> 
>  lib/test_hmm.c | 44 ++++++++++++++++++++++----------------------
>  1 file changed, 22 insertions(+), 22 deletions(-)

Hi Andrew, 

I don't have have any hmm related patches this cycle, can you take
this into your tree?

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks,
Jason
