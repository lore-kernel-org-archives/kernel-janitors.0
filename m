From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 11 May 2020 10:43:24 +0000
Subject: Re: [PATCH -next] bus: mhi: core: Fix some error return code
Message-Id: <20200511103124.GA12753@mani>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200509075654.175002-1-weiyongjun1@huawei.com>
In-Reply-To: <20200509075654.175002-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Hemant Kumar <hemantk@codeaurora.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sujeev Dias <sdias@codeaurora.org>, Siddartha Mohanadoss <smohanad@codeaurora.org>, linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On 0509, Wei Yongjun wrote:
> Fix to return negative error code from the error handling case
> instead of 0 in mhi_init_dev_ctxt() and mhi_driver_probe().
> 
> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index eb2ab058a01d..1f8c82603179 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -291,6 +291,7 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  	}
>  
>  	/* Setup cmd context */
> +	ret = -ENOMEM;
>  	mhi_ctxt->cmd_ctxt = mhi_alloc_coherent(mhi_cntrl,
>  						sizeof(*mhi_ctxt->cmd_ctxt) *
>  						NR_OF_CMD_RINGS,
> @@ -1100,6 +1101,7 @@ static int mhi_driver_probe(struct device *dev)
>  		}
>  	}
>  
> +	ret = -EINVAL;
>  	if (dl_chan) {
>  		/*
>  		 * If channel supports LPM notifications then status_cb should
> 
> 
> 
