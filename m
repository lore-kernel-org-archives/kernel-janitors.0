From: Adrian Hunter <adrian.hunter@intel.com>
Date: Thu, 06 Aug 2020 12:32:18 +0000
Subject: Re: [PATCH] mmc: sdhci-pci-o2micro: fix spelling mistake "unsupport" -> "unsupported"
Message-Id: <e472589a-99ed-36d4-1f69-583376a5ceaf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200806115059.59241-1-colin.king@canonical.com>
 <016404fc-fce8-20f5-da6c-1b7ea936cf5a@intel.com>
In-Reply-To: <016404fc-fce8-20f5-da6c-1b7ea936cf5a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, shirley her <shirley.her@bayhubtech.com>

On 6/08/20 3:21 pm, Adrian Hunter wrote:
> + code author ernest.zhang <ernest.zhang@bayhubtech.com>

That email address bounced, so instead adding

	shirley her <shirley.her@bayhubtech.com>

> 
> On 6/08/20 2:50 pm, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There is a spelling mistake in a pr_info message. Fix it.
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/mmc/host/sdhci-pci-o2micro.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-pci-o2micro.c b/drivers/mmc/host/sdhci-pci-o2micro.c
>> index fa76748d8929..4eca8d2d0599 100644
>> --- a/drivers/mmc/host/sdhci-pci-o2micro.c
>> +++ b/drivers/mmc/host/sdhci-pci-o2micro.c
>> @@ -469,7 +469,7 @@ static void sdhci_pci_o2_enable_msi(struct sdhci_pci_chip *chip,
>>  
>>  	ret = pci_find_capability(chip->pdev, PCI_CAP_ID_MSI);
>>  	if (!ret) {
>> -		pr_info("%s: unsupport msi, use INTx irq\n",
>> +		pr_info("%s: unsupported msi, use INTx irq\n",
> 
> I think the meaning is more like:
> 
> 	MSI is not supported, using INTx IRQ
> 
>>  			mmc_hostname(host->mmc));
>>  		return;
>>  	}
>>
> 
