From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Tue, 17 Jan 2012 20:58:06 +0000
Subject: Re: [patch] inetpeer: initialize ->redirect_genid in inet_getpeer()
Message-Id: <1326833886.2606.6.camel@edumazet-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120117204843.GA20999@elgon.mountain>
	 <20120117.155231.1181293038505383400.davem@davemloft.net>
In-Reply-To: <20120117.155231.1181293038505383400.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: David Miller <davem@davemloft.net>
Cc: dan.carpenter@oracle.com, kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Le mardi 17 janvier 2012 à 15:52 -0500, David Miller a écrit :
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Date: Tue, 17 Jan 2012 23:48:43 +0300
> 
> > kmemcheck complains that ->redirect_genid doesn't get initialized.
> > Presumably it should be set to zero.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> It's a "don't care" until we actually get a redirect, but I've applied
> your patch nonetheless.
> 

;)


