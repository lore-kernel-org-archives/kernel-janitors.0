From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 26 Mar 2019 15:10:26 +0000
Subject: Re: [PATCH][next] RDMA/nes: remove redundant check on udata
Message-Id: <20190326151026.GA9743@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190302230637.8624-1-colin.king@canonical.com>
In-Reply-To: <20190302230637.8624-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Faisal Latif <faisal.latif@intel.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Mar 02, 2019 at 11:06:36PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The non-null check on udata is redundant as this check was performed
> just a few statements earlier and the check is always true as udata
> must be non-null at this point. Remove redundant the check on udata
> and the redundant else part that can never be executed.
> 
> Detected by CoverityScan, CID#1477317 ("Logically dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/nes/nes_verbs.c | 73 +++++++++++++--------------
>  1 file changed, 34 insertions(+), 39 deletions(-)

Applied to for-next

Thanks,
Jason
