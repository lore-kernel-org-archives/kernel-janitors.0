From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Sun, 30 May 2010 21:18:18 +0000
Subject: Re: Subject: [PATCH] net/ipv6: Use GFP_ATOMIC when a lock is held
Message-Id: <1275254298.2472.26.camel@edumazet-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005302147310.19253@ask.diku.dk>
	 <1275250288.2472.21.camel@edumazet-laptop>
	 <Pine.LNX.4.64.1005302248500.19253@ask.diku.dk>
	 <1275252912.2472.23.camel@edumazet-laptop>
	 <Pine.LNX.4.64.1005302303180.19253@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005302303180.19253@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia@diku.dk>
Cc: "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, "Pekka Savola (ipv6)" <pekkas@netcore.fi>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le dimanche 30 mai 2010 à 23:09 +0200, Julia Lawall a écrit :

> could exit with success without the kzalloc ever being called.  If the 
> kzalloc is moved up, it could fail and then it returns immediately without 
> executing the loop.  A solution could be to leave the NULL test on p where 
> it is, and only move up the kzalloc.  Or perhaps the change in behavior 
> doesn't matter?

If a GFP_KERNEL allocation fails, we are in a big trouble anyway :)

GFP_ATOMIC are more problematic in this area :)



