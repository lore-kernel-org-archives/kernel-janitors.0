From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 21 Apr 2017 19:59:34 +0000
Subject: Re: [PATCH] iwlwifi: pcie: off by one in iwl_trans_pcie_dyn_txq_alloc()
Message-Id: <1492804774.19290.5.camel@sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170421194619.sjc33647odsfkcfl@mwanda>
         (sfid-20170421_214638_709112_32AE460F)
In-Reply-To: <20170421194619.sjc33647odsfkcfl@mwanda> (sfid-20170421_214638_709112_32AE460F)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Sara Sharon <sara.sharon@intel.com>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2017-04-21 at 22:46 +0300, Dan Carpenter wrote:
> The > should be >= or we are writing one space beyond the end of the
> array.

I think I just did the same fixes you did - after running smatch :)

This is on its way already (in our local tree), but since nobody can
actually run the code yet - the hardware doesn't exist - Luca hasn't
sent it out yet.

Thanks though!

johannes
