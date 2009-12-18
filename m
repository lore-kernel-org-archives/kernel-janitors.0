From: Jiri Kosina <jkosina@suse.cz>
Date: Fri, 18 Dec 2009 14:10:21 +0000
Subject: Re: [PATCH 05/10] Fix a grammar error (redundant "be").
Message-Id: <alpine.LNX.2.00.0912181510140.3755@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1260567342-8327-6-git-send-email-adam.buchbinder@gmail.com>
In-Reply-To: <1260567342-8327-6-git-send-email-adam.buchbinder@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 11 Dec 2009, Adam Buchbinder wrote:

> 
> Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
> ---
>  drivers/net/wireless/zd1211rw/zd_mac.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/net/wireless/zd1211rw/zd_mac.c b/drivers/net/wireless/zd1211rw/zd_mac.c
> index 2b7f965..7aad980 100644
> --- a/drivers/net/wireless/zd1211rw/zd_mac.c
> +++ b/drivers/net/wireless/zd1211rw/zd_mac.c
> @@ -312,7 +312,7 @@ static void tx_status(struct ieee80211_hw *hw, struct sk_buff *skb,
>   * zd_mac_tx_failed - callback for failed frames
>   * @dev: the mac80211 wireless device
>   *
> - * This function is called if a frame couldn't be successfully be
> + * This function is called if a frame couldn't be successfully
>   * transferred. The first frame from the tx queue, will be selected and
>   * reported as error to the upper layers.
>   */

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
