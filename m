From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Thu, 11 Jul 2019 14:45:33 +0000
Subject: Re: [PATCH -next] infiniband: remove set but not used variables 'rv'
Message-Id: <20190711144533.GB25807@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jul 11, 2019 at 09:59:30PM +0800, Mao Wenan wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/infiniband/sw/siw/siw_main.c: In function siw_create_tx_threads:
> drivers/infiniband/sw/siw/siw_main.c:91:11: warning: variable rv set but not used [-Wunused-but-set-variable]
> 
> It is never used since introduction in bdcf26bf9b3a ("rdma/siw: network and RDMA core interface")
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
>  drivers/infiniband/sw/siw/siw_main.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

This was already fixed, thanks

Jason
