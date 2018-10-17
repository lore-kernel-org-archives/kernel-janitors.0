From: Luciano Coelho <luciano.coelho@intel.com>
Date: Wed, 17 Oct 2018 07:16:45 +0000
Subject: Re: [PATCH] iwlwifi: mvm: remove set but not used variable 'he_phy_data'
Message-Id: <f98ae961fa880d9c2b9704ea252326d6cc6ab2e1.camel@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538736421-97401-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538736421-97401-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Golan Ben Ami <golan.ben.ami@intel.com>, Sara Sharon <sara.sharon@intel.com>, Shaul Triebitz <shaul.triebitz@intel.com>, Liad Kaufman <liad.kaufman@intel.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

On Fri, 2018-10-05 at 10:47 +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c: In function
> 'iwl_mvm_rx_mpdu_mq':
> drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c:1386:7: warning:
>  variable 'he_phy_data' set but not used [-Wunused-but-set-variable]
>    u64 he_phy_data;
>    
> 'he_phy_data' never used since be introduce in
> commit 18ead597daa1 ("iwlwifi: support new rx_mpdu_desc api")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---

Thanks, Yue! This was a merge damage when I applied the HE patches for
iwlwifi.

I've queued this and will send it out as part of the series for 4.21. 
Then it will trickle down as needed.

--
Cheers,
Luca.
