From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 12 May 2020 19:59:11 +0000
Subject: Re: [PATCH -next] mm/hmm/test: fix missing unlock on error in dmirror_migrate_finalize_and_map()
Message-Id: <20200512195911.GA9154@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200509030225.14592-1-weiyongjun1@huawei.com>
In-Reply-To: <20200509030225.14592-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: jglisse@redhat.com, Ralph Campbell <rcampbell@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Sat, May 09, 2020 at 03:02:25AM +0000, Wei Yongjun wrote:
> Add the missing unlock before return from function
> dmirror_migrate_finalize_and_map() in the error
> handling case.
> 
> Fixes: 5d5e54be8a1e ("mm/hmm/test: add selftest driver for HMM")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  lib/test_hmm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Thank you, I squashed this into the original commit

Jason
