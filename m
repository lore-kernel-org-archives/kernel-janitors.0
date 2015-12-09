From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 09 Dec 2015 10:41:22 +0000
Subject: Re: [patch] iwlwifi: mvm: remove an extra tab
Message-Id: <1449657682.2304.1.camel@sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151209102608.GF3173@mwanda>
	 (sfid-20151209_112631_985246_0F4FF2B2)
In-Reply-To: <20151209102608.GF3173@mwanda> (sfid-20151209_112631_985246_0F4FF2B2)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Golan Ben-Ami <golan.ben.ami@intel.com>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2015-12-09 at 13:26 +0300, Dan Carpenter wrote:
> Smatch prints a static checker warning here:
> 
>     drivers/net/wireless/intel/iwlwifi/mvm/fw-dbg.c:386
> iwl_dump_prph()
>     warn: curly braces intended?
> 
> Curly braces are NOT intended, the extra tab was added by mistake in
> commit 1a616dd2f171 ('iwlwifi: dump prph registers in a common place
> for all transports').
> 

Applied, thanks.

johannes
