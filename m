From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 25 Apr 2020 19:30:22 +0000
Subject: Re: [PATCH] mmc: owl-mmc: Fix dma_chan refcnt leak in owl_mmc_probe()
Message-Id: <282da79a-eda7-f534-a6ed-8ac38fcc2c8b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Xiyu Yang <xiyuyang19@fudan.edu.cn>, Xin Tan <tanxin.ctf@gmail.com>, linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, Kangjie Lu <kjlu@umn.edu>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, Yuan Zhang <yuanxzhang@fudan.edu.cn>

> Fix this issue by jumping to "err_put_dma" label when those error
> scenarios occur.

I suggest to reconsider your jump target selection.


…
> +++ b/drivers/mmc/host/owl-mmc.c
…
> @@ -643,19 +643,22 @@ static int owl_mmc_probe(struct platform_device *pdev)
>  	return 0;
>
> +err_put_dma:
> +	if (owl_host->dma)
> +		dma_release_channel(owl_host->dma);

I interpret the source code in the way that you would like to call
this function for the desired exception handling only after a call
of the function “dma_request_chan” succeeded.
Thus I would expect that the passed pointer will usually be still valid.
(Can the proposed null pointer check be omitted then?)

How do you think about the following change possibility?

+err_release_channel:
+	dma_release_channel(owl_host->dma);


Would you like to add the tag “Fixes” to the change description?

Regards,
Markus
