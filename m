From: Julia Lawall <julia.lawall@inria.fr>
Date: Wed, 24 Jun 2020 10:05:49 +0000
Subject: Re: [PATCH] drivers: staging: vt6655: replace CamelCase names on function s_uGetRTSCTSRsvTime
Message-Id: <alpine.DEB.2.22.394.2006241205210.2433@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200624100256.GA17118@ip-172-31-24-31.ec2.internal>
In-Reply-To: <20200624100256.GA17118@ip-172-31-24-31.ec2.internal>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rodolfo C. Villordo" <rodolfovillordo@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Wed, 24 Jun 2020, Rodolfo C. Villordo wrote:

> Replace function and variables name from CamelCase style to snake_case style.
> Remove Hungarian notation.
>
> Signed-off-by: Rodolfo C. Villordo <rodolfovillordo@gmail.com>
> ---
>  drivers/staging/vt6655/rxtx.c | 80 +++++++++++++++++------------------
>  1 file changed, 38 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index cfab64d2b312..4778439e8757 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -21,7 +21,7 @@
>   *      s_uGetDataDuration - get tx data required duration
>   *      s_uFillDataHead- fulfill tx data duration header
>   *      s_uGetRTSCTSDuration- get rtx/cts required duration
> - *      s_uGetRTSCTSRsvTime- get rts/cts reserved time
> + *      get_rtscts_time- get rts/cts reserved time
>   *      s_uGetTxRsvTime- get frame reserved time
>   *      s_vFillCTSHead- fulfill CTS ctl header
>   *      s_vFillFragParameter- Set fragment ctl parameter.

Why is only one of these done?

julia

> @@ -190,45 +190,41 @@ static __le16 vnt_rxtx_rsvtime_le16(struct vnt_private *priv, u8 pkt_type,
>  }
>
>  /* byFreqType: 0=>5GHZ 1=>2.4GHZ */
> -static
> -__le16
> -s_uGetRTSCTSRsvTime(
> -	struct vnt_private *pDevice,
> -	unsigned char byRTSRsvType,
> -	unsigned char byPktType,
> -	unsigned int cbFrameLength,
> -	unsigned short wCurrentRate
> -)
> +static __le16 get_rtscts_time(struct vnt_private *priv,
> +			      unsigned char rts_rsvtype,
> +			      unsigned char pkt_type,
> +			      unsigned int frame_length,
> +			      unsigned short current_rate)
>  {
> -	unsigned int uRrvTime = 0;
> -	unsigned int uRTSTime = 0;
> -	unsigned int uCTSTime = 0;
> -	unsigned int uAckTime = 0;
> -	unsigned int uDataTime = 0;
> -
> -	uDataTime = bb_get_frame_time(pDevice->byPreambleType, byPktType, cbFrameLength, wCurrentRate);
> -	if (byRTSRsvType = 0) { /* RTSTxRrvTime_bb */
> -		uRTSTime = bb_get_frame_time(pDevice->byPreambleType, byPktType, 20, pDevice->byTopCCKBasicRate);
> -		uAckTime = bb_get_frame_time(pDevice->byPreambleType, byPktType, 14, pDevice->byTopCCKBasicRate);
> -		uCTSTime = uAckTime;
> -	} else if (byRTSRsvType = 1) { /* RTSTxRrvTime_ba, only in 2.4GHZ */
> -		uRTSTime = bb_get_frame_time(pDevice->byPreambleType, byPktType, 20, pDevice->byTopCCKBasicRate);
> -		uCTSTime = bb_get_frame_time(pDevice->byPreambleType, byPktType, 14, pDevice->byTopCCKBasicRate);
> -		uAckTime = bb_get_frame_time(pDevice->byPreambleType, byPktType, 14, pDevice->byTopOFDMBasicRate);
> -	} else if (byRTSRsvType = 2) { /* RTSTxRrvTime_aa */
> -		uRTSTime = bb_get_frame_time(pDevice->byPreambleType, byPktType, 20, pDevice->byTopOFDMBasicRate);
> -		uAckTime = bb_get_frame_time(pDevice->byPreambleType, byPktType, 14, pDevice->byTopOFDMBasicRate);
> -		uCTSTime = uAckTime;
> -	} else if (byRTSRsvType = 3) { /* CTSTxRrvTime_ba, only in 2.4GHZ */
> -		uCTSTime = bb_get_frame_time(pDevice->byPreambleType, byPktType, 14, pDevice->byTopCCKBasicRate);
> -		uAckTime = bb_get_frame_time(pDevice->byPreambleType, byPktType, 14, pDevice->byTopOFDMBasicRate);
> -		uRrvTime = uCTSTime + uAckTime + uDataTime + 2 * pDevice->uSIFS;
> -		return cpu_to_le16((u16)uRrvTime);
> +	unsigned int rrv_time = 0;
> +	unsigned int rts_time = 0;
> +	unsigned int cts_time = 0;
> +	unsigned int ack_time = 0;
> +	unsigned int data_time = 0;
> +
> +	data_time = bb_get_frame_time(priv->byPreambleType, pkt_type, frame_length, current_rate);
> +	if (rts_rsvtype = 0) { /* RTSTxRrvTime_bb */
> +		rts_time = bb_get_frame_time(priv->byPreambleType, pkt_type, 20, priv->byTopCCKBasicRate);
> +		ack_time = bb_get_frame_time(priv->byPreambleType, pkt_type, 14, priv->byTopCCKBasicRate);
> +		cts_time = ack_time;
> +	} else if (rts_rsvtype = 1) { /* RTSTxRrvTime_ba, only in 2.4GHZ */
> +		rts_time = bb_get_frame_time(priv->byPreambleType, pkt_type, 20, priv->byTopCCKBasicRate);
> +		cts_time = bb_get_frame_time(priv->byPreambleType, pkt_type, 14, priv->byTopCCKBasicRate);
> +		ack_time = bb_get_frame_time(priv->byPreambleType, pkt_type, 14, priv->byTopOFDMBasicRate);
> +	} else if (rts_rsvtype = 2) { /* RTSTxRrvTime_aa */
> +		rts_time = bb_get_frame_time(priv->byPreambleType, pkt_type, 20, priv->byTopOFDMBasicRate);
> +		ack_time = bb_get_frame_time(priv->byPreambleType, pkt_type, 14, priv->byTopOFDMBasicRate);
> +		cts_time = ack_time;
> +	} else if (rts_rsvtype = 3) { /* CTSTxRrvTime_ba, only in 2.4GHZ */
> +		cts_time = bb_get_frame_time(priv->byPreambleType, pkt_type, 14, priv->byTopCCKBasicRate);
> +		ack_time = bb_get_frame_time(priv->byPreambleType, pkt_type, 14, priv->byTopOFDMBasicRate);
> +		rrv_time = cts_time + ack_time + data_time + 2 * priv->uSIFS;
> +		return cpu_to_le16((u16)rrv_time);
>  	}
>
>  	/* RTSRrvTime */
> -	uRrvTime = uRTSTime + uCTSTime + uAckTime + uDataTime + 3 * pDevice->uSIFS;
> -	return cpu_to_le16((u16)uRrvTime);
> +	rrv_time = rts_time + cts_time + ack_time + data_time + 3 * priv->uSIFS;
> +	return cpu_to_le16((u16)rrv_time);
>  }
>
>  /* byFreqType 0: 5GHz, 1:2.4Ghz */
> @@ -921,9 +917,9 @@ s_vGenerateTxParameter(
>  			/* Fill RsvTime */
>  			struct vnt_rrv_time_rts *buf = pvRrvTime;
>
> -			buf->rts_rrv_time_aa = s_uGetRTSCTSRsvTime(pDevice, 2, byPktType, cbFrameSize, wCurrentRate);
> -			buf->rts_rrv_time_ba = s_uGetRTSCTSRsvTime(pDevice, 1, byPktType, cbFrameSize, wCurrentRate);
> -			buf->rts_rrv_time_bb = s_uGetRTSCTSRsvTime(pDevice, 0, byPktType, cbFrameSize, wCurrentRate);
> +			buf->rts_rrv_time_aa = get_rtscts_time(pDevice, 2, byPktType, cbFrameSize, wCurrentRate);
> +			buf->rts_rrv_time_ba = get_rtscts_time(pDevice, 1, byPktType, cbFrameSize, wCurrentRate);
> +			buf->rts_rrv_time_bb = get_rtscts_time(pDevice, 0, byPktType, cbFrameSize, wCurrentRate);
>  			buf->rrv_time_a = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
>  			buf->rrv_time_b = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, pDevice->byTopCCKBasicRate, bNeedACK);
>
> @@ -933,7 +929,7 @@ s_vGenerateTxParameter(
>
>  			buf->rrv_time_a = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
>  			buf->rrv_time_b = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, pDevice->byTopCCKBasicRate, bNeedACK);
> -			buf->cts_rrv_time_ba = s_uGetRTSCTSRsvTime(pDevice, 3, byPktType, cbFrameSize, wCurrentRate);
> +			buf->cts_rrv_time_ba = get_rtscts_time(pDevice, 3, byPktType, cbFrameSize, wCurrentRate);
>
>  			/* Fill CTS */
>  			s_vFillCTSHead(pDevice, uDMAIdx, byPktType, pvCTS, cbFrameSize, bNeedACK, bDisCRC, wCurrentRate, byFBOption);
> @@ -942,7 +938,7 @@ s_vGenerateTxParameter(
>  		if (pvRTS) {/* RTS_need, non PCF mode */
>  			struct vnt_rrv_time_ab *buf = pvRrvTime;
>
> -			buf->rts_rrv_time = s_uGetRTSCTSRsvTime(pDevice, 2, byPktType, cbFrameSize, wCurrentRate);
> +			buf->rts_rrv_time = get_rtscts_time(pDevice, 2, byPktType, cbFrameSize, wCurrentRate);
>  			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
>
>  			/* Fill RTS */
> @@ -956,7 +952,7 @@ s_vGenerateTxParameter(
>  		if (pvRTS) {/* RTS_need, non PCF mode */
>  			struct vnt_rrv_time_ab *buf = pvRrvTime;
>
> -			buf->rts_rrv_time = s_uGetRTSCTSRsvTime(pDevice, 0, byPktType, cbFrameSize, wCurrentRate);
> +			buf->rts_rrv_time = get_rtscts_time(pDevice, 0, byPktType, cbFrameSize, wCurrentRate);
>  			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, wCurrentRate, bNeedACK);
>
>  			/* Fill RTS */
> --
> 2.17.1
>
>
