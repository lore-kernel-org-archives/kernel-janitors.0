From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Thu, 24 Aug 2017 18:51:56 +0000
Subject: Re: [PATCH] staging: rtlwifi: check for array overflow
Message-Id: <1d7fce37-9f91-4346-4816-a12a2159fcc5@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170824100832.lcmbwcjhzwlgozeh@mwanda>
In-Reply-To: <20170824100832.lcmbwcjhzwlgozeh@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>, Johannes Berg <johannes.berg@intel.com>, Souptick Joarder <jrdr.linux@gmail.com>, devel@driverdev.osuosl.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/24/2017 05:08 AM, Dan Carpenter wrote:
> Smatch is distrustful of the "capab" value and marks it as user
> controlled.  I think it actually comes from the firmware?  Anyway, I
> looked at other drivers and they added a bounds check and it seems like
> a harmless thing to have so I have added it here as well.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Thanks,

Larry

> 
> diff --git a/drivers/staging/rtlwifi/base.c b/drivers/staging/rtlwifi/base.c
> index f7f207cbaee3..a30b928d5ee1 100644
> --- a/drivers/staging/rtlwifi/base.c
> +++ b/drivers/staging/rtlwifi/base.c
> @@ -1414,6 +1414,10 @@ bool rtl_action_proc(struct ieee80211_hw *hw, struct sk_buff *skb, u8 is_tx)
>   				  le16_to_cpu(mgmt->u.action.u.addba_req.capab);
>   				tid = (capab &
>   				       IEEE80211_ADDBA_PARAM_TID_MASK) >> 2;
> +				if (tid >= MAX_TID_COUNT) {
> +					rcu_read_unlock();
> +					return true;
> +				}
>   				tid_data = &sta_entry->tids[tid];
>   				if (tid_data->agg.rx_agg_state =
>   				    RTL_RX_AGG_START)
> 

