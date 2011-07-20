From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Wed, 20 Jul 2011 08:59:46 +0000
Subject: Re: [patch net-next-2.6 v2] skbuff: fix error handling in
Message-Id: <1311152386.2338.8.camel@edumazet-HP-Compaq-6005-Pro-SFF-PC>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110720072343.GF6445@shale.localdomain>
	 <20110720085149.GI6445@shale.localdomain>
In-Reply-To: <20110720085149.GI6445@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: Shirley Ma <xma@us.ibm.com>, "David S. Miller" <davem@davemloft.net>, =?UTF-8?Q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

Le mercredi 20 juillet 2011 à 11:51 +0300, Dan Carpenter a écrit :
> There are two problems:
> 1) "n" was allocated with alloc_skb() so we should free it with
>    kfree_skb() instead of regular kfree().
> 2) We return the freed pointer instead of NULL.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Thanks Dan

Reviewed-by: Eric Dumazet <eric.dumazet@gmail.com>


