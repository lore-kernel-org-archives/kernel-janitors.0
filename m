From: Ralph Campbell <rcampbell@nvidia.com>
Date: Thu, 24 Sep 2020 19:25:11 +0000
Subject: Re: [PATCH v2] mm/hmm/test: use after free in dmirror_allocate_chunk()
Message-Id: <eb06e0c8-327e-6677-c393-139dffdf0dbe@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200924134651.GA1586456@mwanda>
In-Reply-To: <20200924134651.GA1586456@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On 9/24/20 6:46 AM, Dan Carpenter wrote:
> The error handling code does this:
> 
> err_free:
> 	kfree(devmem);
>          ^^^^^^^^^^^^^
> err_release:
> 	release_mem_region(devmem->pagemap.range.start, range_len(&devmem->pagemap.range));
>                             ^^^^^^^^
> The problem is that when we use "devmem->pagemap.range.start" the
> "devmem" pointer is either NULL or freed.
> 
> Neither the allocation nor the call to request_free_mem_region() has to
> be done under the lock so I moved those to the start of the function.
> 
> Fixes: b2ef9f5a5cb3 ("mm/hmm/test: add selftest driver for HMM")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good.
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
