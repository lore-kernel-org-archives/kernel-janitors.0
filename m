From: Luca Coelho <luca@coelho.fi>
Date: Wed, 14 Jun 2017 10:49:11 +0000
Subject: Re: [PATCH] iwlwifi: missing error code in iwl_trans_pcie_alloc()
Message-Id: <1497437351.26841.45.camel@coelho.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614104450.GN29394@elgon.mountain>
In-Reply-To: <20170614104450.GN29394@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Johannes Berg <johannes.berg@intel.com>, Haim Dreyfuss <haim.dreyfuss@intel.com>
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Sara Sharon <sara.sharon@intel.com>, Liad Kaufman <liad.kaufman@intel.com>, Sharon Dvir <sharon.dvir@intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2017-06-14 at 13:44 +0300, Dan Carpenter wrote:
> We don't set the error code here so we end up returning ERR_PTR(0) which
> is NULL.  The caller doesn't expect that so it results in a NULL
> dereference.
> 
> Fixes: 2e5d4a8f61dc ("iwlwifi: pcie: Add new configuration to enable MSIX")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch, thanks!

I'll push it to our internal tree, so it will go upstream via our normal
process.

--
Cheers,
Luca.
