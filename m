From: David Miller <davem@davemloft.net>
Date: Sun, 12 Jun 2011 01:55:40 +0000
Subject: Re: [patch] netpoll: call dev_put() on error in netpoll_setup()
Message-Id: <20110611.185540.1098507377577815147.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110611155047.GA3583@shale.localdomain>
In-Reply-To: <20110611155047.GA3583@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: amwang@redhat.com, herbert@gondor.hengli.com.au, nhorman@tuxdriver.com, eric.dumazet@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Sat, 11 Jun 2011 18:50:47 +0300

> There is a dev_put(ndev) missing on an error path.  This was
> introduced in 0c1ad04aecb "netpoll: prevent netpoll setup on slave
> devices".
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> This is a static checker bug, and it's possible I've misunderstood
> something.

Definitely looks correct to me, applied, thanks!
