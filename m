From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 01 Dec 2020 13:47:25 +0000
Subject: Re: [PATCH] bus: mhi: core: Fix error handling in mhi_register_controller()
Message-Id: <20201201133525.GB9748@work>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8XqbtkPpEKSfFi2@mwanda>
In-Reply-To: <X8XqbtkPpEKSfFi2@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Bhaumik Bhatt <bbhatt@codeaurora.org>, Hemant Kumar <hemantk@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Siddartha Mohanadoss <smohanad@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Dec 01, 2020 at 10:02:54AM +0300, Dan Carpenter wrote:
> There are a few problems with the error handling in this function.  They
> mostly center around the alloc_ordered_workqueue() allocation.
> 1) If that allocation fails or if the kcalloc() prior to it fails then
> it leads to a NULL dereference when we call
> destroy_workqueue(mhi_cntrl->hiprio_wq).
> 2) The error code is not set.
> 3) The "mhi_cntrl->mhi_cmd" allocation is not freed.
> 
> The error handling was slightly confusing and I re-ordered it to be in
> the exact mirror/reverse order of how things were allocated.  I changed
> the label names to say what the goto does instead of describing where
> the goto comes from.
> 
> Fixes: 8f7039787687 ("bus: mhi: core: Move to using high priority workqueue")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good find... Thanks for the patch, Dan!

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 96cde9c0034c..f0697f433c2f 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -871,7 +871,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  				     sizeof(*mhi_cntrl->mhi_cmd), GFP_KERNEL);
>  	if (!mhi_cntrl->mhi_cmd) {
>  		ret = -ENOMEM;
> -		goto error_alloc_cmd;
> +		goto err_free_event;
>  	}
>  
>  	INIT_LIST_HEAD(&mhi_cntrl->transition_list);
> @@ -886,7 +886,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  				("mhi_hiprio_wq", WQ_MEM_RECLAIM | WQ_HIGHPRI);
>  	if (!mhi_cntrl->hiprio_wq) {
>  		dev_err(mhi_cntrl->cntrl_dev, "Failed to allocate workqueue\n");
> -		goto error_alloc_cmd;
> +		ret = -ENOMEM;
> +		goto err_free_cmd;
>  	}
>  
>  	mhi_cmd = mhi_cntrl->mhi_cmd;
> @@ -932,7 +933,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs,
>  			   SOC_HW_VERSION_OFFS, &soc_info);
>  	if (ret)
> -		goto error_alloc_dev;
> +		goto err_destroy_wq;
>  
>  	mhi_cntrl->family_number = (soc_info & SOC_HW_VERSION_FAM_NUM_BMSK) >>
>  					SOC_HW_VERSION_FAM_NUM_SHFT;
> @@ -946,7 +947,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	mhi_cntrl->index = ida_alloc(&mhi_controller_ida, GFP_KERNEL);
>  	if (mhi_cntrl->index < 0) {
>  		ret = mhi_cntrl->index;
> -		goto error_ida_alloc;
> +		goto err_destroy_wq;
>  	}
>  
>  	/* Register controller with MHI bus */
> @@ -954,7 +955,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	if (IS_ERR(mhi_dev)) {
>  		dev_err(mhi_cntrl->cntrl_dev, "Failed to allocate MHI device\n");
>  		ret = PTR_ERR(mhi_dev);
> -		goto error_alloc_dev;
> +		goto err_ida_free;
>  	}
>  
>  	mhi_dev->dev_type = MHI_DEVICE_CONTROLLER;
> @@ -967,7 +968,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  
>  	ret = device_add(&mhi_dev->dev);
>  	if (ret)
> -		goto error_add_dev;
> +		goto err_release_dev;
>  
>  	mhi_cntrl->mhi_dev = mhi_dev;
>  
> @@ -975,19 +976,17 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  
>  	return 0;
>  
> -error_add_dev:
> +err_release_dev:
>  	put_device(&mhi_dev->dev);
> -
> -error_alloc_dev:
> +err_ida_free:
>  	ida_free(&mhi_controller_ida, mhi_cntrl->index);
> -
> -error_ida_alloc:
> +err_destroy_wq:
> +	destroy_workqueue(mhi_cntrl->hiprio_wq);
> +err_free_cmd:
>  	kfree(mhi_cntrl->mhi_cmd);
> -
> -error_alloc_cmd:
> -	vfree(mhi_cntrl->mhi_chan);
> +err_free_event:
>  	kfree(mhi_cntrl->mhi_event);
> -	destroy_workqueue(mhi_cntrl->hiprio_wq);
> +	vfree(mhi_cntrl->mhi_chan);
>  
>  	return ret;
>  }
> -- 
> 2.29.2
> 
