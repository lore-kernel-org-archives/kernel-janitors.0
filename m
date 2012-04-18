From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Wed, 18 Apr 2012 07:11:56 +0000
Subject: Re: [patch] sbp-target: checking for NULL instead of IS_ERR()
Message-Id: <1334733116.15333.0.camel@haakon2.linux-iscsi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120417062946.GB26756@elgon.mountain>
In-Reply-To: <20120417062946.GB26756@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2012-04-17 at 09:29 +0300, Dan Carpenter wrote:
> target_fabric_configfs_init() never returns NULL, it only returns
> ERR_PTRs.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/target/sbp/sbp_target.c b/drivers/target/sbp/sbp_target.c
> index 37c6098..d605971 100644
> --- a/drivers/target/sbp/sbp_target.c
> +++ b/drivers/target/sbp/sbp_target.c
> @@ -2559,9 +2559,9 @@ static int sbp_register_configfs(void)
>  	int ret;
>  
>  	fabric = target_fabric_configfs_init(THIS_MODULE, "sbp");
> -	if (!fabric) {
> +	if (IS_ERR(fabric)) {
>  		pr_err("target_fabric_configfs_init() failed\n");
> -		return -ENOMEM;
> +		return PTR_ERR(fabric);
>  	}
>  
>  	fabric->tf_ops = sbp_ops;
> --

Applied to lio-core.  Thanks DanC!

--nab

