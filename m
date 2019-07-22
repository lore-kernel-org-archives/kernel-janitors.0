From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Mon, 22 Jul 2019 18:36:08 +0000
Subject: Re: [PATCH -next] infiniband: siw: remove set but not used variables 'rv'
Message-Id: <20190722183608.GA23553@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190719012938.100628-1-maowenan@huawei.com>
In-Reply-To: <20190719012938.100628-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: bmt@zurich.ibm.com, dledford@redhat.com, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jul 19, 2019 at 09:29:38AM +0800, Mao Wenan wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/infiniband/sw/siw/siw_cm.c: In function siw_cep_set_inuse:
> drivers/infiniband/sw/siw/siw_cm.c:223:6: warning: variable rv set but not used [-Wunused-but-set-variable]
> 
> It is not used since commit 6c52fdc244b5("rdma/siw: connection management")
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/infiniband/sw/siw/siw_cm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to for-rc

Thanks,
Jason
