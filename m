From: Jason Gunthorpe <jgg@mellanox.com>
Date: Tue, 25 Jun 2019 13:22:36 +0000
Subject: Re: [PATCH] RDMA/hns: Fix an error code in hns_roce_set_user_sq_size()
Message-Id: <20190625132232.GA14438@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181217070815.GF12159@kadam>
In-Reply-To: <20181217070815.GF12159@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jun 08, 2019 at 12:27:14PM +0300, Dan Carpenter wrote:
> This function is supposed to return negative kernel error codes but here
> it returns CMD_RST_PRC_EBUSY (2).  The error code eventually gets passed
> to IS_ERR() and since it's not an error pointer it leads to an Oops in
> hns_roce_v1_rsv_lp_qp()
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static analysis.  Not tested.

Applied to for-next, thanks

Jason
