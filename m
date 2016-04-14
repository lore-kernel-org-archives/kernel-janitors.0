From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 14 Apr 2016 01:53:03 +0000
Subject: Re: [patch] ARM: qcom: silence an uninitialized variable warning
Message-Id: <201604140353.03595.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160413064511.GG8092@mwanda>
In-Reply-To: <20160413064511.GG8092@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tim Bird <tim.bird@sonymobile.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wednesday 13 April 2016, Dan Carpenter wrote:
> It's harmless but, if "enable" isn't set, then we pass uninitialized
> values to qcom_coincell_chgr_config().  The values aren't used, but
> let's silence the warning anyway.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I haven't seen this warning in my tests, which means it probably doesn't show up
in the usual configurations. Are you sure this doesn't just happen with
CONFIG_PROFILE_ALL_BRANCHES, CONFIG_CC_OPTIMIZE_FOR_SIZE or CONFIG_GCOV_PROFILE_ALL,
or with versions of gcc before 4.9?

	Arnd

> diff --git a/drivers/misc/qcom-coincell.c b/drivers/misc/qcom-coincell.c
> index 7b4a2da..829a61d 100644
> --- a/drivers/misc/qcom-coincell.c
> +++ b/drivers/misc/qcom-coincell.c
> @@ -94,7 +94,8 @@ static int qcom_coincell_probe(struct platform_device *pdev)
>  {
>  	struct device_node *node = pdev->dev.of_node;
>  	struct qcom_coincell chgr;
> -	u32 rset, vset;
> +	u32 rset = 0;
> +	u32 vset = 0;
>  	bool enable;
>  	int rc;
>  
> 

