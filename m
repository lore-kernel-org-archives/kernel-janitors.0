From: Mukesh Ojha <mojha@codeaurora.org>
Date: Thu, 18 Apr 2019 12:55:46 +0000
Subject: Re: [PATCH] staging: rtl8723bs: hal: fix spelling mistake "singal" -> "signal"
Message-Id: <b2cca452-fc4c-00c6-966b-2cdbf25fa2d5@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190418122041.12896-1-colin.king@canonical.com>
In-Reply-To: <20190418122041.12896-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/18/2019 5:50 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There are multiple spelling mistakes in variable names, fix these.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>


Well, this one a bit sensitive to touch.
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

> ---
>   drivers/staging/rtl8723bs/hal/hal_com.c      | 18 +++++++++---------
>   drivers/staging/rtl8723bs/include/rtw_recv.h |  4 ++--
>   2 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
> index f1c91483ca07..e5f1153527b9 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_com.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_com.c
> @@ -1618,14 +1618,14 @@ void rtw_get_raw_rssi_info(void *sel, struct adapter *padapter)
>   	isCCKrate = psample_pkt_rssi->data_rate <= DESC_RATE11M;
>   
>   	if (isCCKrate)
> -		psample_pkt_rssi->mimo_singal_strength[0] = psample_pkt_rssi->pwdball;
> +		psample_pkt_rssi->mimo_signal_strength[0] = psample_pkt_rssi->pwdball;
>   
>   	for (rf_path = 0; rf_path < pHalData->NumTotalRFPath; rf_path++) {
>   		DBG_871X_SEL_NL(
>   			sel,
> -			"RF_PATH_%d =>singal_strength:%d(%%), singal_quality:%d(%%)\n",
> -			rf_path, psample_pkt_rssi->mimo_singal_strength[rf_path],
> -			psample_pkt_rssi->mimo_singal_quality[rf_path]
> +			"RF_PATH_%d =>signal_strength:%d(%%), signal_quality:%d(%%)\n",
> +			rf_path, psample_pkt_rssi->mimo_signal_strength[rf_path],
> +			psample_pkt_rssi->mimo_signal_quality[rf_path]
>   		);
>   
>   		if (!isCCKrate) {
> @@ -1651,11 +1651,11 @@ void rtw_dump_raw_rssi_info(struct adapter *padapter)
>   	isCCKrate = psample_pkt_rssi->data_rate <= DESC_RATE11M;
>   
>   	if (isCCKrate)
> -		psample_pkt_rssi->mimo_singal_strength[0] = psample_pkt_rssi->pwdball;
> +		psample_pkt_rssi->mimo_signal_strength[0] = psample_pkt_rssi->pwdball;
>   
>   	for (rf_path = 0; rf_path < pHalData->NumTotalRFPath; rf_path++) {
> -		DBG_871X("RF_PATH_%d =>singal_strength:%d(%%), singal_quality:%d(%%)"
> -			, rf_path, psample_pkt_rssi->mimo_singal_strength[rf_path], psample_pkt_rssi->mimo_singal_quality[rf_path]);
> +		DBG_871X("RF_PATH_%d =>signal_strength:%d(%%), signal_quality:%d(%%)"
> +			, rf_path, psample_pkt_rssi->mimo_signal_strength[rf_path], psample_pkt_rssi->mimo_signal_quality[rf_path]);
>   
>   		if (!isCCKrate) {
>   			printk(", rx_ofdm_pwr:%d(dBm), rx_ofdm_snr:%d(dB)\n",
> @@ -1682,8 +1682,8 @@ void rtw_store_phy_info(struct adapter *padapter, union recv_frame *prframe)
>   	psample_pkt_rssi->pwr_all = pPhyInfo->recv_signal_power;
>   
>   	for (rf_path = 0; rf_path < pHalData->NumTotalRFPath; rf_path++) {
> -		psample_pkt_rssi->mimo_singal_strength[rf_path] = pPhyInfo->rx_mimo_signal_strength[rf_path];
> -		psample_pkt_rssi->mimo_singal_quality[rf_path] = pPhyInfo->rx_mimo_signal_quality[rf_path];
> +		psample_pkt_rssi->mimo_signal_strength[rf_path] = pPhyInfo->rx_mimo_signal_strength[rf_path];
> +		psample_pkt_rssi->mimo_signal_quality[rf_path] = pPhyInfo->rx_mimo_signal_quality[rf_path];
>   		if (!isCCKrate) {
>   			psample_pkt_rssi->ofdm_pwr[rf_path] = pPhyInfo->RxPwr[rf_path];
>   			psample_pkt_rssi->ofdm_snr[rf_path] = pPhyInfo->RxSNR[rf_path];
> diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
> index 7d54cf211315..5de946e66302 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_recv.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
> @@ -120,8 +120,8 @@ struct rx_raw_rssi
>   	u8 pwdball;
>   	s8 pwr_all;
>   
> -	u8 mimo_singal_strength[4];/*  in 0~100 index */
> -	u8 mimo_singal_quality[4];
> +	u8 mimo_signal_strength[4];/*  in 0~100 index */
> +	u8 mimo_signal_quality[4];
>   
>   	s8 ofdm_pwr[4];
>   	u8 ofdm_snr[4];
