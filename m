From: "Guy, Wey-Yi" <wey-yi.w.guy@intel.com>
Date: Wed, 31 Aug 2011 09:35:36 +0000
Subject: Re: [patch -next 2/2] iwlwifi: signedness bug in
Message-Id: <1314783336.26890.4.camel@wwguy-huron>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110831063830.GD3705@shale.localdomain>
In-Reply-To: <20110831063830.GD3705@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, "open list:INTEL WIRELESS WI..." <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Tue, 2011-08-30 at 23:38 -0700, Dan Carpenter wrote:
> unsigned shorts and unsigned chars are never = -1.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Wey-Yi Guy <wey-yi.w.guy@intel.com>
> 
> diff --git a/drivers/net/wireless/iwlwifi/iwl-trans-tx-pcie.c b/drivers/net/wireless/iwlwifi/iwl-trans-tx-pcie.c
> index 5dd6a6d..ea6a0bc 100644
> --- a/drivers/net/wireless/iwlwifi/iwl-trans-tx-pcie.c
> +++ b/drivers/net/wireless/iwlwifi/iwl-trans-tx-pcie.c
> @@ -535,7 +535,7 @@ int iwl_trans_pcie_tx_agg_alloc(struct iwl_trans *trans,
>  	struct iwl_trans_pcie *trans_pcie = IWL_TRANS_GET_PCIE_TRANS(trans);
>  	struct iwl_tid_data *tid_data;
>  	unsigned long flags;
> -	u16 txq_id;
> +	int txq_id;
>  	struct iwl_priv *priv = priv(trans);
>  
>  	txq_id = iwlagn_txq_ctx_activate_free(trans);

True

Wey


