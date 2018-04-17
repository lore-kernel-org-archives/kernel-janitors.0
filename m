From: Luca Coelho <luca@coelho.fi>
Date: Tue, 17 Apr 2018 07:06:33 +0000
Subject: Re: [PATCH][next] iwlwifi: mvm: remove division by size of sizeof(struct ieee80211_wmm_rule)
Message-Id: <1dfacb56f2ab9a1a38a7cb78326a4f96973cf622.camel@coelho.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180411130533.11827-1-colin.king@canonical.com>
In-Reply-To: <20180411130533.11827-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2018-04-11 at 14:05 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The subtraction of two struct ieee80211_wmm_rule pointers leaves a
> result
> that is automatically scaled down by the size of the size of pointed-
> to
> type, hence the division by sizeof(struct ieee80211_wmm_rule) is
> bogus and should be removed.
> 
> Detected by CoverityScan, CID#1467777 ("Extra sizeof expression")
> 
> Fixes: 77e30e10ee28 ("iwlwifi: mvm: query regdb for wmm rule if
> needed")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Thanks, Colin! I've pushed this to our internal tree for review and if
everything goes fine it will land upstream following our normal
upstreaming process.

--
Cheers,
Luca.
