From: Luciano Coelho <luciano.coelho@intel.com>
Date: Mon, 25 Nov 2019 07:24:58 +0000
Subject: Re: iwlwifi: Checking a kmemdup() call in iwl_req_fw_callback()
Message-Id: <ea75c55485c0d893b15a67462728b45b775921b0.camel@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <71774617-79f9-1365-4267-a15a47422d10@web.de>
In-Reply-To: <71774617-79f9-1365-4267-a15a47422d10@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-wireless@vger.kernel.org, linuxwifi@intel.com, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Johannes Berg <johannes.berg@intel.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>

On Sat, 2019-10-12 at 19:26 +0200, Markus Elfring wrote:
> Hello,
> 
> I tried another script for the semantic patch language out.
> This source code analysis approach points out that the implementation
> of the function “iwl_req_fw_callback” contains still an unchecked call
> of the function “kmemdup”.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/intel/iwlwifi/iwl-drv.c?id0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n1454
> https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/net/wireless/intel/iwlwifi/iwl-drv.c#L1454
> 
> Can it be that just an other data structure member should be used
> for the desired null pointer check at this place?

Hi Markus,

Sorry for the delay in replying to this.

I've checked this now and you are right.  We are checking the element
in the array that contains the length of the allocation we requested
instead of checking the pointer returned by kmemdup().  This was
probably a typo.

I have fixed this in our internal tree and it will reach the mainline
following our normal upstreaming process.

Thanks for reporting!

--
Cheers,
Luca.
