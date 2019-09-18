From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 18 Sep 2019 13:08:51 +0000
Subject: Re: [PATCH net] iwlwifi: add dependency of THERMAL with IWLMVM
Message-Id: <875zlpbvks.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190918122815.155657-1-maowenan@huawei.com>
In-Reply-To: <20190918122815.155657-1-maowenan@huawei.com> (Mao Wenan's
        message of "Wed, 18 Sep 2019 20:28:15 +0800")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: johannes.berg@intel.com, emmanuel.grumbach@intel.com, luciano.coelho@intel.com, linuxwifi@intel.com, davem@davemloft.net, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Mao Wenan <maowenan@huawei.com> writes:

> If CONFIG_IWLMVM=y, CONFIG_THERMAL=n, below error can be found:
> drivers/net/wireless/intel/iwlwifi/mvm/fw.o: In function `iwl_mvm_up':
> fw.c:(.text+0x2c26): undefined reference to `iwl_mvm_send_temp_report_ths_cmd'
> make: *** [vmlinux] Error 1
>
> After commit 242d9c8b9a93 ("iwlwifi: mvm: use FW thermal
> monitoring regardless of CONFIG_THERMAL"), iwl_mvm_up()
> calls iwl_mvm_send_temp_report_ths_cmd(), but this function
> is under CONFIG_THERMAL, which is depended on CONFIG_THERMAL.
>
> Fixes: 242d9c8b9a93 ("iwlwifi: mvm: use FW thermal monitoring regardless of CONFIG_THERMAL")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Luca, should I apply this directly to wireless-drivers?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
