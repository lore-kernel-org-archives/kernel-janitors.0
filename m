From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 12 May 2020 19:59:32 +0000
Subject: Re: [PATCH -next] mm/hmm/test: fix error return code in hmm_dmirror_init()
Message-Id: <20200512195932.GB9154@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200509030234.14747-1-weiyongjun1@huawei.com>
In-Reply-To: <20200509030234.14747-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: jglisse@redhat.com, Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Sat, May 09, 2020 at 03:02:34AM +0000, Wei Yongjun wrote:
> Fix to return negative error code -ENOMEM from the alloc_page() error
> handling case instead of 0, as done elsewhere in this function.
> 
> Fixes: 5d5e54be8a1e ("mm/hmm/test: add selftest driver for HMM")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  lib/test_hmm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Thank you, I squashed this into the original commit

Jason
