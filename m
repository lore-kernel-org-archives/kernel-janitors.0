From: "Gustavo F. Padovan" <gustavo@padovan.org>
Date: Fri, 23 Jul 2010 18:10:53 +0000
Subject: Re: [patch -next] bluetooth/hci_ath: kfree() => kfree_skb()
Message-Id: <20100723181053.GN2620@vigoh>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100723101104.GD26313@bicker>
In-Reply-To: <20100723101104.GD26313@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Suraj Sumangala <suraj@atheros.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

* Dan Carpenter <error27@gmail.com> [2010-07-23 12:11:04 +0200]:

> sk_buffs have to be freed with kfree_skb() instead of kfree().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/bluetooth/hci_ath.c b/drivers/bluetooth/hci_ath.c
> index 5ab258b..74a8f61 100755
> --- a/drivers/bluetooth/hci_ath.c
> +++ b/drivers/bluetooth/hci_ath.c
> @@ -163,7 +163,7 @@ static int ath_enqueue(struct hci_uart *hu, struct sk_buff *skb)
>  	struct ath_struct *ath = hu->priv;
>  
>  	if (bt_cb(skb)->pkt_type = HCI_SCODATA_PKT) {
> -		kfree(skb);
> +		kfree_skb(skb);
>  		return 0;
>  	}

Acked-by: Gustavo F. Padovan <padovan@profusion.mobi>

-- 
Gustavo F. Padovan
http://padovan.org
