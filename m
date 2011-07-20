From: Dan Carpenter <error27@gmail.com>
Date: Wed, 20 Jul 2011 07:25:49 +0000
Subject: Re: [patch] skbuff: use kfree_skb() instead of kfree()
Message-Id: <20110720072549.GG6445@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110720072343.GF6445@shale.localdomain>
In-Reply-To: <20110720072343.GF6445@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shirley Ma <xma@us.ibm.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <eric.dumazet@gmail.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

Crap.  Sorry, I shouldn't have sent that.  We shouldn't return the
freed "n" here.  I'll send a v2 shortly.

regards,
dan carpenter

