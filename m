From: Zhu Yi <yi.zhu@intel.com>
Date: Mon, 29 Mar 2010 02:01:12 +0000
Subject: Re: [patch] iwlwifi: range checking issue
Message-Id: <1269828072.4043.247.camel@debian>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100328115500.GX5069@bicker>
In-Reply-To: <20100328115500.GX5069@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "Chatre, Reinette" <reinette.chatre@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, "Kolekar, Abhijeet" <abhijeet.kolekar@intel.com>, "Berg, Johannes" <johannes.berg@intel.com>, "Guy, Wey-Yi W" <wey-yi.w.guy@intel.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Sun, 2010-03-28 at 19:55 +0800, Dan Carpenter wrote:
> IWL_RATE_COUNT is 13 and IWL_RATE_COUNT_LEGACY is 12.
> 
> IWL_RATE_COUNT_LEGACY is the right one here because iwl3945_rates
> doesn't support 60M and also that's how "rates" is defined in
> iwlcore_init_geos() from drivers/net/wireless/iwlwifi/iwl-core.c.
> 
>         rates = kzalloc((sizeof(struct ieee80211_rate) * IWL_RATE_COUNT_LEGACY),
>                         GFP_KERNEL);
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Zhu Yi <yi.zhu@intel.com>

Thanks,
-yi

