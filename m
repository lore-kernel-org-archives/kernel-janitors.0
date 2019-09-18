From: Luciano Coelho <luciano.coelho@intel.com>
Date: Wed, 18 Sep 2019 13:17:02 +0000
Subject: Re: [PATCH net] iwlwifi: add dependency of THERMAL with IWLMVM
Message-Id: <d135b9ba7900c28b3d11560666a4790e015490a2.camel@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190918122815.155657-1-maowenan@huawei.com>
         <875zlpbvks.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <875zlpbvks.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>, Mao Wenan <maowenan@huawei.com>
Cc: johannes.berg@intel.com, emmanuel.grumbach@intel.com, linuxwifi@intel.com, davem@davemloft.net, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2019-09-18 at 16:08 +0300, Kalle Valo wrote:
> Mao Wenan <maowenan@huawei.com> writes:
> 
> > If CONFIG_IWLMVM=y, CONFIG_THERMAL=n, below error can be found:
> > drivers/net/wireless/intel/iwlwifi/mvm/fw.o: In function `iwl_mvm_up':
> > fw.c:(.text+0x2c26): undefined reference to `iwl_mvm_send_temp_report_ths_cmd'
> > make: *** [vmlinux] Error 1
> > 
> > After commit 242d9c8b9a93 ("iwlwifi: mvm: use FW thermal
> > monitoring regardless of CONFIG_THERMAL"), iwl_mvm_up()
> > calls iwl_mvm_send_temp_report_ths_cmd(), but this function
> > is under CONFIG_THERMAL, which is depended on CONFIG_THERMAL.
> > 
> > Fixes: 242d9c8b9a93 ("iwlwifi: mvm: use FW thermal monitoring regardless of CONFIG_THERMAL")
> > Signed-off-by: Mao Wenan <maowenan@huawei.com>
> 
> Luca, should I apply this directly to wireless-drivers?

No, this patch defeats the point of the patch it fixes.

We have a proper fix already internally, which I haven't sent out yet,
that moves a couple of #ifdef's around to solve the issue.  I'll send
the patch in a sec.

--
Cheers,
Luca.
