From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 27 Sep 2019 16:09:09 +0000
Subject: Re: [PATCH] staging: rtl8192u: fix multiple memory leaks on error path
Message-Id: <02e4032a-d5f4-abfc-1d71-6a8d50554e40@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190920025137.29407-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190920025137.29407-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kangjie Lu <kjlu@umn.edu>, linux-kernel@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Nishka Dasgupta <nishkadg.linux@gmail.com>, Stephen A McCamant <smccaman@umn.edu>, Colin Ian King <colin.king@canonical.com>

> In rtl8192_tx on error handling path allocated urbs and also skb should
> be released.

Can this change description be improved?


How do you think about to add the tag “Fixes” here?


> @@ -1588,7 +1590,12 @@ short rtl8192_tx(struct net_device *dev, struct sk_buff *skb)
>  	RT_TRACE(COMP_ERR, "Error TX URB %d, error %d",
>  		 atomic_read(&priv->tx_pending[tcb_desc->queue_index]),
>  		 status);
> -	return -1;
> +
> +error:
> +	dev_kfree_skb_any(skb);
…

Would an other label be more appropriate according to the Linux coding style?

Regards,
Markus
