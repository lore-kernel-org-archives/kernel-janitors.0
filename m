From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 07 Apr 2020 10:58:51 +0000
Subject: Re: [PATCH] bus: mhi: core: Fix a NULL vs IS_ERR check in mhi_create_devices()
Message-Id: <20200407104651.GE2442@Mani-XPS-13-9360>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407093133.GM68494@mwanda>
In-Reply-To: <20200407093133.GM68494@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Hemant Kumar <hemantk@codeaurora.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Siddartha Mohanadoss <smohanad@codeaurora.org>, Sujeev Dias <sdias@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 07, 2020 at 12:31:33PM +0300, Dan Carpenter wrote:
> The mhi_alloc_device() function never returns NULL, it returns error
> pointers.
> 
> Fixes: da1c4f856924 ("bus: mhi: core: Add support for creating and destroying MHI devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks Dan!

Regards,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index eb4256b81406..55928feea0c9 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -294,7 +294,7 @@ void mhi_create_devices(struct mhi_controller *mhi_cntrl)
>  		    !(mhi_chan->ee_mask & BIT(mhi_cntrl->ee)))
>  			continue;
>  		mhi_dev = mhi_alloc_device(mhi_cntrl);
> -		if (!mhi_dev)
> +		if (IS_ERR(mhi_dev))
>  			return;
>  
>  		mhi_dev->dev_type = MHI_DEVICE_XFER;
> -- 
> 2.25.1
> 
