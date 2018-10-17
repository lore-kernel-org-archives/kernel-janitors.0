From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 17 Oct 2018 07:48:15 +0000
Subject: Re: [PATCH] iwlwifi: acpi: Use kmemdup rather than duplicating its implementation in iwl_parse_nvm_m
Message-Id: <a3ce52c5-c3d8-a06e-6f97-6b40d2906e4a@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538730169-145458-1-git-send-email-yuehaibing@huawei.com>
 <4016573ae1c44a37bbf98c1225c02afd8b82e713.camel@intel.com>
In-Reply-To: <4016573ae1c44a37bbf98c1225c02afd8b82e713.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luciano Coelho <luciano.coelho@intel.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2018/10/17 15:25, Luciano Coelho wrote:
> On Fri, 2018-10-05 at 09:02 +0000, YueHaibing wrote:
>> Use kmemdup rather than duplicating its implementation
>>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
> 
> Thanks, YueHaibing.  I have applied this in our internal tree and it
> will eventually reach the mainline, following our normal upstreaming
> process.
> 
> I have modified the subject and the commit message a bit.

Thanks you!

> 
> --
> Cheers,
> Luca.
> 
> 
> .
> 
