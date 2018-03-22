From: Karthik Ramasubramanian <kramasub@codeaurora.org>
Date: Thu, 22 Mar 2018 21:57:24 +0000
Subject: Re: [PATCH -next] tty: serial: msm_geni_serial: Fix return value check in qcom_geni_serial_probe()
Message-Id: <4516531e-2f93-48a4-33c2-c9bab446b16f@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1521685507-92087-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1521685507-92087-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On 3/21/2018 8:25 PM, Wei Yongjun wrote:
> In case of error, the function platform_get_resource() returns NULL
> pointer not ERR_PTR(). The IS_ERR() test in the return value check
> should be replaced with NULL test.
> 
> Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 1442777..65ff669 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1053,8 +1053,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>  	}
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (IS_ERR(res))
> -		return PTR_ERR(res);
> +	if (!res)
> +		return -EINVAL;
>  	uport->mapbase = res->start;
>  
>  	port->tx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
> 
Reviewed-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>

Thanks and Regards,
Karthik.
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
