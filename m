From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 06 Mar 2018 23:34:19 +0000
Subject: Re: [PATCH] infiniband: remove redundant assignment to pointer 'rdi'
Message-Id: <20180306233419.GA8328@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180301162354.17420-1-colin.king@canonical.com>
In-Reply-To: <20180301162354.17420-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Dennis Dalessandro <dennis.dalessandro@intel.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 01, 2018 at 04:23:54PM +0000, Colin Ian King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer rdi is being initialized with a value that is never read
> and re-assigned immediately after, hence the initialization is redundant
> and can be removed.
> 
> Cleans up clang warning:
> drivers/infiniband/sw/rdmavt/vt.c:94:23: warning: Value stored to 'rdi'
> during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>  drivers/infiniband/sw/rdmavt/vt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to for-next, thanks

Jason
