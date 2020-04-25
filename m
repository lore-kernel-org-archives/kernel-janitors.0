From: Greg KH <gregkh@linuxfoundation.org>
Date: Sat, 25 Apr 2020 10:54:32 +0000
Subject: Re: [PATCH v3] staging: wfx: cleanup long lines in data_tx.c
Message-Id: <20200425105432.GA2068247@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200424134834.GA19700@blackclown>
In-Reply-To: <20200424134834.GA19700@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suraj Upadhyay <usuraj35@gmail.com>
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com, linux-kernel@vger.kernel.org

On Fri, Apr 24, 2020 at 07:18:34PM +0530, Suraj Upadhyay wrote:
> Break lines with length over 80 characters to conform
> to the linux coding style and refactor wherever necessary.
> 
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> ---
> 
> Changes in v3:
> 	- Changed the temporary variable name for the memzcmp statement
> 	  to is_used. (as suggested).
> 	- Added a temporary ieee80211_supported_band variable to address
> 	  the problem in wfx_get_hw_rate() more efficiently. (not
> 	  suggested, but still).
> 
> Changes in v2:
>         - Introduced a temporary variable for the memzcmp statement.
>         - Addressed the checkpatch problem with wfx_get_hw_rate().
>         - Restored the function definition of wfx_tx_get_tx_parms
>           as suggested by the reviewer.
>         - Added suggested changes for req->packet_id statement.
> 
>  drivers/staging/wfx/data_tx.c | 40 +++++++++++++++++++++++------------
>  1 file changed, 26 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/wfx/data_tx.c b/drivers/staging/wfx/data_tx.c
> index 9c1a91207dd8..717155975345 100644
> --- a/drivers/staging/wfx/data_tx.c
> +++ b/drivers/staging/wfx/data_tx.c
> @@ -20,6 +20,8 @@
>  static int wfx_get_hw_rate(struct wfx_dev *wdev,
>  			   const struct ieee80211_tx_rate *rate)
>  {
> +
> +	struct ieee80211_supported_band *band;
>  	if (rate->idx < 0)

checkpatch did not complain about this change?

It should have...

Please fix that up.

thanks,

greg k-h
