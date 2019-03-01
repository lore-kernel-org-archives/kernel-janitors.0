From: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Fri, 01 Mar 2019 19:07:21 +0000
Subject: Re: [PATCH] soc: qcom: cmd-db: Fix an error code in cmd_db_dev_probe()
Message-Id: <20190301190721.GA27005@builder>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190228054849.GD3253@kadam>
In-Reply-To: <20190228054849.GD3253@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andy Gross <andy.gross@linaro.org>, Mahesh Sivasubramanian <msivasub@codeaurora.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed 27 Feb 21:48 PST 2019, Dan Carpenter wrote:

> The memremap() function doesn't return error pointers, it returns NULL.
> This code is returning "ret = PTR_ERR(NULL);" which is success, but it
> should return -ENOMEM.
> 
> Fixes: 312416d9171a ("drivers: qcom: add command DB driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Thanks Dan, picking this up.

Regards,
Bjorn

>  drivers/soc/qcom/cmd-db.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
> index c701b3b010f1..f6c3d17b05c7 100644
> --- a/drivers/soc/qcom/cmd-db.c
> +++ b/drivers/soc/qcom/cmd-db.c
> @@ -248,8 +248,8 @@ static int cmd_db_dev_probe(struct platform_device *pdev)
>  	}
>  
>  	cmd_db_header = memremap(rmem->base, rmem->size, MEMREMAP_WB);
> -	if (IS_ERR_OR_NULL(cmd_db_header)) {
> -		ret = PTR_ERR(cmd_db_header);
> +	if (!cmd_db_header) {
> +		ret = -ENOMEM;
>  		cmd_db_header = NULL;
>  		return ret;
>  	}
> -- 
> 2.17.1
> 
