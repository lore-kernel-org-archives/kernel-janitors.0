From: "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Date: Tue, 29 Oct 2019 17:59:34 +0000
Subject: Re: [PATCH -next] soc: ti: omap-prm: fix return value check in omap_prm_probe()
Message-Id: <ede6eb9f-0f7c-2f26-7b3d-cd1fb158baa3@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191011052436.76075-1-weiyongjun1@huawei.com>
In-Reply-To: <20191011052436.76075-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo <t-kristo@ti.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org



On 10/10/19 10:24 PM, Wei Yongjun wrote:
> In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
> 
> Fixes: 3e99cb214f03 ("soc: ti: add initial PRM driver with reset control support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
Applied
