From: Mateusz Kulikowski <mateusz.kulikowski@gmail.com>
Date: Sun, 19 Jul 2015 18:17:22 +0000
Subject: Re: [patch 2/2 v2] Staging: rtl8192e: pointer math bug in rtllib_rx_DELBA()
Message-Id: <55ABE9B2.6020806@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150719105233.GB8410@mwanda>
In-Reply-To: <20150719105233.GB8410@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vaishali Thakkar <vthakkar1994@gmail.com>, Mahati Chamarthy <mahati.chamarthy@gmail.com>, Chen Gang <gang.chen.5i5j@gmail.com>, Matthew Casey <mdcasey@chabloom.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 19.07.2015 12:52, Dan Carpenter wrote:
> The pointer math here was totally wrong so we were reading nonsense
> information from beyond the end of the buffer.  It could lead to an oops
> if that memory wasn't mapped.
> 
> The "pReasonCode" pointer is assigned but never used so I deleted it.
> 
> With-Fix-From: Mateusz Kulikowski <mateusz.kulikowski@gmail.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Mateusz noticed some more pointer math bugs on the next lines.
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> index 60f536c..78ede4a 100644
> --- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> @@ -428,7 +428,6 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
>  {
>  	 struct rtllib_hdr_3addr *delba = NULL;
>  	union delba_param_set *pDelBaParamSet = NULL;
> -	u16 *pReasonCode = NULL;
>  	u8 *dst = NULL;
>  
>  	if (skb->len < sizeof(struct rtllib_hdr_3addr) + 6) {
> @@ -453,9 +452,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
>  #endif
>  	delba = (struct rtllib_hdr_3addr *)skb->data;
>  	dst = (u8 *)(&delba->addr2[0]);
> -	delba += sizeof(struct rtllib_hdr_3addr);
> -	pDelBaParamSet = (union delba_param_set *)(delba+2);
> -	pReasonCode = (u16 *)(delba+4);
> +	pDelBaParamSet = (union delba_param_set *)&delba->payload[2];
>  
>  	if (pDelBaParamSet->field.Initiator = 1) {
>  		struct rx_ts_record *pRxTs;
> 

Acked/Tested-by me 

Thanks,
Mateusz
