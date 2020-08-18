From: Jason Gunthorpe <jgg@nvidia.com>
Date: Tue, 18 Aug 2020 16:33:29 +0000
Subject: Re: [PATCH] RDMA/usnic: fix spelling mistake "transistion" -> "transition"
Message-Id: <20200818163329.GB1990081@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200805141459.23069-1-colin.king@canonical.com>
In-Reply-To: <20200805141459.23069-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Christian Benvenuti <benve@cisco.com>, Nelson Escobar <neescoba@cisco.com>, Parvi Kaustubhi <pkaustub@cisco.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Aug 05, 2020 at 03:14:59PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a usnic_err error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/usnic/usnic_ib_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-rc, thanks

Jason
