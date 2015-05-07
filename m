From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 07 May 2015 12:27:15 +0000
Subject: Re: [patch] iwlwifi: mvm: remove some dead code
Message-Id: <1431001635.11214.2.camel@sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150507095844.GA17996@mwanda>
	 (sfid-20150507_115917_046200_420B91D7)
In-Reply-To: <20150507095844.GA17996@mwanda> (sfid-20150507_115917_046200_420B91D7)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Eran Harary <eran.harary@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, Kalle Valo <kvalo@codeaurora.org>, Arik Nemtsov <arik@wizery.com>, Luciano Coelho <luciano.coelho@intel.com>, Liad Kaufman <liad.kaufman@intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2015-05-07 at 12:58 +0300, Dan Carpenter wrote:
> "ret" is zero here so we can remove this stray check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/net/wireless/iwlwifi/mvm/fw.c b/drivers/net/wireless/iwlwifi/mvm/fw.c
> index df86963..41f4763 100644
> --- a/drivers/net/wireless/iwlwifi/mvm/fw.c
> +++ b/drivers/net/wireless/iwlwifi/mvm/fw.c
> @@ -663,8 +663,6 @@ int iwl_mvm_up(struct iwl_mvm *mvm)
>  		 */
>  		_iwl_trans_stop_device(mvm->trans, false);
>  		_iwl_trans_start_hw(mvm->trans, false);
> -		if (ret)
> -			return ret;

It looks like "ret = _iwl_trans_start_hw(...)" was intended though?

johannes

