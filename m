From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Tue, 17 Apr 2012 17:39:45 +0000
Subject: Re: [patch] Staging: rtl8192e: remove some dead code
Message-Id: <4F8DAAE1.7020909@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120417064558.GA29411@elgon.mountain>
In-Reply-To: <20120417064558.GA29411@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 04/17/2012 01:45 AM, Dan Carpenter wrote:
> We don't use the rxcmdpkt[] counters at all and we can remove them.
>
> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>
>

ACKed-by: Larry Finger <Larry.Finger@lwfinger.net>


> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
> index 2a2519c..cebb748 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
> @@ -353,7 +353,6 @@ struct rt_stats {
>   	unsigned long rxrdu;
>   	unsigned long rxok;
>   	unsigned long rxframgment;
> -	unsigned long rxcmdpkt[8];
>   	unsigned long rxurberr;
>   	unsigned long rxstaterr;
>   	unsigned long rxdatacrcerr;
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
> index 58d044e..ea91744 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
> @@ -342,7 +342,6 @@ static	void cmpk_handle_tx_rate_history(struct net_device *dev, u8 *pmsg)
>   u32 cmpk_message_handle_rx(struct net_device *dev,
>   			   struct rtllib_rx_stats *pstats)
>   {
> -	struct r8192_priv *priv = rtllib_priv(dev);
>   	int			total_length;
>   	u8			cmd_length, exe_cnt = 0;
>   	u8			element_id;
> @@ -409,8 +408,6 @@ u32 cmpk_message_handle_rx(struct net_device *dev,
>   			return 1;
>   		}
>
> -		priv->stats.rxcmdpkt[element_id]++;
> -
>   		total_length -= cmd_length;
>   		pcmd_buff    += cmd_length;
>   	}
>

