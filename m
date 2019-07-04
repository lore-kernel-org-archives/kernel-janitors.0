From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Thu, 04 Jul 2019 17:07:52 +0000
Subject: Re: [PATCH] RDMA/uverbs: remove redundant assignment to variable ret
Message-Id: <20190704170752.GA11760@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190704125027.4514-1-colin.king@canonical.com>
In-Reply-To: <20190704125027.4514-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 04, 2019 at 01:50:27PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never
> read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/core/uverbs_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next, thanks

Jason
