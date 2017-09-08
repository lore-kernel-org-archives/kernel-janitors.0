From: Sricharan R <sricharan@codeaurora.org>
Date: Fri, 08 Sep 2017 11:25:06 +0000
Subject: Re: [PATCH 1/2] rpmsg: glink: Unlock on error in qcom_glink_request_intent()
Message-Id: <1ee63e71-d736-254e-dddc-41497f5fcb74@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170908103345.brf5wcj5yg6zpslz@mwanda>
In-Reply-To: <20170908103345.brf5wcj5yg6zpslz@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On 9/8/2017 4:03 PM, Dan Carpenter wrote:
> If qcom_glink_tx() fails, then we need to unlock before returning the
> error code.
> 
> Fixes: 27b9c5b66b23 ("rpmsg: glink: Request for intents when unavailable")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 5a5e927ea50f..fecb1dafa8f3 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1197,7 +1197,7 @@ static int qcom_glink_request_intent(struct qcom_glink *glink,
>  
>  	ret = qcom_glink_tx(glink, &cmd, sizeof(cmd), NULL, 0, true);
>  	if (ret)
> -		return ret;
> +		goto unlock;
>  
>  	ret = wait_for_completion_timeout(&channel->intent_req_comp, 10 * HZ);
>  	if (!ret) {
> @@ -1207,6 +1207,7 @@ static int qcom_glink_request_intent(struct qcom_glink *glink,
>  		ret = channel->intent_req_result ? 0 : -ECANCELED;
>  	}
>  
> +unlock:

Thanks for the catch.

Acked-by: Sricharan R <sricharan@codeaurora.org>

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

---
This email has been checked for viruses by Avast antivirus software.
https://www.avast.com/antivirus

