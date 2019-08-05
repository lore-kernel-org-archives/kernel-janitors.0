From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 05 Aug 2019 12:11:45 +0000
Subject: Re: [PATCH] phy: qualcomm: phy-qcom-qmp: Add of_node_put() before return
Message-Id: <239020d9-ff8a-237d-b52c-bf2423f9609b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190804162420.6005-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190804162420.6005-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nishka Dasgupta <nishkadg.linux@gmail.com>, Andy Gross <agross@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -2094,6 +2094,7 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
>  			dev_err(dev, "failed to create lane%d phy, %d\n",
>  				id, ret);
>  			pm_runtime_disable(dev);
> +			of_node_put(child);
>  			return ret;
>  		}

I suggest to move a bit of common exception handling code to the end of
this function implementation.
Would you like to add a jump target?

Regards,
Markus
