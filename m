From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Thu, 14 Nov 2019 15:54:26 +0000
Subject: Re: [PATCH] infiniband: ocrdma: fix spelling mistake in variable name
Message-Id: <20191114155426.GB29207@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191107224855.417647-1-colin.king@canonical.com>
In-Reply-To: <20191107224855.417647-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 07, 2019 at 10:48:55PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the variable nak_invalid_requst_errors,
> rename it to nak_invalid_request_errors.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/ocrdma/ocrdma_sli.h   | 2 +-
>  drivers/infiniband/hw/ocrdma/ocrdma_stats.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to for-next, thanks

Jason
