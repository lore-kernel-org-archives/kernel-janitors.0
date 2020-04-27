From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 27 Apr 2020 05:54:33 +0000
Subject: Re: [PATCH] mmc: alcor: Fix a resource leak in an error handling path in 'alcor_pci_sdmmc_drv_probe(
Message-Id: <35c7cffb-02dd-452c-f525-fe5ddcbb0a48@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200426202355.43055-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200426202355.43055-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, linux-mmc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, Daniel Drake <drake@endlessm.com>, Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Oleksij Rempel <linux@rempel-privat.de>, Ulf Hansson <ulf.hansson@linaro.org>

> If 'devm_request_threaded_irq()' fails, resources allocated by
> 'mmc_alloc_host()' must be freed.

How do you think about a wording variant like the following?

   Subject:
   [PATCH v2] mmc: alcor: Complete exception handling in alcor_pci_sdmmc_drv_probe()

   Change description (according to a solution alternative):
   The exception handling was incomplete in an if branch
   after a failed call of the function “devm_request_threaded_irq”.
   Thus add a call of the function “mmc_free_host” for the release of
   corresponding system resources.


> +++ b/drivers/mmc/host/alcor.c
> @@ -1104,7 +1104,7 @@ static int alcor_pci_sdmmc_drv_probe(struct platform_device *pdev)
>
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to get irq for data line\n");
> -		return ret;
> +		goto free_host;
>  	}
>
>  	mutex_init(&host->cmd_mutex);

You propose to perform a jump to other code only once in this implementation.
I find it more succinct to call the desired function then directly.

 		dev_err(…);
+		mmc_free_host(mmc);
 		return ret;


Regards,
Markus
