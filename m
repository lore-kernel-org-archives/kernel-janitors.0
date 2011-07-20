From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Wed, 20 Jul 2011 07:42:03 +0000
Subject: Re: [patch] skbuff: use kfree_skb() instead of kfree()
Message-Id: <1311147723.3113.116.camel@edumazet-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110720072343.GF6445@shale.localdomain>
	 <20110720072549.GG6445@shale.localdomain>
In-Reply-To: <20110720072549.GG6445@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: Shirley Ma <xma@us.ibm.com>, "David S. Miller" <davem@davemloft.net>, =?UTF-8?Q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

Le mercredi 20 juillet 2011 à 10:25 +0300, Dan Carpenter a écrit :
> Crap.  Sorry, I shouldn't have sent that.  We shouldn't return the
> freed "n" here.  I'll send a v2 shortly.

Also, dont forget to say its a patch for net-next-2.6

The recommended way is to use 

[PATCH net-next-2.6] ...



