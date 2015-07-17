From: Mateusz Kulikowski <mateusz.kulikowski@gmail.com>
Date: Fri, 17 Jul 2015 20:17:40 +0000
Subject: Re: [patch 2/2] Staging: rtl8192e: pointer math bug in rtllib_rx_DELBA()
Message-Id: <55A962E4.2070708@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150717092425.GA3060@mwanda>
In-Reply-To: <20150717092425.GA3060@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

n 17.07.2015 11:24, Dan Carpenter wrote:
> The "delba" variable is a pointer to struct rtllib_hdr_3addr so this
> pointer math bug means that we read nonsense data from beyond the end of
> the buffer.  It could result in a oops if the memory is not mapped.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> index 60f536c..98e6c4e 100644
> --- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> @@ -453,7 +453,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
>  #endif
>  	delba = (struct rtllib_hdr_3addr *)skb->data;
>  	dst = (u8 *)(&delba->addr2[0]);
> -	delba += sizeof(struct rtllib_hdr_3addr);
> +	delba++;
>  	pDelBaParamSet = (union delba_param_set *)(delba+2);
>  	pReasonCode = (u16 *)(delba+4);
>  
> 

Ack/+1, 

It's not the last fix for 'delba' unfortunately :(

Next lines should use delba as u8 if I see correctly
See rtllib_DELBA() (line 141) - It first fills skb with rtllib_hdr_3_addr,
and then adds skb delbaparam_set and reasonCode (as a 6 bytes).
Or I'm tired - will re-check tomorrow.

Funniest thing is - it is processed like that since at least 2011..

Good thing is - this code seems not to be executed
at least not on my 'ordinary' test configuration (WPA2, 2.5G N).

I will try to figure out - perhaps it can be safely 
removed (conditions for it's execution may be never never met).

Bad thing is - this driver(s) are probably full of bugs like that :/

M.
