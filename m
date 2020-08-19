From: Jason Gunthorpe <jgg@nvidia.com>
Date: Wed, 19 Aug 2020 11:46:12 +0000
Subject: Re: [PATCH] RDMA/core: fix spelling mistake "Could't" -> "Couldn't"
Message-Id: <20200819114612.GA2127968@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200810075824.46770-1-colin.king@canonical.com>
In-Reply-To: <20200810075824.46770-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Aug 10, 2020 at 08:58:24AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a pr_warn message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/core/device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next, thanks

Jason
