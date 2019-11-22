From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Fri, 22 Nov 2019 20:26:58 +0000
Subject: Re: [PATCH] IB/hfi1: remove redundant assignment to variable ret
Message-Id: <20191122202658.GA9162@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191122154814.87257-1-colin.king@canonical.com>
In-Reply-To: <20191122154814.87257-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>, Dennis Dalessandro <dennis.dalessandro@intel.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 22, 2019 at 03:48:14PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never
> read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Dennis Dalessandro <dennis.dalessandro@intel.com>
> ---
>  drivers/infiniband/hw/hfi1/platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next, thanks

Jason
