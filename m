From: Mukesh Ojha <mojha@codeaurora.org>
Date: Tue, 16 Apr 2019 07:14:39 +0000
Subject: Re: [PATCH] mwifiex: fix spelling mistake "capabilties" -> "capabilities"
Message-Id: <9347fb11-1c45-3db5-da6b-593dcdc4c2f9@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190415142649.18452-1-colin.king@canonical.com>
In-Reply-To: <20190415142649.18452-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Nishant Sarmukadam <nishants@marvell.com>, Ganapathi Bhat <gbhat@marvell.com>, Xinming Hu <huxinming820@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/15/2019 7:56 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There various spelling mistakes in function names and in message
> text. Fix these.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>


I am hoping you have done the compilation test.

Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

> ---
>   drivers/net/wireless/marvell/mwifiex/sta_event.c | 12 ++++++------
>   drivers/net/wireless/marvell/mwifiex/uap_event.c |  8 ++++----
>   2 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/net/wireless/marvell/mwifiex/sta_event.c b/drivers/net/wireless/marvell/mwifiex/sta_event.c
> index a327fc5b36e3..8b3123cb84c8 100644
> --- a/drivers/net/wireless/marvell/mwifiex/sta_event.c
> +++ b/drivers/net/wireless/marvell/mwifiex/sta_event.c
> @@ -27,9 +27,9 @@
>   
>   #define MWIFIEX_IBSS_CONNECT_EVT_FIX_SIZE    12
>   
> -static int mwifiex_check_ibss_peer_capabilties(struct mwifiex_private *priv,
> -					       struct mwifiex_sta_node *sta_ptr,
> -					       struct sk_buff *event)
> +static int mwifiex_check_ibss_peer_capabilities(struct mwifiex_private *priv,
> +					        struct mwifiex_sta_node *sta_ptr,
> +					        struct sk_buff *event)
>   {
>   	int evt_len, ele_len;
>   	u8 *curr;
> @@ -42,7 +42,7 @@ static int mwifiex_check_ibss_peer_capabilties(struct mwifiex_private *priv,
>   	evt_len = event->len;
>   	curr = event->data;
>   
> -	mwifiex_dbg_dump(priv->adapter, EVT_D, "ibss peer capabilties:",
> +	mwifiex_dbg_dump(priv->adapter, EVT_D, "ibss peer capabilities:",
>   			 event->data, event->len);
>   
>   	skb_push(event, MWIFIEX_IBSS_CONNECT_EVT_FIX_SIZE);
> @@ -937,8 +937,8 @@ int mwifiex_process_sta_event(struct mwifiex_private *priv)
>   			    ibss_sta_addr);
>   		sta_ptr = mwifiex_add_sta_entry(priv, ibss_sta_addr);
>   		if (sta_ptr && adapter->adhoc_11n_enabled) {
> -			mwifiex_check_ibss_peer_capabilties(priv, sta_ptr,
> -							    adapter->event_skb);
> +			mwifiex_check_ibss_peer_capabilities(priv, sta_ptr,
> +							     adapter->event_skb);
>   			if (sta_ptr->is_11n_enabled)
>   				for (i = 0; i < MAX_NUM_TID; i++)
>   					sta_ptr->ampdu_sta[i] > diff --git a/drivers/net/wireless/marvell/mwifiex/uap_event.c b/drivers/net/wireless/marvell/mwifiex/uap_event.c
> index ca759d9c0253..86bfa1b9ef9d 100644
> --- a/drivers/net/wireless/marvell/mwifiex/uap_event.c
> +++ b/drivers/net/wireless/marvell/mwifiex/uap_event.c
> @@ -23,8 +23,8 @@
>   
>   #define MWIFIEX_BSS_START_EVT_FIX_SIZE    12
>   
> -static int mwifiex_check_uap_capabilties(struct mwifiex_private *priv,
> -					 struct sk_buff *event)
> +static int mwifiex_check_uap_capabilities(struct mwifiex_private *priv,
> +					  struct sk_buff *event)
>   {
>   	int evt_len;
>   	u8 *curr;
> @@ -38,7 +38,7 @@ static int mwifiex_check_uap_capabilties(struct mwifiex_private *priv,
>   	evt_len = event->len;
>   	curr = event->data;
>   
> -	mwifiex_dbg_dump(priv->adapter, EVT_D, "uap capabilties:",
> +	mwifiex_dbg_dump(priv->adapter, EVT_D, "uap capabilities:",
>   			 event->data, event->len);
>   
>   	skb_push(event, MWIFIEX_BSS_START_EVT_FIX_SIZE);
> @@ -201,7 +201,7 @@ int mwifiex_process_uap_event(struct mwifiex_private *priv)
>   		       ETH_ALEN);
>   		if (priv->hist_data)
>   			mwifiex_hist_data_reset(priv);
> -		mwifiex_check_uap_capabilties(priv, adapter->event_skb);
> +		mwifiex_check_uap_capabilities(priv, adapter->event_skb);
>   		break;
>   	case EVENT_UAP_MIC_COUNTERMEASURES:
>   		/* For future development */
