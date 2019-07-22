From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Mon, 22 Jul 2019 17:43:19 +0000
Subject: Re: [PATCH] RDMA/siw: fix error return code in siw_init_module()
Message-Id: <20190722174319.GA31295@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190718092710.85709-1-weiyongjun1@huawei.com>
In-Reply-To: <20190718092710.85709-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Bernard Metzler <bmt@zurich.ibm.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jul 18, 2019 at 09:27:10AM +0000, Wei Yongjun wrote:
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: bdcf26bf9b3a ("rdma/siw: network and RDMA core interface")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>  drivers/infiniband/sw/siw/siw_main.c | 1 +
>  1 file changed, 1 insertion(+)

Applied to for-rc, thanks

Jason
